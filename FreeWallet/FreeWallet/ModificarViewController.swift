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
    
    @IBAction func pressConfirmar(_ sender: UIButton) {
        var nameAuxI: String = ""
        var moneyAuxI: Double = 0.0
        var divisaAuxI: String = ""
        var nameAuxG: String = ""
        var moneyAuxG: Double = 0.0
        var divisaAuxG: String = ""
        
        if let indexIngreso = listaIngresos.firstIndex(where: { $0.name == nameModify }) {
            print("Ingreso encontrado:")
            listaIngresos[indexIngreso].name = textFieldNombre.text!
            listaIngresos[indexIngreso].move.name = textFieldNombre.text!
            nameAuxI = listaIngresos[indexIngreso].name
            listaIngresos[indexIngreso].money = Double(textFieldMonto.text!) ?? 0.0
            moneyAuxI = listaIngresos[indexIngreso].money
            listaIngresos[indexIngreso].divisa = textFieldMoneda.text!
            divisaAuxI = listaIngresos[indexIngreso].divisa
            
            
        } else if let indexGasto = listaGastos.firstIndex(where: { $0.name == nameModify }) {
            print("Gasto encontrado")
            listaGastos[indexGasto].name = textFieldNombre.text!
            listaGastos[indexGasto].move.name = textFieldNombre.text!
            nameAuxG = listaGastos[indexGasto].name
            listaGastos[indexGasto].money += Double(textFieldMonto.text!) ?? 0.0
            moneyAuxG = listaGastos[indexGasto].money
            listaGastos[indexGasto].divisa = textFieldMoneda.text!
            divisaAuxG = listaGastos[indexGasto].divisa
        } else {
            print("Elemento no encontrado en ningún arreglo.")
        }
        
        
        let viewControllerOpcionesIngresos = navigationController?.viewControllers.first(where: { $0 is OpcionesIngresosViewController }) as? OpcionesIngresosViewController
        viewControllerOpcionesIngresos?.nameOption = nameAuxI
        viewControllerOpcionesIngresos?.moneyActually = moneyAuxI
        viewControllerOpcionesIngresos?.divisaType = divisaAuxI
        
        let viewControllerOpcionesGastos = navigationController?.viewControllers.first(where: { $0 is OpcionesGastosViewController }) as? OpcionesGastosViewController
        viewControllerOpcionesGastos?.nameOption = nameAuxG
        viewControllerOpcionesGastos?.moneyActually = moneyAuxG
        viewControllerOpcionesGastos?.divisaType = divisaAuxG
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func switchTotal(_ sender: UISwitch) {
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
