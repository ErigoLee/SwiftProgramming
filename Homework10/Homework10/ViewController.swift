//
//  ViewController.swift
//  Homework10
//
//  Created by mac03 on 2021/05/08.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //print("view1 나 들어 가요")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //print("view1 나 들어 왔어요")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("enum")
        //print("view1 나 나가요")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //print("view1 나 나왔어요")
    }
    @IBAction func use(_ sender: Any) {
        let nameStr = nameTextField.text
        if let name = nameStr{
            if name == ""{
                resultLabel.text = "Enter name please!"
            }
            else{
                resultLabel.text = "Welcome "+name+"!!"
            }
        }
        else{
            resultLabel.text = "Enter name please!"
        }
    }
}

