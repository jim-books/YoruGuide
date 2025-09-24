//
//  Song.swift
//  YoruGuide
//
//  Created by jimbook on 24/9/2025.
//

import Foundation

struct Song: Identifiable, Codable, Hashable, Sendable {
    let id: UUID
    let titleJP: String
    let titleRomaji: String
    let titleEN: String
    let notes: String?
    let trackNumber: Int?
    let releaseID: UUID
    
    init(
        id: UUID = UUID(),
        titleJP: String,
        titleRomaji: String,
        titleEN: String,
        notes: String? = nil,
        trackNumber: Int? = nil,
        releaseID: UUID
    ) {
        self.id = id
        self.titleJP = titleJP
        self.titleRomaji = titleRomaji
        self.titleEN = titleEN
        self.notes = notes
        self.trackNumber = trackNumber
        self.releaseID = releaseID
    }
    
    func title(for language: LanguagePreference) -> String {
        switch language {
        case .japanese: return titleJP
        case .romaji: return titleRomaji
        case .english: return titleEN
        }
    }
}
