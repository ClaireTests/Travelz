//
//  ArticleListViewModel.swift
//  Travelz
//
//  Created by claire.roughan on 27/04/2021.
//  Copyright © 2021 claire.roughan. All rights reserved.
//

import Foundation

struct ArticleListViewModel {
    var articles: [Article]
}

extension ArticleListViewModel {
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.articles.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let article = self.articles[index]
        return ArticleViewModel(article)
    }
    
}

struct ArticleViewModel {
    private let article: Article
}

extension ArticleViewModel {
    init(_ article: Article) {
        self.article = article
    }
}

extension ArticleViewModel {
    
    var creationDate: String {
        return (self.article.metaData?.creationTime)!
    }
   
    var title: String {
        return self.article.title!
    }
    
    var imageURL: String {
        return self.article.imageUrl!
    }
    
    var category: String {
        return self.article.category!
    }
    
    var authorName: String {
        return (self.article.author?.authorName)!
    }
    
    var authorAvatar: String {
        return (self.article.author?.authorAvatar?.imageUrl)!
    }
    
    var isSaved: Bool {
        return self.article.isSaved!
    }
    
    var isLiked: Bool {
        return self.article.isLiked!
    }
    
    var likesCount: Int {
        return self.article.likesCount!
    }
}

