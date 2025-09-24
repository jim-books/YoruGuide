//
//  Enums.swift
//  YoruGuide
//
//  Created by jimbook on 24/9/2025.
//

import Foundation

enum LanguagePreference: String, CaseIterable, Codable {
    case japanese = "JP"
    case romaji = "Romaji"
    case english = "EN"
    
    var displayName: String {
        return rawValue
    }
}

enum EntityType: String, CaseIterable, Codable {
    case song = "SONG"
    case single = "SINGLE"
    case ep = "EP"
    case album = "ALBUM"
    case miniAlbum = "MINI_ALBUM"
    case live = "LIVE"
    
    var displayName: String {
        switch self {
        case .song: return "Song"
        case .single: return "Single"
        case .ep: return "EP"
        case .album: return "Album"
        case .miniAlbum: return "Mini Album"
        case .live: return "Live"
        }
    }
    
    var icon: String {
        switch self {
        case .song: return "music.note"
        case .single: return "music.note.list"
        case .ep: return "opticaldisc"
        case .album: return "rectangle.stack"
        case .miniAlbum: return "rectangle.stack.badge.minus"
        case .live: return "mic"
        }
    }
    
    var isAlbumType: Bool {
        switch self {
        case .song, .single:
            return false
        case .ep, .album, .miniAlbum, .live:
            return true
        }
    }
    
    var displaySuffix: String {
        switch self {
        case .song: return ""
        case .single: return "[Single]"
        case .ep: return "[EP]"
        case .album: return "[Album]"
        case .miniAlbum: return "[Mini-Album]"
        case .live: return "[Live]"
        }
    }
}
