//
//  NewsCardView.swift
//  NewsUI
//
//  Created by Javier Munoz on 6/8/22.
//

import SwiftUI

struct NewsCardView: View {
    
    let news: News
    let backgroundColor = Color.init(uiColor: .secondarySystemBackground)
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: news.urlToImage ?? "")) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 350, height: 200)
                    .clipped()
            } placeholder: {
                ProgressView().frame(height: 200)
            }
            
            VStack(alignment: .leading, spacing: 16) {
                Text(news.source.name ?? "Source Name")
                    .font(.headline)
                    .foregroundColor(.secondary)
                
                Text(news.title ?? "Title")
                    .font(.headline)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .lineLimit(3)
                
                Text(news.description ?? "No Preview")
                    .font(.body)
                    .lineLimit(2)
                
                Text("Written by \(news.author ?? "Author")".uppercased())
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Text("Published \(news.publishedAt ?? "Date")".uppercased())
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 2)
        )
        .padding()
    }
}

struct NewsCardView_Previews: PreviewProvider {
    static var previews: some View {
        NewsCardView(news: News.exampleNews)
    }
}
