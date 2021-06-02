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
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        var card: [Card] = []
        
        youLabel.text=""
        meLabel.text=""
        for _ in 0..<10{
            let suit = Int.random(in: 1...4)
            let rank = Int.random(in: 1...13)
            card.append(Card(suit: Suit(rawValue: suit)!, rank: Rank(rawValue: rank)!))
        }
        
        for i in 0..<5{
            card[i].flip()
            youLabel.text?.append(card[i].description()+"\n")
        }
        for i in 5..<10{
            card[i].flip()
            meLabel.text?.append(card[i].description()+"\n")
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
