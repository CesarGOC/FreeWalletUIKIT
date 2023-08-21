//
//  GastosViewController.swift
//  FreeWallet
//
//  Created by César Alejandro Guadarrama Ortega on 26/07/23.
//

import UIKit

class GastosViewController: UIViewController {
    
    var nameSelect: String? = ""
    var moneySelect: Double? = 0.0
    var divisaSelect: String? = ""
        
    @IBOutlet var lineGray: UIView!
    @IBOutlet var linePink: UIView!
    
    
    @IBAction func pressAdd(_ sender: UIButton) {
        performSegue(withIdentifier: "agregarGasto", sender: nil)
    }
    
    @IBAction func editing(_ sender: UIButton) {
        if tableView.isEditing{
            tableView.isEditing = false
        }else{
            tableView.isEditing = true
        }
    }
    
    func bordesRedondos(){
        lineGray.layer.cornerRadius = 5
        linePink.layer.cornerRadius = 5
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bordesRedondos()
        configureView()
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DispatchQueue.main.async{
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "opcionesGastos"{
            let vistaOpciones = segue.destination as! OpcionesGastosViewController
            vistaOpciones.nameOption = nameSelect!
            vistaOpciones.moneyActually = moneySelect!
            vistaOpciones.divisaType = divisaSelect!
        }
        if segue.identifier == "agregarGasto"{
            let vistaAgregar = segue.destination as! AgregarViewController
            vistaAgregar.type = "Gasto"
            }
    }
    
    private func configureView(){
        view.addSubview(tableView)
        var topPadding : CGFloat = 0.0
        if let topInset = UIApplication.shared.windows.first?.safeAreaInsets.top{
            topPadding = topInset
        }
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: topPadding+120.0),
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
    
extension GastosViewController: UITableViewDelegate, UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            //return IngresosModel.getList().count
            return listaGastos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(CustomCell.self)", for: indexPath) as? CustomCell else{
           return UITableViewCell()
        }
        let value = listaGastos[indexPath.row]
        cell.setDataGastos(value)
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let values = listaGastos
        print("You tapped cell \(values[indexPath.row].name).")
        nameSelect = values[indexPath.row].name
        moneySelect = values[indexPath.row].money
        divisaSelect = values[indexPath.row].divisa
        
        performSegue(withIdentifier: "opcionesGastos", sender: nil)
    }
    
    //metodo que activa el poder mover las celdas
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // metodo que mueve lor elementos del arreglo
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        //** Recordar que la lista que retorna no se puede modificar, en la app hacer la modificacion
        //var lista = IngresosModel.getList()
        listaGastos.swapAt(sourceIndexPath.row, destinationIndexPath.row)
    }
    
    //metodo que activa el eliminar los objetos de la tableView
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    
    //metodo que elimina un elemento del arreglo y de la celda
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            tableView.beginUpdates()
            listaGastos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
    
    
    

}
