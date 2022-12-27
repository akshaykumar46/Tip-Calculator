//
//  ResultsViewController.swift
//  Tip Calculator
//
//  Created by AKSHAY KUMAR on 26/12/22.
//

import UIKit

class ResultsViewController: UIViewController {
    var tip = 0.1
    var numPeople = 2
    var billTotal = 0.0
    
    @IBOutlet weak var splitValueLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let billSplit = (billTotal+billTotal*tip)/Double(numPeople)
        splitValueLabel.text = String(format: "%.2f",billSplit)
        descLabel.text = "Split between \(numPeople) people with \(Int(tip*100))% tip."
        
    }
    
    @IBAction func recalculateBtn(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
