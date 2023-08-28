//
//  IngresosCustomCell.swift
//  FreeWallet
//
//  Created by César Alejandro Guadarrama Ortega on 26/07/23.
//

import UIKit

class CustomCell: UITableViewCell {
    
    let atributos: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.red
            ]
    
    private var logoPic : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
        
    private var nameIncomeLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
    private var moneyLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
    lazy private var stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.addArrangedSubview(nameIncomeLabel)
        stackView.addArrangedSubview(moneyLabel)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
      
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        addSubview(logoPic)
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
                    //Profile Constraints
                    logoPic.widthAnchor.constraint(equalToConstant: 60),
                    logoPic.heightAnchor.constraint(equalToConstant: 60),
                    logoPic.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
                    logoPic.topAnchor.constraint(equalTo: topAnchor, constant: 10),
                    logoPic.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
                    
                    //StackView Constraints
                    stackView.leadingAnchor.constraint(equalTo: logoPic.trailingAnchor, constant: 10),
                    stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10),
                    stackView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
                    stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
                ])
    }
    func setDataIngresos(_ income: DataModel){
        logoPic.image = UIImage(named: income.logoPic)
        moneyLabel.text = "$\(String(format: "%.2f",income.money)) \(income.divisa)"
        nameIncomeLabel.text = income.name
    }
    
    func setDataGastos(_ spent: DataModel){
        let textoModificado = NSAttributedString(string: "$\(String(format: "%.2f",spent.money)) \(spent.divisa)", attributes: atributos)
        logoPic.image = UIImage(named: spent.logoPic)
        moneyLabel.attributedText = textoModificado
        nameIncomeLabel.text = spent.name
    }
    
    func setDataMovimientos(_ movimiento: Movimientos){
        logoPic.image = UIImage(named: movimiento.image )
        moneyLabel.text = "$\(String(format: "%.2f", movimiento.monto))"
        nameIncomeLabel.text = movimiento.date
    }

}
