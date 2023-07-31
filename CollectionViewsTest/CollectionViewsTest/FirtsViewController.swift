//
//  FirtsViewController.swift
//  CollectionViewsTest
//
//  Created by César Alejandro Guadarrama Ortega on 31/07/23.
//

import UIKit

class FirtsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
  
    @IBAction func pressNext(_ sender: UIButton) {
        performSegue(withIdentifier: "nextView", sender: sender)
    }
    
}
