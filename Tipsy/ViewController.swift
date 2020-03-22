//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var spliitNumber: UILabel!
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var tenButton: UIButton!
    @IBOutlet weak var twentyButton: UIButton!
    
    
    var tip  = 0.1
    var numberPeopleSplittedBill = 2
    var billTotal = 0.0
    var finalResult = "0.0"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func stepValueChanged(_ sender: UIStepper) {
        spliitNumber.text = String (format: "%.0f", sender.value)
        //Úitepple bản thân nó la 1 function hiển thị +- 1 đơn vị
        //Chỉ cần nhập giá trị cho label(.text) bằng sender.value là xong
        //Lưu ý: Là String type
        numberPeopleSplittedBill = Int(sender.value)
        //để in
        
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        zeroButton.isSelected = false;
        tenButton.isSelected = false;
        twentyButton.isSelected = false;
        sender.isSelected = true;
        let currentTipLableChecked = sender.currentTitle! //get the title from Tip Button selected
        
        let currentTipValueString = String( currentTipLableChecked.dropLast())// remove the percentage sign from the label
        let currentTipNumber = Double( currentTipValueString)! //convert to double
        tip = currentTipNumber/100 // convert to decimal point
        
        
    }
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        let billString =  (billTextField.text!)
        
        if (billString != "") {
            billTotal = Double(billString)!
            let result = billTotal * (tip + 1) / Double(numberPeopleSplittedBill)
            finalResult = String (format: "%.00f", result)
            //tạo 1 seque transition từ mainBoard bằng cách kéo thả
            //đặt tên là goToResults : Type = present Modally
            self.performSegue(withIdentifier: "goToResults", sender: self)
            print(finalResult)
        }
        
        
    }
    // we need a function that show and set the value to "resultViewController"
    //  override the function prepare
    // Viết xong hàm này thì mới chuyển cảnh được -> được comment ngay trong resultViewControl
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults"
        {
            //biến destination được khởi tạo  là 1 object từ ResultViewController
            let destinationVC  = segue.destination as! resultViewController
            //Đưa giá trị từ main cho result
            //Có thể truy cập biến từ resultViewControl từ đây 
            destinationVC.resultInResult = String (billTotal);
            destinationVC.tipResult = Int(tip * 100)
            destinationVC.splitResult = numberPeopleSplittedBill;
        }
    }
}

