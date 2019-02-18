//
//  ViewController.swift
//  FoodTrackerJMD
//
//  Created by Joseph Divalentone on 2/15/19.
//  Copyright © 2019 Joseph Divalentone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Properties
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var mealNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK:Actions
    
    @IBAction func setDefaultLabelText(_ sender: Any) {
    }
}

