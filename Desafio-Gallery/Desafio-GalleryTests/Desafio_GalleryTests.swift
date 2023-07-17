//
//  Desafio_GalleryTests.swift
//  Desafio-GalleryTests
//
//  Created by Arthur on 17/07/2023.
//  Copyright © 2023 Arthur. All rights reserved.
//

import XCTest
@testable import Desafio_Gallery

class Desafio_GalleryTests: XCTestCase {
    
    func testFilterData() {
        let imageData = Image(id: "1", type: "image/jpeg", link: "http://example.com/image1.jpg")
        let galleryData = GalleryData(id: "1", title: "Gallery 1", images: [imageData])
        let inputData = [galleryData]
        let parser = Parser()
        
        let filteredData = parser.filterData(inputData)
        
        XCTAssertEqual(filteredData.count, 1) // Verifica se há um item filtrado
        XCTAssertEqual(filteredData[0].images?.count, 1) // Verifica se há apenas 1 imagem no item filtrado
        XCTAssertEqual(filteredData[0].images?[0].type, "image/jpeg") // Verifica se o tipo da imagem filtrada está correto
        XCTAssertEqual(filteredData[0].images?[0].link, "http://example.com/image1.jpg") // Verifica se o link da imagem filtrada está correto
    }
    
    
    
    func testParserParsing() {
        let parser = Parser()
        let expectation = self.expectation(description: "Parsing completed")
        
        parser.parse { galleryResponse in
            XCTAssertNotNil(galleryResponse)
            XCTAssertTrue(galleryResponse.data.count > 0)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
}
