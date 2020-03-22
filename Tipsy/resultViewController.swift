//
//  resultViewController.swift
//  Tipsy
//
//  Created by Adam  on 2/14/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class resultViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingResultLabel: UILabel!
    var resultInResult = "0.0";
    var tipResult = 10;
    var splitResult = 2;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = resultInResult
        settingResultLabel.text = "Split between \(splitResult) people, with \(tipResult)% tip."
       
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
         self.dismiss(animated: true, completion: nil)
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
