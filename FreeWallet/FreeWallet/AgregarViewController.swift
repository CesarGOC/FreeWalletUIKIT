//
//  AgregarViewController.swift
//  FreeWallet
//
//  Created by César Alejandro Guadarrama Ortega on 21/08/23.
//

import UIKit

class AgregarViewController: UIViewController {
    
    let divisa = ["MXN", "USD"]
    var nameAdd: String = ""
    var moneyAdd: Double = 0.0
    var divisaAdd: String = ""
    var type: String = ""
    
    
    var pickerDivisa = UIPickerView()
    
    @IBOutlet var labeltype: UILabel!
    
    @IBOutlet var textFieldName: UITextField!
    @IBOutlet var textFieldMoney: UITextField!
    @IBOutlet var textFieldDivisa: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldDivisa.inputView = pickerDivisa
        
        pickerDivisa.delegate = self
        pickerDivisa.dataSource = self
        
        
        labeltype.text = type

    }
   
    @IBAction func pressConfirmar(_ sender: UIButton) {
        
        if validarCampos() == false{
            showAlert()
        }else{
            nameAdd = textFieldName.text!
            moneyAdd = Double(textFieldMoney.text!) ?? 0.0
            divisaAdd = textFieldDivisa.text!
            
            
            if type == "Ingreso"{
                listaIngresos.append(DataModel(type: "Ingreso", logoPic: "IMG_1979-2", logoPicMove: "IMG_1979-2", name: nameAdd, money: moneyAdd, divisa: divisaAdd, move: Move(name: nameAdd, image: UIImage(named: "IMG_2102-2"))))
            }else{
                listaGastos.append(DataModel(type: "Gasto", logoPic: "IMG_2072-2", logoPicMove: "IMG_2072-2", name: nameAdd, money: moneyAdd, divisa: divisaAdd, move: Move(name: nameAdd, image: UIImage(named: "IMG_2095-2"))))
            }
            
            navigationController?.popViewController(animated: true)
        }
        
    }
    
    
    func validarCampos()-> Bool{
        guard let name = textFieldName.text, !name.isEmpty, let money = textFieldMoney.text, !money.isEmpty, let divisa = textFieldDivisa.text, !divisa.isEmpty else{
            return false
        }
        return true
        
    }
    
}

extension AgregarViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    
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
        textFieldDivisa.text = divisa[row]
        textFieldDivisa.resignFirstResponder()
    }
    
    
    func showAlert(){
        let alert = UIAlertController(title: "Alert", message: "No llenaste todas las casillas", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        present(alert, animated: true)
    }
}
