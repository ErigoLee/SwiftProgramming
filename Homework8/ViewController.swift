//
//  ViewController.swift
//  Homework8
//
//  Created by mac03 on 2021/04/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var ageTextField: UITextField!
    @IBOutlet var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func result(_ sender: Any) {
        let nameStr = nameTextField.text
        let ageStr = ageTextField.text
        let ageInt = Int(ageStr!)
        
        if let name = nameStr{
            if name == "" {
                resultLabel.text = "name을 입력하세요."
                return
            }
        } else{
            resultLabel.text = "name을 입력하세요."
            return
        }
        
        
        if let age = ageInt{
            if age < 8 || age >= 20{
                resultLabel.text = nameStr!+"님은 기타"
                return
            }
            else if age>=8 && age<=13{
                resultLabel.text = nameStr!+"님은 초딩"
                return
            }
            else if age>=14 && age<=16{
                resultLabel.text = nameStr!+"님은 중딩"
                return
            }
            else{
                resultLabel.text = nameStr!+"님은 고딩"
            }
            
            
        } else{
            resultLabel.text = "age를 입력하세요"
            return
        }
        
        
        
    }
    
}

