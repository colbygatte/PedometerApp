//
//  ViewStepsViewController.swift
//  PedometerApp
//
//  Created by Colby Gatte on 11/8/16.
//  Copyright © 2016 colbyg. All rights reserved.
//

import UIKit
import CoreMotion

class Steps {
    var date: Date!
    var steps: NSNumber!
}


class ViewStepsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    var stepData: [Steps]!
    var df: DateFormatter!
    var totalSteps: Int!
    
    func viewControllerDidFinishLoadingStepData() {
        self.tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib(nibName: "PedometerTableViewCell", bundle: nil), forCellReuseIdentifier: "pCell")
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UINib(nibName: "PedometerTableViewCell", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! PedometerTableViewCell
        footerView.backgroundColor = UIColor.red
        footerView.dateLabel.text = "Total:"
        footerView.stepsLabel.text = String(self.totalSteps)
        return footerView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.stepData.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pCell") as! PedometerTableViewCell
        
        let steps = stepData[indexPath.row].steps! as Int
        let date = stepData[indexPath.row].date
        
        let dateString = df.string(from: date!)
        
        cell.stepsLabel.text = String(steps)
        cell.dateLabel.text = dateString
        
        if steps > 2_000 {
            cell.stepsLabel.textColor = UIColor.green
        } else {
            cell.stepsLabel.textColor = UIColor.red
        }
        
        return cell
    }

    
    

}
