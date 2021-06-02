//
//  ViewController2.swift
//  Homework10
//
//  Created by mac03 on 2021/05/08.
//

import UIKit


class ViewController2: UIViewController {

    @IBOutlet var youLabel: UILabel!
    @IBOutlet var meLabel: UILabel!
    var youScore: Int?
    var meScore: Int?
    
    @IBOutlet var youName: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("eum")
        
        guard let controller = self.navigationController,
            let tempController = controller.viewControllers[0] as? ViewController else {
                return
        }
        if let name = tempController.nameTextField.text{
            if name == ""{
                youName.text = "You"
            }
            else{
                youName.text = name
            }
            
            
        }
        else{
            youName.text = "You"
        }

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        var cards: [Card] = []
        
        youLabel.text = ""
        meLabel.text = ""
        youScore = 0
        meScore = 0
        
        for i in 1...4 {
            for j in 1...13 {
                let card = Card(suit: Suit(rawValue: i)!,rank: Rank(rawValue: j)!)
                cards.append(card)
            }
        }
        cards.shuffle()                                 // 배열 내 카드 객체들을 섞음, shuffle 메소드는 Swift4.2부터 지원
        for i in 0..<5 {                                // 배열로부터 처음 다섯 카드 객체들을 뒤집어 출력
            cards[i].flip()                             // 임의로 섞기 때문에 출력 때마다 출력되는 카드들이 다름
            youScore? += cards[i].rank.rawValue * cards[i].suit.rawValue
            youLabel.text?.append(cards[i].description()+"\n")
        }
        
        for i in 5..<10 {                                // 배열로부터 처음 다섯 카드 객체들을 뒤집어 출력
            cards[i].flip()                             // 임의로 섞기 때문에 출력 때마다 출력되는 카드들이 다름
            meScore? += cards[i].rank.rawValue * cards[i].suit.rawValue
            meLabel.text?.append(cards[i].description()+"\n")
        }
        
        
        //print("view1 나 들어 가요")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("doo")
        //print("view1 나 들어 왔어요")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("hun")
        //print("view1 나 나가요")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //print("view1 나 나왔어요")
    }
}
