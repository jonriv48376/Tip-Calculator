//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Jonathan Rivero on 1/23/21.
//  Copyright © 2021 Jonathan Rivero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Tip Calculator"
        
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipAmountLabel.text = String(format: "$%.2f" , tip)
        totalLabel.text = String(format: "$%.2f" , total)
    }
    
    @IBAction func screenPressed(_ sender: Any) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let userDefault = UserDefaults.standard
        let bill = Double(billAmountTextField.text!) ?? 0
        
        let changedDefault = userDefault.bool(forKey: "changedDefault")
        
        if(changedDefault || bill == 0){
            let tipValue = userDefault.integer(forKey: "defaultTip")
            tipControl.selectedSegmentIndex = tipValue
            userDefault.set(false, forKey: "changedDefault")
        }
        self.calculateTip(self)
    }
    
}


