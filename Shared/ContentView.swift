//
//  ContentView.swift
//  Shared
//
//  Created by Matthew Adas on 3/1/21.
//

import SwiftUI
import CorePlot

typealias plotDataType = [CPTScatterPlotField : Double]

struct ContentView: View {
    @EnvironmentObject var plotDataModel :PlotDataClass
    @ObservedObject private var calculator = CalculatePlotData()
    @State var isChecked:Bool = false
    @State var tempInput = ""
  
    

    var body: some View {
        
        VStack{
      
            CorePlot(dataForPlot: $plotDataModel.plotData, changingPlotParameters: $plotDataModel.changingPlotParameters)
                .setPlotPadding(left: 10)
                .setPlotPadding(right: 10)
                .setPlotPadding(top: 10)
                .setPlotPadding(bottom: 10)
                .padding()
            
            Divider()
            
            HStack{
                
                HStack(alignment: .center) {
                    Text("sum of 1/n, checking error between summing from 1 to N and N to 1. Starting at x = 19 to avoid points at infinity")
                        .font(.callout)
                        .bold()
                    //TextField("temp", text: $tempInput)
                      //  .padding()
                }.padding()
                
                //Toggle(isOn: $isChecked) {
                  //          Text("Display Error")
                    //    }
                //.padding()
                
                
            }
            
            
            HStack{
                Button("text", action: {self.calculate()} )
                .padding()
                
            }
            
        }
        
    }
    
    
    
    
    /// calculate
    /// Function accepts the command to start the calculation from the GUI
    func calculate(){
        
        //var temp = 0.0
        
        //pass the plotDataModel to the cosCalculator
        calculator.plotDataModel = self.plotDataModel
        
        //Calculate the new plotting data and place in the plotDataModel
        calculator.plotSumBottomUpVsTopDown()
        
        
    }
    

   
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
