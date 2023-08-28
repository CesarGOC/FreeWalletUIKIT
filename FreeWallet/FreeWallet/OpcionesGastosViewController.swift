//
//  OpcionesGastosViewController.swift
//  FreeWallet
//
//  Created by César Alejandro Guadarrama Ortega on 01/08/23.
//

import UIKit

class OpcionesGastosViewController: UIViewController {
    
    
    var nameOption: String? = ""
    var moneyActually: Double? = 0.0
    var divisaType: String? = ""
    var listaMovimientos: [Movimientos] = []
    
    
    @IBOutlet var labelTittle: UILabel!
    @IBOutlet var modifyButton: UIButton!
    @IBOutlet var labelMoney: UILabel!
    
    
    
    @IBAction func pressModify(_ sender: UIButton) {
        performSegue(withIdentifier: "modificarGasto", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "modificarGasto"{
            let vistaModificar = segue.destination as! ModificarViewController
            vistaModificar.nameModify = nameOption!
            vistaModificar.moneyModify = moneyActually!
            vistaModificar.divisaModify = divisaType!
        }
    }
    
   
    override func viewDidLoad(){
        super.viewDidLoad()
        modifyButton.frame = CGRect(x: 160, y: 200 , width: 110, height: 110)
        modifyButton.layer.cornerRadius = 0.5 * modifyButton.bounds.size.width
        modifyButton.layer.borderColor = UIColor.lightGray.cgColor
        modifyButton.layer.borderWidth = 1.0
        modifyButton.clipsToBounds = true
        
        labelTittle.text = nameOption
        labelMoney.text = String("$\(String(format: "%.2f", moneyActually!)) \(divisaType!)")
        
        if let indexGasto = listaGastos.firstIndex(where: { $0.name == nameOption }) {
            print("Gasto Encontrado:")
            listaMovimientos = listaGastos[indexGasto].movimientos
        }
        
        configureView()
        tableView.reloadData()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Aquí puedes actualizar o realizar acciones necesarias
        labelMoney.text = String("$\(String(format: "%.2f", moneyActually!)) \(divisaType!)")
        labelTittle.text = nameOption!
        
        if let indexGasto = listaGastos.firstIndex(where: { $0.name == nameOption }) {
            print("Gasto Encontrado:")
            listaMovimientos = listaGastos[indexGasto].movimientos
        }
        
        tableView.reloadData()
          
      }
    
    
    
    
    lazy var tableView : UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 80.0
        tableView.register(CustomCell.self, forCellReuseIdentifier: "\(CustomCell.self)")
        //tableView.register(HeaderSectionCell.self, forHeaderFooterViewReuseIdentifier: "\(HeaderSectionCell.self)")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private func configureView(){
        view.addSubview(tableView)
        var topPadding : CGFloat = 0.0
        if let topInset = UIApplication.shared.windows.first?.safeAreaInsets.top{
            topPadding = topInset
        }
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: topPadding+375.0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func getSafeAreaTop() -> CGFloat {
        let keyWindow = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows
            .filter({$0.isKeyWindow}).first
        return (keyWindow?.safeAreaInsets.top) ?? 0.0
    }
    
}
    
extension OpcionesGastosViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return IngresosModel.getList().count
        return listaMovimientos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(CustomCell.self)", for: indexPath) as? CustomCell else{
            return UITableViewCell()
        }
        let value = listaMovimientos[indexPath.row]
        cell.setDataMovimientos(value)
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let values = listaMovimientos
        //print("You tapped cell \(values[indexPath.row].name).")
    }
}


