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
    
    func logUpMinusDownOverSumOfSums (num1: Double, num2: Double) -> Double {
        
        let arithmetic = ((num1 - num2) / (num1 + num2))
        
        
        return log10(arithmetic)
    }
    
    
    func ploteToTheMinusX()
    {
        
        //set the Plot Parameters
        plotDataModel!.changingPlotParameters.yMax = 10
        plotDataModel!.changingPlotParameters.yMin = -3.0
        plotDataModel!.changingPlotParameters.xMax = 10.0
        plotDataModel!.changingPlotParameters.xMin = -3.0
        plotDataModel!.changingPlotParameters.xLabel = "x"
        plotDataModel!.changingPlotParameters.yLabel = "y = exp(-x)"
        plotDataModel!.changingPlotParameters.lineColor = .blue()
        plotDataModel!.changingPlotParameters.title = "exp(-x)"

        plotDataModel!.zeroData()
        var plotData :[plotDataType] =  []
        for i in 0 ..< 60 {

            //create x values here

            let x = -2.0 + Double(i) * 0.2

        //create y values here

        let y = exp(-x)
            
            let dataPoint: plotDataType = [.X: x, .Y: y]
            plotData.append(contentsOf: [dataPoint])
            
            plotDataModel!.calculatedText += "\(x)\t\(y)\n"
            
        }
        
        plotDataModel!.appendData(dataPoint: plotData)
        
        return
    }
    
}



