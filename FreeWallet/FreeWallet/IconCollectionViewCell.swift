//
//  IconCollectionViewCell.swift
//  FreeWallet
//
//  Created by César Alejandro Guadarrama Ortega on 22/08/23.
//

import UIKit

class IconCollectionViewCell: UICollectionViewCell {
    @IBOutlet var iconImage: UIImageView!
    
    
    func setup(with icon: Icon){
        iconImage.image = UIImage(named: icon.iconoPrincipal)
    }
}
