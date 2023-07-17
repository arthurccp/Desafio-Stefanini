//
//  ImageDetailViewController.swift
//  Desafio-Gallery
//
//  Created by Arthur on 15/07/2023.
//  Copyright © 2023 Arthur. All rights reserved.
//

import UIKit

class ImageDetailViewController: UIViewController {
    
    var image: UIImage?
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureImageView()
    }
    
    private func configureImageView() {
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = image ?? UIImage(named: "placeholderImage")
    }
}
