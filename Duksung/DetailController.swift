//
//  DetailController.swift
//  Duksung
//
//  Created by mac03 on 2021/06/09.
//

import UIKit
import WebKit

class DetailController: UIViewController {

    @IBOutlet var WebKit: WKWebView!
    var movieUrl:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let movieUrl = movieUrl else {
            return;
        }
        let url = URL(string: "https://movie.naver.com/"+movieUrl)
        let req = URLRequest(url: url!)
        
        WebKit.load(req)
        // Do any additional setup after loading the view.
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
