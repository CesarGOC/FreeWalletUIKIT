//
//  ViewController.swift
//  BalanceTest
//
//  Created by César Alejandro Guadarrama Ortega on 03/08/23.
//

import UIKit
import Charts

class ViewController: UIViewController, ChartViewDelegate{

    var pieChart = PieChartView()
    var lineChart = LineChartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pieChart.delegate = self
        lineChart.delegate = self
    }
    
    @IBAction func pressReset(_ sender: UIButton) {
        lineChart.fitScreen()
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        //Datos para hacer una grafica de pastel TOP
        
        //pieChart.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.width)
        pieChart.animate(xAxisDuration: 2.0)
        pieChart.frame = CGRect(x: 150, y: 170
                                , width: 250, height: 250)
        //pieChart.center = view.center
        view.addSubview(pieChart)
        
        
        pieChart.centerText = "Total\n$6739 "
        pieChart.drawEntryLabelsEnabled = false
        
        var entries = [ChartDataEntry]()
        
        //let money = [4567.3, 1983.6, 1423.0, 3999]
        //let ingresos = ["CETES", "Mercado Pago", "BBVA", "Otros"]
        
        let pieValues = ["CETES":4567.3,"Mercado Pago": 1983.6, "BBVA":3957.5, "Otros": 234]
        
        for (ingreso, valor) in pieValues{
            let dataEntry = PieChartDataEntry(value: valor, label: ingreso, data: ingreso)
            entries.append(dataEntry)
        }
        
        
        
        
        let set = PieChartDataSet(entries: entries, label: "")
        set.colors = ChartColorTemplates.material()
        set.drawValuesEnabled = false
        set.highlightEnabled = false
        let data = PieChartData(dataSet: set)
        pieChart.data = data
        
        
        
        // Datos prar hacer una grafica lineal Bottom
        lineChart.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        
        lineChart.frame = CGRect(x: 25, y: 500, width: 345, height: 220)
        //pieChart.center = view.center
        view.addSubview(lineChart)
        
        var entries_2 = [ChartDataEntry]()
        
        let money_2 = [1000,3000, 4000,3000, 2000,1000,2000,0]
        //let days = [1,2,3,4,5,6]
        
        for (indice, valor) in money_2.enumerated(){
            entries_2.append(ChartDataEntry(x: Double(indice), y: Double(valor)))
        }
        
        
        let set_2 = LineChartDataSet(entries: entries_2, label: "Ingresos")
        //set_2.colors = ChartColorTemplates.colorful()
        
        //color de las lineas
        var colors: [UIColor] = []
        colors.append(.systemPink)
        
        //Modificar Grrafica
        set_2.colors = colors
        set_2.setCircleColor(UIColor.systemPink)
        set_2.circleHoleColor = UIColor.systemPink
        set_2.circleRadius = 3.0
        set_2.mode = .cubicBezier
        set_2.cubicIntensity = 0.2
        set_2.drawCirclesEnabled = false
        set_2.drawValuesEnabled = false
        //elimina seleccion
        set_2.highlightEnabled = false
        
        // Quitar los ejes y etiquetas
        lineChart.xAxis.drawGridLinesEnabled = false
        lineChart.rightAxis.drawLabelsEnabled = false
        lineChart.leftAxis.drawLabelsEnabled = false
        lineChart.xAxis.drawAxisLineEnabled = false
        lineChart.xAxis.drawLabelsEnabled = false
        lineChart.leftAxis.drawAxisLineEnabled = false
        lineChart.rightAxis.drawAxisLineEnabled = false
        lineChart.backgroundColor = .systemGray6
        lineChart.leftAxis.gridColor = .clear
        lineChart.rightAxis.gridColor = .clear
        
        //Linea para reespatablecer el zoom
        //lineChart.fitScreen()
        
        //Modificacion de ejes
        
        //Minimos y Maximos
        
        
        //Crear Fill
        set_2.fillColor = UIColor.systemPink
        set_2.drawFilledEnabled = true
        
        //mostrar los datos
        let data_2 = LineChartData(dataSet: set_2)
        lineChart.data = data_2
        
    }


}

