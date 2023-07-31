//
//  CalculatorViewController.swift
//  CollectionViewsTest
//
//  Created by César Alejandro Guadarrama Ortega on 31/07/23.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet var labelSelect: UILabel!
    
    var nameSelect: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        labelSelect.text = nameSelect
    }
    
    

    

}
