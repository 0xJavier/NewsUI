//
//  ContentView.swift
//  Shared
//
//  Created by Javier Munoz on 6/6/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var articles = [News]()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(articles) { article in
                        NewsCardView(news: article)
                    }
                }
            }
            .navigationTitle("NewsUI")
        }
        .task {
            articles = await NetworkManager.retrieveTrendingNews()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
