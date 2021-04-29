//
//  ArticlesCollectionViewCell.swift
//  Travelz
//
//  Created by claire.roughan on 26/04/2021.
//  Copyright © 2021 claire.roughan. All rights reserved.
//

import UIKit

class ArticlesCollectionViewCell: UICollectionViewCell {

    //MARK: - IBOutlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var savedImageView: UIImageView!
    @IBOutlet weak var likesImageView: UIImageView!
    @IBOutlet weak var likesCountLabel: UILabel!
    @IBOutlet weak var authorAvatarImageView: UIImageView!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    //MARK: - Cell Setup
    
    func generateCell(_ article: Article) {
        
        categoryLabel.text = article.category
        categoryLabel.textColor = UIColor(named: "TextColor")
        titleLabel.text = article.title
        titleLabel.adjustsFontSizeToFitWidth = true
        articleImageView.loadImageUsingCache(withUrl: article.imageUrl!)

        let savedStatus = article.isSaved! ? UIImage(named: "saved")! : UIImage(named: "save")!
        savedImageView.image = savedStatus
        
        if article.likesCount! > 0 {
            likesImageView.image = UIImage(named: "liked")!
        } else {
            likesImageView.image = UIImage(named: "like")!
        }
        likesCountLabel.text = String(describing:article.likesCount!)
        
        authorAvatarImageView.loadImageUsingCache(withUrl: (article.author?.authorAvatar?.imageUrl)!)
        authorAvatarImageView.setRounded()
        authorNameLabel.text = article.author?.authorName
        authorNameLabel.textColor = UIColor(named: "TextColor")
        
        let creationDate = Date.stringToDate(string: (article.metaData?.creationTime)!, withFormat: "yyyy-MM-dd'T'HH:mm:ss.SSSZ")
        dateLabel.text = Date.dateToString(date: creationDate, withFormat: "dd MMM, yyyy")
    }
    
}
