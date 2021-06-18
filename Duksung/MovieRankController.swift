
import UIKit
import Kanna
import Alamofire

class MovieRankController: UITableViewController {
    var movieNameItem: [String] = []
    var movieNameUrl:[String] = []
    //var scheduleDate: [String] = []

    @IBAction func refresh(_ sender: Any) {
        print("refresh 작동")
        movieNameItem = []
        movieNameUrl = []
        getSchedule()
    }
    
    func getSchedule() -> Void {
        let urlString = "https://movie.naver.com/movie/sdb/rank/rmovie.nhn"
        AF.request(urlString).responseString(encoding: .utf8) { response in
            switch response.result {
            case .success(let htmlStr):
                self.parseHTML(str: htmlStr)
            case .failure(let error):
                print(error)
            }
        }
    }

    func parseHTML(str: String) -> Void {
        let document = try? Kanna.HTML(html: str, encoding: .utf8)
        guard let doc = document else {
            return
        }
        for item in doc.xpath("//tr/td[@class='title']/div[@class='tit3']/a") {
            if let text = item.text {
                movieNameItem.append(text)
                print(text)
            }
        }
        
        for date in doc.xpath("//tr/td[@class='title']/div[@class='tit3']/a/@href") {
            if let text = date.text {
                movieNameUrl.append(text)
                print(text)
            }
        }
         
        
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getSchedule()
        navigationController?.isToolbarHidden = false;
        toolbarItems = makeToolbarItems()
    }
    
    private func makeToolbarItems() -> [UIBarButtonItem]{
        let buttonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: nil, action: nil)
        return [buttonItem]
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieNameItem.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)
        // Configure the cell...
        cell.textLabel?.text = movieNameItem[indexPath.row]
        //cell.detailTextLabel?.text = scheduleDate[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentCell = tableView.cellForRow(at: indexPath)
        let currentText = currentCell?.textLabel?.text
        print(currentText!)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? DetailController
        let index = tableView.indexPathForSelectedRow?.row
        if let destination = destination, let index = index{
            destination.movieUrl = movieNameUrl[index]
        }
    }
}
