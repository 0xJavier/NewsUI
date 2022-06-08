//
//  News.swift
//  NewsUI
//
//  Created by Javier Munoz on 6/7/22.
//

import Foundation

struct Source: Codable {
    let id: String?
    let name: String?
    
    private enum CodingKeys : String, CodingKey { case id, name }
}

struct News: Codable, Identifiable {
    var id = UUID()
    let source: Source
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    
    private enum CodingKeys : String, CodingKey {
        case source, author, title, description, url, urlToImage, publishedAt
    }
}

struct NewsResponse: Codable {
    let articles: [News]
}

extension News {
    static let exampleNews: News = .init(
        id: UUID(),
        source: Source(id: "the-wall-street-journal", name: "The Wall Street Journal"),
        author: "Zusha Elinson and Christine Mai-Duc",
        title: "San Francisco District Attorney Chesa Boudin Faces Recall Election - The Wall Street Journal",
        description: "A defeat after two years in office would be a blow to the progressive prosecutors movement. Separately, voters in Los Angeles will consider the race for mayor.",
        url: "https://www.wsj.com/articles/san-francisco-district-attorney-chesa-boudin-faces-recall-election-11654603200",
        urlToImage: "https://images.wsj.net/im-559049/social",
        publishedAt: "2022-06-07T23:19:00Z"
    )
}
