//
//  ViewController.swift
//  Tip Calculator
//
//  Created by AKSHAY KUMAR on 26/12/22.
//

import UIKit

class CalculatorViewController: UIViewController, UITextFieldDelegate {
    var tip = 0.1
    var numPeople = 2
    var billTotal = 0.0
    
    @IBOutlet weak var billInputField: UITextField!
    @IBOutlet weak var twentyTipLabel: UIButton!
    @IBOutlet weak var tenTipLabel: UIButton!
    @IBOutlet weak var zeroTipLabel: UIButton!
    @IBOutlet weak var numPeopleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billInputField.delegate = self
    }

    
    @IBAction func calculateBtn(_ sender: Any) {
        
        billTotal = Double(billInputField.text ?? "0.0") ?? 0.0
        
        performSegue(withIdentifier: "showResults", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResults"{
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.tip = tip
            destinationVC.numPeople = numPeople
            destinationVC.billTotal = billTotal
        }
    }
    @IBAction func tipBtn(_ sender: UIButton) {
        twentyTipLabel.isSelected=false
        tenTipLabel.isSelected=false
        zeroTipLabel.isSelected=false
        sender.isSelected=true
        
        tip = (Double(sender.currentTitle!.dropLast()) ?? 0.0)/100
    }
    
    @IBAction func stepperBtn(_ sender: UIStepper) {
        numPeople = Int(sender.value)
        numPeopleLabel.text = String(numPeople)
    }
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

