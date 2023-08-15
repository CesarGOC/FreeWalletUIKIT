//
//  OpcionesIngresosViewController.swift
//  FreeWallet
//
//  Created by César Alejandro Guadarrama Ortega on 31/07/23.
//

import UIKit

class OpcionesIngresosViewController: UIViewController {
    
    @IBOutlet var ingresarButton: UIButton!
    @IBOutlet var labelTittle: UILabel!
    @IBOutlet var moverButton: UIButton!
    @IBOutlet var labelMoney: UILabel!
    @IBOutlet var modifyButton: UIButton!
    
    var nameOption: String? = ""
    var moneyActually: Double? = 0.0
    var divisaType: String? = ""
    
    
    
    //var lista = listaIngresos
    
    
    
    //Funciones para mover los datos de una vista a otra
    
    @IBAction func pressIngresar(_ sender: UIButton) {
        performSegue(withIdentifier: "opcionesIngresar", sender: sender)
    }
    
    @IBAction func pressModify(_ sender: UIButton) {
        performSegue(withIdentifier: "modificarIngreso", sender: sender)
    }
    @IBAction func pressMove(_ sender: UIButton) {
        if moneyActually != 0{
            performSegue(withIdentifier: "mover", sender: sender)
        }else{
            showAlert()
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mover"{
            let vistaMover = segue.destination as! MoverViewController
            vistaMover.nameTitle = nameOption!
            vistaMover.moneyTitle = moneyActually!
        }
        if segue.identifier == "modificarIngreso"{
            let vistaModificar = segue.destination as! ModificarViewController
            vistaModificar.nameModify = nameOption!
            vistaModificar.moneyModify = moneyActually!
            vistaModificar.divisaModify = divisaType!
        }
        if segue.identifier == "opcionesIngresar"{
            let vistaCalculadora = segue.destination as! CalculadoraViewController
            vistaCalculadora.nameCalculate = nameOption!
            vistaCalculadora.moneyCalculate = moneyActually!
            vistaCalculadora.divisaClculate = divisaType!
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Modificaciones boton mover
        moverButton.frame = CGRect(x: 170, y: 200 , width: 90, height: 90)
        moverButton.layer.cornerRadius = 0.5 * moverButton.bounds.size.width
        moverButton.layer.borderColor = UIColor.lightGray.cgColor
        moverButton.layer.borderWidth = 1.0
        moverButton.clipsToBounds = true
        
        // Modificaciones boton modificar
        modifyButton.frame = CGRect(x: 280, y: 275, width: 90, height: 90)
        modifyButton.layer.cornerRadius = 0.5 * modifyButton.bounds.size.width
        modifyButton.layer.borderColor = UIColor.lightGray.cgColor
        modifyButton.layer.borderWidth = 1.0
        modifyButton.clipsToBounds = true
        
        // Modificaciones boton ingresar
        ingresarButton.frame = CGRect(x: 65, y: 275, width: 90, height: 90)
        ingresarButton.layer.cornerRadius = 0.5 * modifyButton.bounds.size.width
        ingresarButton.layer.borderColor = UIColor.lightGray.cgColor
        ingresarButton.layer.borderWidth = 1.0
        ingresarButton.clipsToBounds = true
        
        labelTittle.text = nameOption!
        labelMoney.text = String("$\(moneyActually!) \(divisaType!)")
        
        
        configureView(tableView: tableView)
        tableView.reloadData()
        
        //tableView.addSubview(refreshControl)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          // Aquí puedes actualizar o realizar acciones necesarias
          print("ViewControllerA will appear")
          labelMoney.text = String("$\(moneyActually!) \(divisaType!)")
        tableView.reloadData()
          
      }
    

    
    
    //refrescar vista
    
    /*
    
    lazy var refreshControl={
        let refreshControl = UIRefreshControl()
        // QUE AL CAMBIAR AL VALOR SE EJECUTE EL METODO
        refreshControl.addTarget(self, action: #selector(OpcionesIngresosViewController.actualizarDatos(_:)), for: .valueChanged)
        refreshControl.tintColor = UIColor.systemPink
        
        return refreshControl
    }()
    
    @objc func actualizarDatos(_ refreshControl:UIRefreshControl){
        if let index = listaIngresos.firstIndex(where: { $0.nameIncome == nameOption}) {
            print("Ingreso encontrado:")
            print(listaIngresos[index].money)
            listaIngresos[index].money = moneyActually!
            print(listaIngresos[index].money)
        } else {
            print("Ingreso no encontrado.")
        }
        
        
        self.tableView.reloadData()
        refreshControl.endRefreshing()
    }
    */
    
    lazy var tableView : UITableView = {
        var tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 80.0
        tableView.register(CustomCell.self, forCellReuseIdentifier: "\(CustomCell.self)")
        //tableView.register(HeaderSectionCell.self, forHeaderFooterViewReuseIdentifier: "\(HeaderSectionCell.self)")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private func configureView(tableView:UITableView){
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
    
extension OpcionesIngresosViewController: UITableViewDelegate, UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            //return IngresosModel.getList().count
            return listaIngresos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(CustomCell.self)", for: indexPath) as? CustomCell else{
           return UITableViewCell()
        }
        let value = listaIngresos[indexPath.row]
        cell.setDataIngresos(value)
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let values = listaIngresos
        print("You tapped cell \(values[indexPath.row].name).")
    }
    
    // alerta de activos en 0.0
    
    func showAlert(){
        let alert = UIAlertController(title: "Alert", message: "No tines fondos suficientes", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        present(alert, animated: true)
    }
    
    func showActionSheet(){
        let actionSheet = UIAlertController(title: "Alert", message: "No tines fondos suficientes", preferredStyle: .alert)
        actionSheet.addAction(UIAlertAction(title: "OK", style: .cancel))
        present(actionSheet, animated: true)
    }
}
