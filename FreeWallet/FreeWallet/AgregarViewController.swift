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
    var iconAdd:  String = "IMG_2102-2"
    var iconMoveAdd: String = "IMG_2102-2"
    
    
    var pickerDivisa = UIPickerView()
    @IBOutlet var imageButton: UIButton!
    
    @IBOutlet var labeltype: UILabel!
    
    @IBOutlet var textFieldName: UITextField!
    @IBOutlet var textFieldMoney: UITextField!
    @IBOutlet var textFieldDivisa: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldDivisa.inputView = pickerDivisa
        
        pickerDivisa.delegate = self
        pickerDivisa.dataSource = self
        
        
        
        if let imagen = UIImage(named: iconAdd){
            let tamañoDeseado = CGSize(width: 100, height: 100)
               
               // Redimensionar la imagen al tamaño deseado
               let imagenRedimensionada = UIGraphicsImageRenderer(size: tamañoDeseado).image { _ in
                   imagen.draw(in: CGRect(origin: .zero, size: tamañoDeseado))
               }
            imageButton.setImage(imagenRedimensionada, for: .normal)
            
        }
        labeltype.text = type

    }
    
    
    //caundo se carga la vista por segunda vez hasta N veces
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let imagen =  UIImage(named: iconAdd){
            let tamañoDeseado = CGSize(width: 100, height: 100)
               
               // Redimensionar la imagen al tamaño deseado
               let imagenRedimensionada = UIGraphicsImageRenderer(size: tamañoDeseado).image { _ in
                   imagen.draw(in: CGRect(origin: .zero, size: tamañoDeseado))
               }
            imageButton.setImage(imagenRedimensionada, for: .normal)
            
        }
       
    }
   
    @IBAction func pressSelectImage(_ sender: UIButton) {
        print("Se presiono boton de imagen")
        performSegue(withIdentifier: "agregarIcon", sender: nil)
        
    }
    @IBAction func pressConfirmar(_ sender: UIButton) {
        
        if validarCampos() == false{
            showAlert()
        }else{
            nameAdd = textFieldName.text!
            moneyAdd = Double(textFieldMoney.text!) ?? 0.0
            divisaAdd = textFieldDivisa.text!
            
            
            if type == "Ingreso"{
                listaIngresos.append(DataModel(type: "Ingreso", logoPic: iconAdd, logoPicMove: "IMG_1979-2", name: nameAdd, money: moneyAdd, divisa: divisaAdd, move: Move(name: nameAdd, image: iconMoveAdd)))
            }else{
                listaGastos.append(DataModel(type: "Gasto", logoPic: iconAdd, logoPicMove: "IMG_2072-2", name: nameAdd, money: moneyAdd, divisa: divisaAdd, move: Move(name: nameAdd, image: "IMG_2102-2")))
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
