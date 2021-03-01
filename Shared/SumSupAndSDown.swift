//Sum S problem 3
//part a - sum as function of N, only summing up to 5 for now which is not enough for the rest
//part b - log-log plot
//part c - explain precision
//
//Created by Matthew Adas
import Foundation

class summationClass: ObservableObject {
    
    typealias equationHandler = (Int) -> Double
    var sumResult: Double = 0.0

    // A pretty sweet reusable function to take any equation as it's argument and sums from n = 1 to n = N
    func generalSummation(BigN: Int, equationUsed: equationHandler) -> Double {
    
        for n in 1..<(BigN) {
            sumResult = sumResult + equationUsed(n)
        }
        return sumResult
    }
    
}

class sumTopDownClass: summationClass {
    
    // A pretty sweet reusable function to take any equation as it's argument and sums from m = N-1 to m = 1
    override func generalSummation(BigN: Int, equationUsed: equationHandler) -> Double {
        
        var m = BigN                    //needs some extra stuff

        for _ in 1..<(BigN) {             //don't need an 'n' but rather 'm' counting backwards
            m = m - 1
            sumResult = sumResult + equationUsed(m)
        }
        return sumResult
    }
}

//////////////////////////////
//calculate 1/n one time
func OneOverN(passedLittleN: Int) -> Double {
        
    let oneCalculation = 1/Double(passedLittleN)
    //print("sumResult = \(sumResult-1/passedLittleN) + 1/\(Int(passedLittleN)) =", sumResult )

    return oneCalculation
}

/*
//////////////////////////////
// script begins, doesn't work like this in SwiftUI
let N = 1000000     

print()

//////////////////////////////
//calculate sum from bottom up
let sumUp = summationClass()

 // I did not need these to be functions, just needed sUP and sDown, the function is redundant and uneccesary
func sumBottomUp() -> Double {
    let sUP = sumUp.generalSummation(BigN: N, equationUsed: OneOverN)
    
    return sUP
}

/////////////////////////////
//calculate sum from top down
let sumDown = sumTopDownClass()

func sumTopDown() -> Double {
    let sDown = sumDown.generalSummation(BigN: N, equationUsed: OneOverN)

    return sDown
}


print("the bottom up result is: \(sumBottomUp()) \nthe top down result is: \(sumTopDown())")
print()

 */
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 /*

// do something like logUpMinusDownOverSumOfSums(num1: sUP, num2: sDOWN)
func logUpMinusDownOverSumOfSums (num1: Double, num2: Double) -> Double {
    
    let arithmetic = ((num1 - num2) / (num1 + num2))

    return log10(arithmetic)
}

*/
