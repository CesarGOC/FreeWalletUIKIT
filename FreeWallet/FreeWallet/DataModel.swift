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
    var divisa: String
    
    static func getList() ->[DataModel]{
        let list = [
            DataModel(logoPic: "IMG_1976-2", nameIncome: "BBVA", money: 552.63, divisa: "MXN"),
            DataModel(logoPic: "IMG_1979-2", nameIncome: "Efectivo", money: 700.0,divisa: "MXN"),
            DataModel(logoPic: "IMG_1977-2", nameIncome: "CETES", money: 11142.07,divisa: "MXN"),
            DataModel(logoPic: "IMG_1978-2", nameIncome: "Mercado Pago", money: 789.78,divisa: "MXN")
        ]
        return (list+list+list)
    }
    
    static func getList2()->[DataModel]{
        let list = [
            DataModel(logoPic: "IMG_2072-2", nameIncome: "Comida", money: 503.00,divisa: "MXN"),
            DataModel(logoPic: "IMG_2075-2", nameIncome: "Servicios", money: 3000.00,divisa: "MXN"),
            DataModel(logoPic: "IMG_2077-2", nameIncome: "Seguros", money: 2399.20,divisa: "MXN"),
            DataModel(logoPic: "IMG_2079-2", nameIncome: "Manutencion", money: 3500.00,divisa: "MXN"),
            DataModel(logoPic: "IMG_2082-2", nameIncome: "Tarjetas de Credito", money: 503.00,divisa: "MXN"),
        ]
        return (list+list+list)
    }
    
}
