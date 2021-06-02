//
//  ViewController3.swift
//  Homework10
//
//  Created by mac03 on 2021/05/08.
//

import UIKit

class ViewController3: UIViewController {

    @IBOutlet var resultLabel: UILabel!
    var youScore:Int?
    var meScore:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let controller = self.navigationController,
            let tempController = controller.viewControllers[1] as? ViewController2 else {
                return
        }
        youScore = tempController.youScore
        meScore = tempController.meScore
        var resultString: String?
        resultString = ""
        
        guard let youScore = youScore, let meScore = meScore else {
            return
        }
        if youScore >= meScore{
            resultLabel.text = "You win!"
            resultString = "You win!"
        }
        else{
            resultLabel.text = "You Looser!"
            resultString = "You Looser!"
        }
        let c: (UIAlertAction) -> Void = { action in self.resultLabel.text = resultString }
        
        
        let alertController = UIAlertController(title: "One more time?",
                        message: "Your score:"+String(youScore)+" / My score:"+String(meScore), preferredStyle: UIAlertController.Style.actionSheet)
        alertController.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.default) { action in
            self.navigationController?.popViewController(animated: true)
        })
        
        /*
        alertController.addAction(UIAlertAction(title: "No", style: .cancel,
                                        handler: { action in
                                            self.dateLabel.text = "Oops!"
                                            self.navigationController?.popViewController(animated: true)
                                        }))
        */
        let alertAction = UIAlertAction(title: "No", style: .cancel, handler: c)
        alertController.addAction(alertAction)
        
            
        self.present(alertController, animated: true, completion: { () in print("alert shown...") } )
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
