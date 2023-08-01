//
//  OpcionesIngresosViewController.swift
//  FreeWallet
//
//  Created by César Alejandro Guadarrama Ortega on 31/07/23.
//

import UIKit

class OpcionesIngresosViewController: UIViewController {
    
    @IBOutlet var labelTittle: UILabel!
    @IBOutlet var moverButton: UIButton!
    @IBOutlet var labelMoney: UILabel!
    @IBOutlet var modifyButton: UIButton!
    
    var nombreOpcion: String? = ""
    var moneyActually: Double? = 0.0
    var divisaType: String? = ""
    
    var lista = DataModel.getList()
    
    //Funciones para mover los datos de una vista a otra

    @IBAction func pressModify(_ sender: UIButton) {
        performSegue(withIdentifier: "modificarIngreso", sender: sender)
    }
    @IBAction func pressMove(_ sender: UIButton) {
        performSegue(withIdentifier: "mover", sender: sender)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mover"{
            let vistaMover = segue.destination as! MoverViewController
            vistaMover.nameModify = nombreOpcion!
            vistaMover.moneyModify = moneyActually!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Modificaciones boton mover
        moverButton.frame = CGRect(x: 175, y: 200 , width: 90, height: 90)
        moverButton.layer.cornerRadius = 0.5 * moverButton.bounds.size.width
        moverButton.layer.borderColor = UIColor.lightGray.cgColor
        moverButton.layer.borderWidth = 1.0
        moverButton.clipsToBounds = true
        
        // Modificaciones boton modificar
        modifyButton.frame = CGRect(x: 280, y: 300, width: 90, height: 90)
        modifyButton.layer.cornerRadius = 0.5 * modifyButton.bounds.size.width
        modifyButton.layer.borderColor = UIColor.lightGray.cgColor
        modifyButton.layer.borderWidth = 1.0
        modifyButton.clipsToBounds = true
        
        labelTittle.text = nombreOpcion!
        labelMoney.text = String("$\(moneyActually!) \(divisaType!)")
        
        
        configureView()
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
    
extension OpcionesIngresosViewController: UITableViewDelegate, UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            //return IngresosModel.getList().count
            return lista.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(CustomCell.self)", for: indexPath) as? CustomCell else{
           return UITableViewCell()
        }
        let value = DataModel.getList()[indexPath.row]
        cell.setData(value)
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let values = DataModel.getList()
        print("You tapped cell \(values[indexPath.row].nameIncome).")
    }
    
    
    
    
    
    
    

}
