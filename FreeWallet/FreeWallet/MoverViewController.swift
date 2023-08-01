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
    
    var nameModify: String = ""
    var moneyModify: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        labelSelect.text = nameModify
        labelMoney.text = "$\(String(moneyModify))"
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()

        
    }
}

extension MoverViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
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
        //nameMove = moves[indexPath.row].name
        //performSegue(withIdentifier: "calculator", sender: nil)
    }
}
