//
//  ViewController.swift
//  iQuiz
//
//  Created by Sagar Surana on 10/28/18.
//  Copyright © 2018 ischoolsagar. All rights reserved.
//

import UIKit

let categories : [String] = ["Math", "Geography", "Brooklyn 99"]
let descriptions : [String] = ["Quizzes you on simple calculus questions", "Questions related to different countries, cultures and capitals", "Simple trivia for fans of Brooklyn 99"]
let icons : [String] = ["math", "geog", "b99"]

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableOfCategories : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "main") as? TableCellViewController else {
            fatalError("cell didn't typecast")
        }
        cell.labelName.text = categories[indexPath.row]
        cell.icon.image = UIImage(named: icons[indexPath.row])
        cell.descriptionLabel.text = descriptions[indexPath.row]
        return cell
    }

    @IBAction func settingsPressed(_ sender: Any) {
        let settingsAlert = UIAlertController(title: "Settings", message: "Check back for Settings", preferredStyle: .alert)
        settingsAlert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
        self.present(settingsAlert, animated: true)
    }
    
}

