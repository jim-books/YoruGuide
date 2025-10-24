//
//  YoruGuideModels.swift
//  YoruGuide
//
//  Created by jimbook on 15/10/2025.
//

import SwiftData
import Foundation

// MARK: - Core Models
@Model
final class Release {
    @Attribute(.unique) var id: UUID
    var nameJP: String
    var nameRomaji: String
    var nameEN: String
    var releaseDate: Date
    var typeRawValue: String
    var coverArtURL: String?
    var releaseDescription: String?
    
    @Relationship(deleteRule: .cascade, inverse: \Song.release)
    var songs: [Song] = []
    
    // Computed property for type
    var type: EntityType {
        get { EntityType(rawValue: typeRawValue) ?? .album }
        set { typeRawValue = newValue.rawValue }
    }
    
    init(
        nameJP: String = "",
        nameRomaji: String = "",
        nameEN: String = "",
        releaseDate: Date = .now,
        type: EntityType = .album,
        coverArtURL: String? = nil,
        description: String? = nil
    ) {
        self.id = UUID()
        self.nameJP = nameJP
        self.nameRomaji = nameRomaji
        self.nameEN = nameEN
        self.releaseDate = releaseDate
        self.typeRawValue = type.rawValue
        self.coverArtURL = coverArtURL
        self.releaseDescription = description
    }
    
    func name(for preference: LanguagePreference) -> String {
        switch preference {
        case .japanese: return nameJP
        case .romaji: return nameRomaji
        case .english: return nameEN.isEmpty ? nameRomaji : nameEN
        }
    }
    
    var isLatestRelease: Bool {
        let thirtyDaysAgo = Calendar.current.date(byAdding: .day, value: -30, to: Date()) ?? Date()
        return releaseDate >= thirtyDaysAgo
    }
    
    var songsOrderedByTrack: [Song] {
        songs.sorted { song1, song2 in
            guard let track1 = song1.trackNumber, let track2 = song2.trackNumber else {
                return song1.titleRomaji < song2.titleRomaji
            }
            return track1 < track2
        }
    }
}

@Model
final class Song {
    @Attribute(.unique) var id: UUID
    var titleJP: String
    var titleRomaji: String
    var titleEN: String
    var trackNumber: Int?
    var notes: String?
    var duration: TimeInterval
    
    @Relationship var release: Release?
    
    init(
        titleJP: String = "",
        titleRomaji: String = "",
        titleEN: String = "",
        trackNumber: Int? = nil,
        notes: String? = nil,
        duration: TimeInterval = 0
    ) {
        self.id = UUID()
        self.titleJP = titleJP
        self.titleRomaji = titleRomaji
        self.titleEN = titleEN
        self.trackNumber = trackNumber
        self.notes = notes
        self.duration = duration
    }
    
    func title(for preference: LanguagePreference) -> String {
        switch preference {
        case .japanese: return titleJP
        case .romaji: return titleRomaji
        case .english: return titleEN.isEmpty ? titleRomaji : titleEN
        }
    }
    
    var formattedDuration: String {
        let minutes = Int(duration) / 60
        let seconds = Int(duration) % 60
        return String(format: "%d:%02d", minutes, seconds)
    }
    
    var isSingle: Bool {
        release?.type == .single
    }
    
    var isInstrumental: Bool {
        titleEN.lowercased().contains("instrumental") ||
        titleJP.contains("インスト") ||
        notes?.lowercased().contains("instrumental") == true
    }
}

@Model
final class Bookmark {
    @Attribute(.unique) var id: UUID
    var songID: UUID
    var dateAdded: Date
    
    init(songID: UUID) {
        self.id = UUID()
        self.songID = songID
        self.dateAdded = Date()
    }
}

@Model
final class ChatMessage {
    @Attribute(.unique) var id: UUID
    var content: String
    var isUser: Bool
    var timestamp: Date
    private var entityReferencesData: Data?
    
    var entityReferences: [EntityReference] {
        get {
            guard let data = entityReferencesData else { return [] }
            return (try? JSONDecoder().decode([EntityReference].self, from: data)) ?? []
        }
        set {
            entityReferencesData = try? JSONEncoder().encode(newValue)
        }
    }
    
    init(
        content: String,
        isUser: Bool,
        entityReferences: [EntityReference] = []
    ) {
        self.id = UUID()
        self.content = content
        self.isUser = isUser
        self.timestamp = Date()
        self.entityReferences = entityReferences
    }
}
