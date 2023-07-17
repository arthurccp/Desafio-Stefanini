//
//  Parser.swift
//  Desafio-Gallery
//
//  Created by Arthur on 15/07/2023.
//  Copyright © 2023 Arthur. All rights reserved.
//

import Foundation

struct Parser {
    func parse(completion: @escaping (GalleryResponse) -> Void) {
        guard let url = URL(string: "https://api.imgur.com/3/gallery/search/?q=cats") else {
            print("URL inválida")
            return
        }
        
        var request = URLRequest(url: url)
        request.setValue("Client-ID 1ceddedc03a5d71", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Erro ao fazer a solicitação: \(error)")
                return
            }
            
            guard let data = data else {
                print("Nenhum dado retornado")
                return
            }
            
            do {
                let galleryResponse = try JSONDecoder().decode(GalleryResponse.self, from: data)
                let filteredData = self.filterData(galleryResponse.data)
                let modifiedResponse = GalleryResponse(data: filteredData, success: galleryResponse.success, status: galleryResponse.status)
                completion(modifiedResponse)
            } catch {
                print("Erro ao decodificar JSON: \(error)")
            }
            }.resume()
    }
    
    internal func filterData(_ data: [GalleryData]) -> [GalleryData] {
        return data.compactMap { galleryData in
            guard let images = galleryData.images else { return nil }
            
            let filteredImages = images.filter { $0.type.contains("image/") }
            
            return filteredImages.isEmpty ? nil : GalleryData(id: galleryData.id, title: galleryData.title, images: filteredImages)
        }
    }
}
