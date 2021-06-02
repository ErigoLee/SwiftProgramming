//
//  ViewController3.swift
//  Homework10
//
//  Created by mac03 on 2021/05/08.
//

import UIKit

class ViewController3: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        //print("view1 나 나가요")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //print("view1 나 나왔어요")
    }
}
