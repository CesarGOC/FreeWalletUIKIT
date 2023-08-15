//
//  CalculadoraViewController.swift
//  FreeWallet
//
//  Created by César Alejandro Guadarrama Ortega on 02/08/23.
//

import UIKit

class CalculadoraViewController: UIViewController {
    
    var nameCalculate: String? = ""
    var moneyCalculate: Double? = 0.0
    var nameSelectMove: String? = ""
    var divisaClculate: String? = ""
    
    var allOptions: [DataModel] = []
    
    
    
    
    
    var valorAnteriorDouble: Double? = 0.0
    var valorAnteriorInt: Int? = 0
    

    @IBOutlet var labelResult: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelResult.text = "0"
        
    }
    
    
    
    
    
    // funcion para pasmar el numero en la etiqueta
    func pressNumber(number: String){
        var aux: String = ""
        if labelResult.text == "0"{
            labelResult.text = number
        }else{
            aux = labelResult.text!
            labelResult.text = aux + number
        }
    }
    
    // funcion  que asigna el limite de numeros introducidos
    func limite(){
        if labelResult.text?.count ?? 0 >= 14{
            if ((labelResult.text?.contains(".")) == true){
                valorAnteriorDouble = Double(labelResult.text!) ?? 0.0
                labelResult.text = "MAX"
            }else{
                valorAnteriorInt = Int(labelResult.text!) ?? 0
                labelResult.text = "MAX"
            }
        }
    }
    
    //Fucniones de los potones de numeros
    
    @IBAction func press9(_ sender: UIButton) {
        if labelResult.text != "MAX"{
            pressNumber(number: "9")
            limite()
        }
    }
    @IBAction func press8(_ sender: UIButton) {
        if labelResult.text != "MAX"{
            pressNumber(number: "8")
            limite()
        }
    }
    @IBAction func press7(_ sender: UIButton) {
        if labelResult.text != "MAX"{
            pressNumber(number: "7")
            limite()
        }
    }
    @IBAction func press6(_ sender: UIButton) {
        if labelResult.text != "MAX"{
            pressNumber(number: "6")
            limite()
        }
    }
    @IBAction func press5(_ sender: UIButton) {
        if labelResult.text != "MAX"{
            pressNumber(number: "5")
            limite()
        }
    }
    @IBAction func press4(_ sender: UIButton) {
        if labelResult.text != "MAX"{
            pressNumber(number: "4")
            limite()
        }
    }
    @IBAction func press3(_ sender: UIButton) {
        if labelResult.text != "MAX"{
            pressNumber(number: "3")
            limite()
        }
    }
    @IBAction func press2(_ sender: UIButton) {
        if labelResult.text != "MAX"{
            pressNumber(number: "2")
            limite()
        }
    }
    @IBAction func press1(_ sender: UIButton) {
        if labelResult.text != "MAX"{
            pressNumber(number: "1")
            limite()
        }
    }
    @IBAction func press0(_ sender: UIButton) {
        if labelResult.text != "MAX"{
            pressNumber(number: "0")
            limite()
        }
    }
    @IBAction func pressDot(_ sender: UIButton) {
        var aux: String
        if ((labelResult.text?.contains(".")) != true) {
            if labelResult.text == "0"{
                labelResult.text = "0."
            }
            aux = labelResult.text!
            labelResult.text = aux + "."
        }
    }
    
    
    @IBAction func pressAC(_ sender: UIButton) {
        labelResult.text = "0"
    }
    
    //funcion que elimina un caracter de la etiqueta
    @IBAction func pressEliminate(_ sender: UIButton) {
        var aux: String
        if labelResult.text != "0"{
            if labelResult.text == "MAX"{
                if valorAnteriorInt != 0{
                    aux = String(valorAnteriorInt!)
                    labelResult.text = String(aux.dropLast(1))
                }
                if valorAnteriorDouble != 0.0{
                    aux = String(valorAnteriorDouble!)
                    labelResult.text = String(aux.dropLast(1))
                }
                valorAnteriorInt = 0
                valorAnteriorDouble = 0.0
            }
            aux = labelResult.text!
            labelResult.text = String(aux.dropLast(1))
            valorAnteriorInt = 0
            valorAnteriorDouble = 0.0
        }
        
    }
    
    @IBAction func pressEnter(_ sender: UIButton) {
        let ingreso: Double = Double(labelResult.text!) ?? 0.0
        
        if nameSelectMove == "" {
            
            ingresarDinero(nombreSelect : nameCalculate!,nombreAnterior: nil, ingreso: ingreso)
            let resultado = buscarIngreso(nombreIngreso: nameCalculate!)
            let viewControllerOpciones = navigationController?.viewControllers.first(where: { $0 is OpcionesIngresosViewController }) as? OpcionesIngresosViewController
            viewControllerOpciones?.moneyActually = resultado
        }else{
            if moneyCalculate != 0{
                
                ingresarDinero(nombreSelect: nameSelectMove!,nombreAnterior: nameCalculate, ingreso: ingreso)
                let resultado = buscarIngreso(nombreIngreso: nameCalculate!)
                let viewControllerMover = navigationController?.viewControllers.first(where: { $0 is MoverViewController }) as? MoverViewController
                viewControllerMover?.moneyTitle = resultado
            }
        }
        nameCalculate = ""
        nameSelectMove = ""
        
        navigationController?.popViewController(animated: true)
        
    }
    
    func ingresarDinero(nombreSelect: String, nombreAnterior: String?, ingreso: Double){
        
        
        if let indexIngreso = listaIngresos.firstIndex(where: { $0.name == nombreSelect }) {
            print("IngresoEncontrado:")
            listaIngresos[indexIngreso].money += ingreso
            if let indexIngresoAux = listaIngresos.firstIndex(where: { $0.name == nombreAnterior }) {
                listaIngresos[indexIngresoAux].money -= ingreso
            }
            
        } else if let indexGasto = listaGastos.firstIndex(where: { $0.name == nombreSelect }) {
            print("Gasto encontrado")
            listaGastos[indexGasto].money += ingreso
            if let indexIngresoAux = listaIngresos.firstIndex(where: { $0.name == nombreAnterior }) {
                listaIngresos[indexIngresoAux].money -= ingreso
            }
        } else {
            print("Elemento no encontrado en ningún arreglo.")
        }
    }
    
    func buscarIngreso(nombreIngreso: String) -> Double{
        var resultado: Double = 0.0
        if let indexIngreso = listaIngresos.firstIndex(where: { $0.name == nombreIngreso}) {
            print("IngresoEncontrado:")
            resultado = listaIngresos[indexIngreso].money
        }
        return resultado
    }
    
    
}


