//
//  ViewController.swift
//  PedometerApp
//
//  Created by Colby Gatte on 11/8/16.
//  Copyright © 2016 colbyg. All rights reserved.
//

import UIKit
import CoreMotion


class ViewController: UIViewController {
    
    var viewStepsViewController: ViewStepsViewController!
    var viewStepDataViewController: ViewStepDataViewController!
    
    let pm = CMPedometer()
    var totalSteps: Int = 0
    var stepData: [Steps]!
    var df = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        df.dateFormat = "MM/dd/yy"
        let childVCs = self.childViewControllers
        self.viewStepsViewController = childVCs[1] as! ViewStepsViewController
        self.viewStepDataViewController = childVCs[0] as! ViewStepDataViewController
        
        self.stepData = [Steps]()
        
        // Load steps
        var to = Date()
        
        for i in 1...7 {
            let from = to.addingTimeInterval(-60*60*24)
            
            pm.queryPedometerData(from: from, to: to) { data, error -> Void in
                if error == nil {
                    let s = Steps()
                    s.date = from
                    s.steps = data?.numberOfSteps
                    self.totalSteps += data?.numberOfSteps as! Int
                    self.stepData.append(s)
                } else {
                    print(error.debugDescription)
                }
                
                if(i == 7) {
                    DispatchQueue.main.async {
                        // Send info
                        // why do i have to set these again?
                        self.viewStepDataViewController.stepData = self.stepData
                        self.viewStepsViewController.totalSteps = self.totalSteps
                        self.viewStepsViewController.stepData = self.stepData
                        self.viewStepsViewController.viewControllerDidFinishLoadingStepData()
                        self.viewStepDataViewController.makeChart()
                    }
                }
            }
            to = from
        }
        
        self.viewStepDataViewController.stepData = self.stepData
        self.viewStepDataViewController.df = self.df
        self.viewStepsViewController.totalSteps = self.totalSteps
        self.viewStepsViewController.stepData = self.stepData
        self.viewStepsViewController.df = self.df
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

