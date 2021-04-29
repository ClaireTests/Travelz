//
//  DataLoadingIndicatorView.swift
//  Travelz
//
//  Created by claire.roughan on 26/04/2021.
//  Copyright © 2021 claire.roughan. All rights reserved.
//

import Foundation
import UIKit

class DataLoadingIndicatorView: UIView {

    // Mark: - Properties
    
    let view: UIView!
    let activityIndicator: UIActivityIndicatorView!
    var title: String!
    
     // MARK: - Lifecycle
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(title: String, center: CGPoint, width: CGFloat = 250.0, height: CGFloat = 50.0, bgColour: UIColor, textColour:UIColor) {
        self.title = title
        
        let x = center.x - width/2.0
        let y = center.y - height/2.0
        
        view = UIView(frame: CGRect(x: x, y: y, width: width, height: height))
        view.backgroundColor = bgColour
        view.layer.cornerRadius = 10
        
        activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        activityIndicator.color = UIColor.white
        activityIndicator.hidesWhenStopped = false
        
        let titleLabel = UILabel(frame: CGRect(x: 60, y: 0, width: 200, height: 50))
        titleLabel.text = title
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        titleLabel.textColor = textColour
        
        view.addSubview(activityIndicator)
        view.addSubview(titleLabel)
        
        super.init(frame: view.frame)
    }
    
    func getViewActivityIndicator() -> UIView {
        return self.view
    }
    
    // MARK: - Activity Indicator
    
    func startAnimating() {
        self.activityIndicator.startAnimating()
       
    }
    
    func stopAnimating() {
        self.activityIndicator.stopAnimating()
        self.view.removeFromSuperview()
    }
}
