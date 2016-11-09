//
//  ViewStepDataViewController.swift
//  PedometerApp
//
//  Created by Colby Gatte on 11/8/16.
//  Copyright © 2016 colbyg. All rights reserved.
//

import UIKit
import Charts


class PFormatter: NSObject, IAxisValueFormatter {
    var vals: [String]!
    
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        let index = Int(value) - 1
        return self.vals[index]
    }
    
    
}

class ViewStepDataViewController: UIViewController {
    
    @IBOutlet var barChartView: BarChartView!
    
    var stepData: [Steps]!
    var stepDates: [String]!
    var stepSteps: [Int]!
    var df: DateFormatter!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        barChartView.noDataText = "No step data."
    }
    
    func makeChart() {
        stepDates = [String]()
        stepSteps = [Int]()
        
        for steps in self.stepData {
            stepDates.append(df.string(from: steps.date))
            stepSteps.append(steps.steps as Int)
        }
        
        self.setChart(dataPoints: stepDates, values: stepSteps)
    }
    
    func setChart(dataPoints: [String], values: [Int]) {
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: Double(i+1), y: Double(values[i]))
            print("\(values[i])")
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "Steps taken")
        let chartData = BarChartData(dataSet: chartDataSet)
        
        
        let formatter = PFormatter()
        formatter.vals = self.stepDates
        let xaxis = XAxis()
        xaxis.valueFormatter = formatter
        
        barChartView.xAxis.valueFormatter = xaxis.valueFormatter
        barChartView.data = chartData
        
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
