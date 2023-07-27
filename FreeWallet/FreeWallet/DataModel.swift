//
//  DataModel.swift
//  FreeWallet
//
//  Created by César Alejandro Guadarrama Ortega on 26/07/23.
//

import Foundation

struct DataModel{
    let logoPic: String
    let nameIncome: String
    let money: Double
    
    static func getList() ->[DataModel]{
        let list = [
            DataModel(logoPic: "IMG_1976-2", nameIncome: "BBVA", money: 552.63),
            DataModel(logoPic: "IMG_1979-2", nameIncome: "Efectivo", money: 700.0),
            DataModel(logoPic: "IMG_1977-2", nameIncome: "CETES", money: 11142.07),
            DataModel(logoPic: "IMG_1978-2", nameIncome: "Mercado Pago", money: 789.78)
        ]
        return (list+list+list)
    }
    
    static func getList2()->[DataModel]{
        let list = [
            DataModel(logoPic: "IMG_2072-2", nameIncome: "Comida", money: 503.00),
            DataModel(logoPic: "IMG_2075-2", nameIncome: "Servicios", money: 3000.00),
            DataModel(logoPic: "IMG_2077-2", nameIncome: "Seguros", money: 2399.20),
            DataModel(logoPic: "IMG_2079-2", nameIncome: "Manutencion", money: 3500.00),
            DataModel(logoPic: "IMG_2082-2", nameIncome: "Tarjetas de Credito", money: 503.00),
        ]
        return (list+list+list)
    }
    
}
