//
//  MoverViewController.swift
//  FreeWallet
//
//  Created by César Alejandro Guadarrama Ortega on 31/07/23.
//

import UIKit

class MoverViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!

    @IBOutlet var labelMoney: UILabel!
    @IBOutlet var labelSelect: UILabel!
    
    var nameTitle: String = ""
    var moneyTitle: Double = 0.0
    var moves: [Move] = []
    var nameMove: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        labelSelect.text = nameTitle
        labelMoney.text = "$\(String(moneyTitle))"
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()

        
    }
    //caundo se carga la vista por segunda vez hasta N veces
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        labelMoney.text = "$\(String(moneyTitle))"
    }
    
    //antes de que cierre la vista
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let viewControllerOpcionesIngresos = navigationController?.viewControllers.first(where: { $0 is OpcionesIngresosViewController }) as? OpcionesIngresosViewController
        viewControllerOpcionesIngresos?.moneyActually = moneyTitle
    }
    
    //Datos a mandar
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moverCalculadora"{
            let vistaCalculadora = segue.destination as! CalculadoraViewController
            vistaCalculadora.nameCalculate = nameTitle
            vistaCalculadora.moneyCalculate = moneyTitle
            vistaCalculadora.nameSelectMove = nameMove
        }
    }
}

extension MoverViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        for ingreso in listaIngresos{
            moves.append(ingreso.move)
        }
        for gasto in listaGastos{
            moves.append(gasto.move)
        }
        return moves.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoverCollectionViewCell", for: indexPath) as! MoverCollectionViewCell
        cell.setup(with: moves[indexPath.row])
        return cell
    }
}


extension MoverViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130, height: 130)
    }
}

extension MoverViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(moves[indexPath.row].name)
        nameMove = moves[indexPath.row].name
        performSegue(withIdentifier: "moverCalculadora", sender: nil)
    }
}
