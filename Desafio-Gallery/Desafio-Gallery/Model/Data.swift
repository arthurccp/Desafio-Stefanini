//
//  Data.swift
//  Desafio-Gallery
//
//  Created by Arthur on 15/07/2023.
//  Copyright © 2023 Arthur. All rights reserved.
//

import Foundation

struct GalleryResponse: Codable {
    let data: [GalleryData]
    let success: Bool
    let status: Int
}

struct GalleryData: Codable {
    let id: String
    let title: String?
    let images: [Image]?
}

struct Image: Codable {
    let id: String
    let type: String
    let link: String?
}
