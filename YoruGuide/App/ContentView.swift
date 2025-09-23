//
//  ContentView.swift
//  YoruGuide
//
//  Created by jimbook on 10/9/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            DiscographyView()
                .tabItem {
                    Label("Discography", systemImage: "music.note.list")
                }
                .tag(0)
            
            BookmarkView()
                .tabItem {
                    Label("Bookmarks", systemImage: "heart.fill")
                }
                .tag(1)
            
            AIView()
                .tabItem {
                    Label("AI Guide", systemImage: "brain.head.profile")
                }
                .tag(2)

            SettingView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
                .tag(3)
            
        }
    }
}

#Preview {
    ContentView()
}
