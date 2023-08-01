//
//  ModificarViewController.swift
//  FreeWallet
//
//  Created by César Alejandro Guadarrama Ortega on 01/08/23.
//

import UIKit

class ModificarViewController: UIViewController {

    
    let divisa = ["MXN", "USD"]
    var nameModify: String? = ""
    var moneyModify: Double? = 0.0
    var divisaModify: String? = ""
    
    @IBOutlet var textFieldNombre: UITextField!
    @IBOutlet var textFieldMonto: UITextField!
    @IBOutlet var textFieldMoneda: UITextField!
    
    
    var pickerMoneda = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldMoneda.inputView = pickerMoneda
        
        pickerMoneda.delegate = self
        pickerMoneda.dataSource = self
        
        textFieldNombre.text = nameModify
        textFieldMonto.text = String(moneyModify!)
        textFieldMoneda.text = divisaModify
        
    }
}


extension ModificarViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    
    //numero de componentes
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // numero de ramas
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return divisa.count
    }
    
    //titulo de la row
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return divisa[row]
    }
    
    //asignacion en el textField
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textFieldMoneda.text = divisa[row]
        textFieldMoneda.resignFirstResponder()
    }
}
