//
//  NetworkManager.swift
//  NewsUI
//
//  Created by Javier Munoz on 6/7/22.
//

import Foundation

fileprivate let urlString = "https://newsapi.org/v2/top-headlines?country=us&apiKey="
fileprivate let apiKey = ""

final class NetworkManager {
    static func retrieveTrendingNews() async -> [News] {
        guard let url = URL(string: urlString+apiKey) else {
            print("Could not create URL from string")
            return []
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let newsResult = try JSONDecoder().decode(NewsResponse.self, from: data)
            return newsResult.articles
        } catch {
            return []
        }
    }
}
