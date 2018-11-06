//
//  ViewController.swift
//  iQuiz
//
//  Created by Sagar Surana on 10/28/18.
//  Copyright © 2018 ischoolsagar. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableOfCategories : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return database.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "main") as? TableCellViewController else {
            fatalError("cell didn't typecast")
        }
        cell.labelName.text = database[indexPath.row].name
        cell.icon.image = UIImage(named: database[indexPath.row].icons)
        cell.descriptionLabel.text = database[indexPath.row].description
        return cell
    }

    @IBAction func settingsPressed(_ sender: Any) {
        let settingsAlert = UIAlertController(title: "Settings", message: "Check back for Settings", preferredStyle: .alert)
        settingsAlert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
        self.present(settingsAlert, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let categorySelected = tableOfCategories.indexPathForSelectedRow?.row
        let destination = segue.destination as! QuestionsViewController
        destination.allQuestions = database[categorySelected!].questions
        destination.questionCurrentIndex = 0
        destination.scoreCurrent = 0
    }
    
}

