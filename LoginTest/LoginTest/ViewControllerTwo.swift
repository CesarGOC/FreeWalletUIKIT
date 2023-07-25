//
//  ViewControllerTwo.swift
//  LoginTest
//
//  Created by César Alejandro Guadarrama Ortega on 25/07/23.
//

import UIKit

class ViewControllerTwo: UIViewController {

    @IBOutlet var userNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLabel.text = userName
        
    }
    


}
