//
//  MyCollectionViewCell.swift
//  Lab1-1
//
//  Created by Andrew Kurovskiy on 30.04.2021.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    @IBOutlet var myImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    public func configure(image: UIImage?) {
        myImageView.backgroundColor = .gray
        myImageView.image = image
    }
}

