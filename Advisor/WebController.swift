
import UIKit
import WebKit

class WebController: UIViewController {
    @IBOutlet var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let urlString = "http://203.252.219.241:8080/FinalProject/"
        let url = URL(string: urlString)
        let req = URLRequest(url: url!)
        
        webView.load(req)
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
