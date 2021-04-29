//
//  ArticlesViewController.swift
//  Travelz
//
//  Created by claire.roughan on 26/04/2021.
//  Copyright © 2021 claire.roughan. All rights reserved.
//

import UIKit

class ArticlesViewController: UIViewController {
    
    // Mark: - Properties
    
    var articleListVM: ArticleListViewModel!
    let screenSize: CGRect = UIScreen.main.bounds
    
    @IBOutlet weak var propertyDetailsCollectionView: UICollectionView?
   
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "BackgroundColor")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        if self.isMovingFromParent {
            /// Clear articles data when returning home
           articleListVM = nil
        }
    }
}

extension ArticlesViewController: UICollectionViewDelegate, UICollectionViewDataSource   {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articleListVM.numberOfRowsInSection(section)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArticlesCell", for: indexPath) as! ArticlesCollectionViewCell

        cell.generateCell(articleListVM.articles[indexPath.row])
        return cell
    }
}

extension ArticlesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let cellHeight: CGFloat = 380.0
        return CGSize(width: screenSize.width, height: cellHeight)
    }
}
