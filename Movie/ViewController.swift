//
//  ViewController.swift
//  Movie
//
//  Created by mac20 on 2021/05/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var nameField: UITextField!
    @IBOutlet var welcomeLabel: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nameField.delegate = self
    }

    @IBAction func register(_ sender: Any) {
        self.nameField.resignFirstResponder()
        let text = nameField.text
        if text!.isEmpty {
            welcomeLabel.text = "Enter name, please~"
        } else {
            welcomeLabel.text = "\(text!) is registered!"
            let naviController = self.tabBarController?.viewControllers?[1] as? UINavigationController
            let controller = naviController?.viewControllers[0] as? MovieController
            controller?.nameString = nameField.text
        }
    }
    
}
extension ViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.nameField.backgroundColor = UIColor.green
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.backgroundColor = UIColor.lightGray
        return true;
    }
}
