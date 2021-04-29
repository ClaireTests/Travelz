//
//  HomeViewController.swift
//  Travelz
//
//  Created by claire.roughan on 26/04/2021.
//  Copyright © 2021 claire.roughan. All rights reserved.
//

import UIKit
import Network

class HomeViewController: UIViewController {
    
    // Mark: - Properties
    
    private var articleListVM: ArticleListViewModel!

    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "InternetConnectionMonitor")
    
    var activityIndicatorView: DataLoadingIndicatorView!
    var loadingView: UIView!
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Travelz"
        label.textAlignment = .center
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 80.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let showArticlesButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor( .white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 50.0)
        button.setTitle("Explore", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let planeImage : UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFit
        imageview.image = UIImage(named: "planeIcon")
        imageview.clipsToBounds = true
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()

    // MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        /// Reset the ViewModel
        articleListVM = nil

        /// Hide the navigation bar on the this view controller
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        /// Show the navigation bar on other view controllers
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        planeFlightAnimation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "homeBackground")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
        
        let backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButtonItem
        navigationItem.backBarButtonItem?.tintColor = UIColor.white
      
        setupView()
        moitorNetwork()
    }
 
    
    private func setupView() {
        view.addSubview(headerLabel)
        view.addSubview(showArticlesButton)
        view.addSubview(planeImage)
        
        showArticlesButton.isHidden = true
        styleButton(showArticlesButton)
            
        showArticlesButton.addTarget(self, action: #selector(showArticlesButtonAction), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            headerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            headerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            showArticlesButton.heightAnchor.constraint(equalToConstant: 70),
            showArticlesButton.widthAnchor.constraint(equalToConstant: 200),
            showArticlesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showArticlesButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -35),
            
            planeImage.heightAnchor.constraint(equalToConstant: 150),
            planeImage.widthAnchor.constraint(equalToConstant: 120),
            planeImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -150),
            planeImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
        ])
        
        view.addSubview(planeImage)
    }

    // MARK: - Helpers
    
    private func styleButton(_ view: UIButton) {
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.cornerRadius = 10
    }

    private func showAlert() {
        let alert = UIAlertController(title: NO_INTERNET_TITLE, message: NO_INTERNET_SUBTITLE, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    private func moitorNetwork() {
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                print("Have Internet")
                
                DispatchQueue.main.async {
                   self.showArticlesButton.isHidden = false
                }
            } else {
                print("Have NO Internet")
   
                DispatchQueue.main.async {
                    if !self.showArticlesButton.isHidden  {
                       self.showArticlesButton.isHidden = true
                    }
                    self.showAlert()
                }
            }
            
        }
        let queue = DispatchQueue(label: "Network")
        monitor.start(queue: queue)
    }
    
    private func setupDataLoadingView() {
        showArticlesButton.isHidden = true
        
        loadingView = UIView.init(frame: self.view.frame)
        loadingView?.backgroundColor = .clear
        view.addSubview(loadingView!)
       
        activityIndicatorView = DataLoadingIndicatorView(title: "Loading data...",
                                                              center: view.center,
                                                              bgColour:  UIColor(named: "LoadingBackgroundColor")!,
                                                              textColour:UIColor.white)
        
        loadingView?.addSubview((self.activityIndicatorView?.getViewActivityIndicator())!)
        activityIndicatorView?.startAnimating()
    }
    
    private func removeDataLoadingView() {
        activityIndicatorView.stopAnimating()
        activityIndicatorView.removeFromSuperview()
        loadingView.removeFromSuperview()
        loadingView = nil
        activityIndicatorView = nil
    }
    
    func planeFlightAnimation() {
        let screenSize: CGRect = UIScreen.main.bounds

            //.repeat calculationModeLinear
        UIView.animateKeyframes(withDuration: 6, delay: 0, options: .repeat, animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 3.5, animations: {
                  self.planeImage.frame.origin.y += screenSize.height - 220
                  self.planeImage.frame.origin.x +=  screenSize.width - 120
            })

            UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 2.5, animations: {
                self.planeImage.frame.origin.x += screenSize.width + self.planeImage.frame.maxY
                self.planeImage.frame.origin.y -= screenSize.height - 150 /*- 550*/
            })
           }, completion: nil )
    }
   
    
    // MARK: - Actions
    
    @objc func showArticlesButtonAction(sender: UIButton!) {
       
        setupDataLoadingView()

        Webservice.getDataWith { (result) in
        switch result {
            case .success(let articles):
                self.articleListVM = ArticleListViewModel(articles: articles.data!)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                   if self.activityIndicatorView != nil {
                       if self.view.subviews.contains(self.loadingView) {
                           self.removeDataLoadingView()
                           self.showArticlesButton.isHidden = false
                       }
                   }
                   self.performSegue(withIdentifier: "ArticlesSegue", sender: nil)
               }
            
            case .failure(let error):
                print("Failed to fetch properties details", error)
            }
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if let vc = segue.destination as? ArticlesViewController {
           vc.articleListVM = articleListVM
        }
    }
    
}
