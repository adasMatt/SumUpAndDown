//
//  CalculatePlotData.swift
//  SwiftUICorePlotExample
//
//  Created by Jeff Terry on 12/22/20.
//

import Foundation
import SwiftUI
import CorePlot

class CalculatePlotData: ObservableObject {
    
    var plotDataModel: PlotDataClass? = nil
    @ObservedObject var sumDown = sumTopDownClass()
    @ObservedObject var sumUp = summationClass()
    
    
    
    
    func plotSumBottomUpVsTopDown()
    {
        
        //set the Plot Parameters
        plotDataModel!.changingPlotParameters.yMax = 30.0
        plotDataModel!.changingPlotParameters.yMin = -30.0
        plotDataModel!.changingPlotParameters.xMax = 1000.0
        plotDataModel!.changingPlotParameters.xMin = -2.0
        plotDataModel!.changingPlotParameters.xLabel = "x"
        plotDataModel!.changingPlotParameters.yLabel = "y"
        plotDataModel!.changingPlotParameters.lineColor = .red()
        plotDataModel!.changingPlotParameters.title = " y = x"
        
        plotDataModel!.zeroData()
        var plotData :[plotDataType] =  []
        
        
        for i in 19 ..< 1000 {

            //create x values here

            let x = Double(i)

            // create y values here
            
            let sUP = sumUp.generalSummation(BigN: i, equationUsed: OneOverN)
            
            let sDown = sumDown.generalSummation(BigN: i, equationUsed: OneOverN)

            let y = logUpMinusDownOverSumOfSums(num1: sUP, num2: sDown)


            let dataPoint: plotDataType = [.X: x, .Y: y]
            plotData.append(contentsOf: [dataPoint])
            
            plotDataModel!.calculatedText += "\(x)\t\(y)\n"
        
        }
        
        plotDataModel!.appendData(dataPoint: plotData)
        
        
    }
    
    // is it supposed to be more like s1-s2/s2 and s1-s2/s1??
    func logUpMinusDownOverSumOfSums (num1: Double, num2: Double) -> Double {
        
        
        //let arithmetic = (abs(num1 - num2) / (num1 + num2))
        let arithmetic = (abs(num1 - num2) / (num1))
        
        
        return log10(arithmetic)
    }
    
    
    
}



