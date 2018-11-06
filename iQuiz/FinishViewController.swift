//
//  FinishViewController.swift
//  iQuiz
//
//  Created by Sagar Surana on 11/5/18.
//  Copyright © 2018 ischoolsagar. All rights reserved.
//

import UIKit

internal class FinishViewController: UIViewController {
    
    @IBOutlet weak var score: UILabel!
    var totalScore: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let scoreVal: Double = (Double(totalScore) / 2.0) * 100
        score.text = "You scored " + String(scoreVal) + "%"
    }
    @IBAction func backToHome(_ sender: Any) {
        performSegue(withIdentifier: "home", sender: self)
    }
}
