//
//  ViewController.swift
//  Homework12
//
//  Created by mac20 on 2021/05/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var numberTextField: UITextField!

    @IBOutlet var orderLabel: UILabel!
    var orderMeal: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        numberTextField.delegate = self
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let orderMeal = orderMeal{
            orderLabel.text = orderMeal
        }
    }


}
extension ViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.numberTextField.text = ""
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //print("return")
        self.numberTextField.resignFirstResponder()
        
        if let numberString = numberTextField.text{
            if let number = Int(numberString){
                if let orderMeal = orderMeal{
                    orderLabel.text = "table "+String(number)+" ordered "+orderMeal
                }
            }
        }
        
        return true
    }
}
