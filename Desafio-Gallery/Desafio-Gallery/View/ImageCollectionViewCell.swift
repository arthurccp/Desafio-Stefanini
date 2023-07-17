//
//  ImageCollectionViewCell.swift
//  Desafio-Gallery
//
//  Created by Arthur on 15/07/2023.
//  Copyright © 2023 Arthur. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
  
    @IBOutlet var imageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
}
