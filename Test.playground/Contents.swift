import UIKit



struct Move {
    var name: String
    var image: String
}

let moves: [Move] = [
    Move(name: "BBVA", image: "IMG_2099-2"),
    Move(name: "Efectivo", image: "IMG_2102-2"),
    Move(name: "CETES", image: "IMG_2100-2"),
    Move(name: "Mercado Pago", image: "IMG_2101-2"),
    Move(name: "Comida", image: "IMG_2095-2"),
    Move(name: "Servicios", image: "IMG_2094-2"),
    Move(name: "Seguros", image: "IMG_2096-2"),
    Move(name: "Manutencion", image: "IMG_2097-2"),
    Move(name: "Tarjetas de Credito", image: "IMG_2098-2")
]


struct DataModelIngresos{
    var logoPic: String
    var logoPicMove: String
    var nameIncome: String
    var money: Double
    var divisa: String
    
    init(logoPic: String, logoPicMove: String, nameIncome: String, money:Double, divisa: String) {
        self.logoPic = logoPic
        self.logoPicMove = logoPicMove
        self.nameIncome = nameIncome
        self.money = money
        self.divisa = divisa
    }
    
}


struct DataModelGastos{
    var logoPic: String
    var logoPicMove: String
    var nameSpent: String
    var money: Double
    var divisa: String
    
    init(logoPic: String, logoPicMove: String, nameSpent: String, money:Double, divisa: String) {
        self.logoPic = logoPic
        self.logoPicMove = logoPicMove
        self.nameSpent = nameSpent
        self.money = money
        self.divisa = divisa
    }
    
}

var listaIngresos = [
    DataModelIngresos(logoPic: "IMG_1976-2", logoPicMove: "IMG_1976-2", nameIncome: "BBVA", money: 552.63, divisa: "MXN"),
    DataModelIngresos(logoPic: "IMG_1979-2",logoPicMove: "IMG_1976-2", nameIncome: "Efectivo", money: 700.0,divisa: "MXN"),
    DataModelIngresos(logoPic: "IMG_1977-2",logoPicMove: "IMG_1976-2", nameIncome: "CETES", money: 11142.07,divisa: "MXN"),
    DataModelIngresos(logoPic: "IMG_1978-2", logoPicMove: "IMG_1976-2", nameIncome: "Mercado Pago", money: 789.78,divisa: "MXN")
    ]

var listaGastos = [
    DataModelGastos(logoPic: "IMG_2072-2",logoPicMove: "IMG_2072-2", nameSpent: "Comida", money: 503.00,divisa: "MXN"),
    DataModelGastos(logoPic: "IMG_2075-2",logoPicMove: "IMG_2072-2", nameSpent: "Servicios", money: 3000.00,divisa: "MXN"),
    DataModelGastos(logoPic: "IMG_2077-2",logoPicMove: "IMG_2072-2", nameSpent: "Seguros", money: 2399.20,divisa: "MXN"),
    DataModelGastos(logoPic: "IMG_2079-2",logoPicMove: "IMG_2072-2", nameSpent: "Manutencion", money: 3500.00,divisa: "MXN"),
    DataModelGastos(logoPic: "IMG_2082-2",logoPicMove: "IMG_2072-2", nameSpent: "Tarjetas de Credito", money: 503.00,divisa: "MXN")
]



//listaIngresos[0].move.name


print("Hola")

let nombreIngreso = "Mercado Pago"
for element in listaIngresos {
    if element.nameIncome == nombreIngreso {
        
    }
}

if var foundPerson = listaIngresos.first(where: { $0.nameIncome == nombreIngreso}) {
    print("Persona encontrada:")
    print(foundPerson.money)
    let aux = foundPerson.money + 500.0
    print(aux)
    
    
} else {
    print("Persona no encontrada.")
}
