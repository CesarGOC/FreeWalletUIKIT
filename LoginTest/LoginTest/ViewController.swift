//
//  ViewController.swift
//  LoginTest
//
//  Created by César Alejandro Guadarrama Ortega on 25/07/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    @IBOutlet var singInButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        singInButton.layer.cornerRadius = 5
        singInButton.backgroundColor = .systemPink
        singInButton.tintColor = UIColor.systemPink
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    @IBAction func pressSingInbutton(_ sender: UIButton) {
        performSegue(withIdentifier: "VistaDos", sender: nil)
        userName = textField.text ?? "user"
        
    }
    
    
          
}

