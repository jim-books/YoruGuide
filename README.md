# 🎶 YoruGuide  
_A fan-created Yorushika Gallery App_

![Demo Screenshot](./PromotionalMaterials/screenshot.png)

---

## 📖 Overview  

**YoruGuide** is a personal passion project to build an iOS & visionOS showcase app.  
It presents the discography of **Yorushika (ヨルシカ)** — including songs, albums, translations, and additional trivia.  

This project serves two purposes:  

1. **Engineering Showcase** — practice SwiftUI, SwiftData, and visionOS development, with a strong focus on clean architecture and cross‑platform patterns.  
2. **Personal Tribute** — organize and visualize Yorushika’s music in a structured, user‑friendly digital gallery.  

⚠️ Disclaimer: This project is **fan‑made and non‑commercial**. All original music and creative rights belong to Yorushika and their official publishers.  

---

## 🎯 Goals  

- Build a scalable **data‑driven iOS app** (SwiftUI + SwiftData)  
- Explore **visionOS** by creating an immersive 3D gallery experience with RealityKit  
- Practice **cross‑platform modular architecture** between iOS and visionOS targets  
- Demonstrate engineering craft on GitHub, LinkedIn, and developer communities  

---

## 🗂 Data Model  

The core dataset is sourced from [Yorushika Song Spreadsheet (Google Sheets)](https://docs.google.com/spreadsheets/d/1sqwarEZIDQo4eTnnnQaQb0RgZJGdZrW8hEp8WbfVDlQ)  
and extended with additional **trivia annotations** (fan notes, creative insights).  

**Core entities:**

```swift
struct Song: Identifiable {
    let id: UUID
    let titleJP: String
    let titleRomaji: String
    let titleEN: String
    let album: String
    let notes: String?
    let isInstrumental: Bool
}

struct Album: Identifiable {
    let id: UUID
    let nameJP: String
    let nameRomaji: String
    let nameEN: String
    let year: Int
}
```

---

## 🛠 Tech Stack  

- **Swift / SwiftUI** — UI architecture  
- **SwiftData / Core Data** — persistent storage (favorites / custom notes)  
- **visionOS + RealityKit** — immersive gallery environment  
- **MVVM Architecture** — structured app layer separation  
- **Xcode 15+ / iOS 17+**  

---

## 📱 Features  

### iOS  
- Song & Album list (by album sections)  
- Multi‑keyword **search** (Japanese, Romaji, English)  
- Song detail page with **trivia & fan notes**  
- **Favorites** feature using SwiftData  

### visionOS  
- 3D **album gallery wall**  
- Gesture‑based song exploration  
- Immersive presentation of song/album relationships  

---

## 🚀 Getting Started  

1. Clone repository  
   ```bash
   git clone https://github.com/jim-books/YoruGuide.git
   cd YoruGuide
   ```
2. Open with **Xcode 15+**  
3. Run on iOS Simulator (iOS 17+) or **visionOS Simulator**  

---

## 🏗 Architecture Highlights  

- **Data Layer**  
  - JSON seed → SwiftData persistent store  
  - Easy migration for future external sources  

- **Domain Layer**  
  - Decoupled `SongRepository` for both iOS & visionOS targets  
  - Unit‑testable parsing logic  

- **Presentation Layer (SwiftUI)**  
  - `SongListView`, `AlbumView`, `SongDetailView`  
  - Shared components across iOS & visionOS  

- **visionOS XR Layer**  
  - RealityKit scene for spatial album browsing  
  - Interaction model: tap album → spawn song list floating window  

---

## 🧩 Engineering Challenges  

- Efficiently handling multilingual data (Japanese / Romaji / English) in **search & indexing**  
- Synchronizing **trivia annotations** across data seeds and Core Data records  
- Designing **cross‑target code reuse** between iOS and visionOS  
- Building a **lightweight data pipeline** (Google Sheets → JSON → in‑app seed)  

---

## 🎥 Demo  

- iOS: song browsing & favorites  
- visionOS: 3D album gallery with interactive panels  

*(Attach screen recordings or GIFs here)*  

---

## 🙌 Credits  

- **Yorushika** — the inspiration and all musical works  
- **Community translators & fans** — spreadsheet data source  
- **Created by [Your Name](https://linkedin.com/in/jimmyhkh) as a showcase of SwiftUI & visionOS engineering  

---

## 🛤 Roadmap  

- [ ] Extend trivia database with richer notes  
- [ ] Implement cross‑device sync with iCloud  
- [ ] Explore advanced **spatial UI** for song relationship mapping  
- [ ] Write technical blog: *"How to Manage 100+ Song Objects with SwiftData and visionOS"*  

---
