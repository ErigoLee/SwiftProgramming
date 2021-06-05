//
//  DetailController.swift
//  Homework12
//
//  Created by mac20 on 2021/05/24.
//

import UIKit

class DetailController: UIViewController {

    @IBOutlet var mealImageView: UIImageView!
    var image:UIImage!
    var detail: String?
    @IBOutlet var detailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mealImageView.image = image
        detailLabel.text = detail
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
