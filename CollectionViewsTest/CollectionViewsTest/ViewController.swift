//
//  ViewController.swift
//  CollectionViewsTest
//
//  Created by César Alejandro Guadarrama Ortega on 27/07/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    var nameMove: String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "calculator"{
            let vistaCalculator = segue.destination as! CalculatorViewController
            vistaCalculator.nameSelect = nameMove!
        }
    }
    
}

//Funcion para saber la cantidad excata de elementos para la collection view
extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moves.count
    }
    
//Funcion que manda a llamar a la celda para dibujarla
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoveCollectionViewCell", for: indexPath) as! MoveCollectionViewCell
        cell.setup(with: moves[indexPath.row])
        return cell
    }
}

//Funcion para modificar el tamaño de los elelmetos
extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 150)
    }
}


extension ViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(moves[indexPath.row].name)
        nameMove = moves[indexPath.row].name
        performSegue(withIdentifier: "calculator", sender: nil)
    }
}
