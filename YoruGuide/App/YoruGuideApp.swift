//
//  YoruGuideApp.swift
//  YoruGuide
//
//  Created by jimbook on 10/9/2025.
//

import SwiftUI

@main
struct YoruGuideApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        
        #if os(visionOS)
        ImmersiveSpace(id: "AlbumGallery") {
            AlbumGalleryView()
        }
        #endif
        
    }
}
