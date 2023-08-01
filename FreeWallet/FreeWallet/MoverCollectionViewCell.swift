//
//  MoverCollectionViewCell.swift
//  FreeWallet
//
//  Created by César Alejandro Guadarrama Ortega on 31/07/23.
//

import UIKit

class MoverCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageItem: UIImageView!
    @IBOutlet var labelTittle: UILabel!
    
    
    func setup(with move: Move){
        imageItem.image = move.image
        labelTittle.text = move.name
    }
}
