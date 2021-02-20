//
//  SettingsViewController.swift
//  Tip Calculator
//
//  Created by Jonathan Rivero on 2/6/21.
//  Copyright © 2021 Jonathan Rivero. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var settingsTip: UISegmentedControl!
    
    let userDefault = UserDefaults.standard
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    @IBAction func tipChanged(_ sender: Any) {
        
        let indexTip = settingsTip.selectedSegmentIndex
        
        userDefault.set(indexTip, forKey: "defaultTip")
        userDefault.set(true, forKey: "newDefault")
        userDefault.synchronize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        let tipValue = userDefault.integer(forKey: "defaultTip")
        
        settingsTip.selectedSegmentIndex = tipValue
    }



}
