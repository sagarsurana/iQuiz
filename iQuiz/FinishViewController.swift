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
    var totalPossible: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let scoreVal: Double = (Double(totalScore) / Double(totalPossible)) * 100
        score.text = "You scored " + String(scoreVal) + "%"
    }
    @IBAction func backToHome(_ sender: Any) {
        performSegue(withIdentifier: "home", sender: self)
    }
}
