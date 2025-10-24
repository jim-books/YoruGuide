//
//  EntityReference.swift
//  YoruGuide
//
//  Created by jimbook on 24/10/2025.
//

import Foundation

struct EntityReference: Codable, Identifiable {
    let id: UUID
    let type: EntityReferenceType
    let name: String
    
    enum EntityReferenceType: String, Codable {
        case release
        case song
    }
    
    init(release: Release) {
        self.id = release.id
        self.type = .release
        self.name = release.nameRomaji
    }
    
    init(song: Song) {
        self.id = song.id
        self.type = .song
        self.name = song.titleRomaji
    }
}
