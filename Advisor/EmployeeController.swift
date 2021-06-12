
import UIKit
import Kanna
import Alamofire

class EmployeeController: UITableViewController {
    var deptName: String?
    var employeeArray: [String] = []
    var employeeIDArray: [String] = []
    
    func getStudents() -> Void {
        guard let advisor = deptName else {
            return
        }
        let urlString = "http://203.252.219.241:8080/FinalProject/advisorProHome.jsp" + "?dept=" + advisor
        let encodedUrlString = urlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        guard let encodedUrlStr = encodedUrlString else {
            return
        }
        AF.request(encodedUrlStr).responseString(encoding: .utf8) { response in
            switch response.result {
            case .success(let str):
                self.parseHTML(htmlStr: str)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func parseHTML(htmlStr string: String) -> Void {
        let document = try? Kanna.HTML(html: string, encoding: .utf8)
        guard let doc = document else {
            return
        }
        for node in doc.xpath("//h5") {
            if let text = node.text {
                employeeArray.append(text)
                print(text)
            }
        }
        for node in doc.xpath("//h6"){
            if let text = node.text{
                employeeIDArray.append(text)
                print("사번: "+text)
            }
            
        }
        
        
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getStudents()
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeeArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeCell", for: indexPath)
        // Configure the cell...
        cell.textLabel?.text = employeeArray[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            //getting the current cell from the index path
            let currentCell = tableView.cellForRow(at: indexPath)
            //getting the text of that cell
            let currentText = currentCell?.textLabel?.text
            let employeeID = employeeIDArray[indexPath.row]
            let alertController = UIAlertController(title: currentText!, message: "사번: " + employeeID , preferredStyle: .actionSheet)
            let defaultAction = UIAlertAction(title: "Close", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
    }

}
