//
//  MoveCollectionViewCell.swift
//  CollectionViewsTest
//
//  Created by César Alejandro Guadarrama Ortega on 27/07/23.
//

import UIKit

class MoveCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var ingresoGastoImageView: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    
    
    func setup(with move: Move){
        ingresoGastoImageView.image = move.image
        nameLabel.text = move.name
    }
}
