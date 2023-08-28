//
//  IconViewController.swift
//  FreeWallet
//
//  Created by César Alejandro Guadarrama Ortega on 22/08/23.
//

import UIKit

class IconViewController: UIViewController {

    
    var selectIcon: String = "IMG_2102-2"
    var selectIconMove: String = "IMG_2102-2"
    
    @IBOutlet var collectionView: UICollectionView!
    
    let newList = listaIconosIngresos + listaIconosGastos
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
    }
    

}

extension IconViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let newList = listaIconosIngresos + listaIconosGastos
        return newList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IconCollectionViewCell", for: indexPath) as! IconCollectionViewCell
        cell.setup(with: newList[indexPath.row])
        return cell
    }
}


extension IconViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 110)
    }
}

extension IconViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //Cambiar el fondo de los logos
        //selectImage = newList[indexPath.row].iconoPrincipal
        
        //Logo Move
        selectIcon = newList[indexPath.row].iconoPrincipal
        selectIconMove = newList[indexPath.row].iconoMove
        
        
        let viewControllerAgregar = navigationController?.viewControllers.first(where: { $0 is AgregarViewController }) as? AgregarViewController
        viewControllerAgregar?.iconAdd = selectIcon
        viewControllerAgregar?.iconMoveAdd = selectIconMove
        
        navigationController?.popViewController(animated: true)
        //print(moves[indexPath.row].name)
        //nameMove = moves[indexPath.row].name
        //performSegue(withIdentifier: "moverCalculadora", sender: nil)*/
    }
}
