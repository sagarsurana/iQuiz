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
    var allData = [Categories]()
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        basicRefreshing()
        tableOfCategories.refreshControl = UIRefreshControl()
        tableOfCategories.refreshControl!.attributedTitle = NSAttributedString(string: "Refreshing...")
        tableOfCategories.refreshControl!.addTarget(self, action: #selector(refreshData(refresh:)), for: .valueChanged)
        timer = Timer.scheduledTimer(timeInterval: 30.0, target: self, selector: #selector(refreshTimer(refresh:)), userInfo: nil, repeats: true)
        timer.fire()
    }
    
    @objc func refreshData(refresh: UIRefreshControl) {
        basicRefreshing()
        refresh.endRefreshing()
    }
    
    @objc func refreshTimer(refresh: Timer) {
        basicRefreshing()
    }
    
    func basicRefreshing() {
        if Reachability.isConnectedToNetwork() == true {
            print("Internet connection OK")
            if (UserDefaults.standard.string(forKey: "url") == "" || UserDefaults.standard.object(forKey: "url") == nil) {
                allData = database
            } else {
                let url = UserDefaults.standard.string(forKey: "url")!
                print(url)
                getData(url: url)
            }
        } else {
            print("Internet connection FAILED")
            let internetAlert = UIAlertController(title: "Network Manager", message: "No Internet Connection.", preferredStyle: .alert)
            internetAlert.addAction(UIAlertAction(title: "Okay, use local data.", style: .cancel, handler: nil))
            self.present(internetAlert, animated: true)
            allData = database
        }
    }
    
    func getData(url: String) {
        print("suu : " + url)
        let currUrl = URL(string: url)
        print(currUrl!)
        let task = URLSession.shared.dataTask(with: currUrl!) {(data, response, error) in
            if error != nil {
                print("here's error " + error!.localizedDescription)
                self.allData = database
                let downloadFailed = UIAlertController(title: "Error Downloading", message: "Download Failed", preferredStyle: .alert)
                downloadFailed.addAction(UIAlertAction(title: "Okay, use local data.", style: .cancel, handler: nil))
                self.present(downloadFailed, animated: true)
            }
            guard let data = data else {
                return
            }
            print("yo")
            print(String(data: data, encoding: .utf8)!)
            do {
                self.allData = try JSONDecoder().decode([Categories].self, from: data)
                DispatchQueue.main.async {
                    self.tableOfCategories.reloadData()
                }
                
            } catch let jsonError {
                self.allData = database
                let error = UIAlertController(title: "Error Downloading", message: "Download Failed", preferredStyle: .alert)
                error.addAction(UIAlertAction(title: "Okay, use local data.", style: .cancel, handler: nil))
                self.present(error, animated: true)
                print(jsonError)
            }
        }
        task.resume()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "main") as? TableCellViewController else {
            fatalError("cell didn't typecast")
        }
        print("yyy " + allData[indexPath.row].title)
        cell.labelName.text = allData[indexPath.row].title
        if allData[indexPath.row].icons != nil {
            cell.icon.image = UIImage(named: allData[indexPath.row].icons!)
        } else {
            cell.icon.image = UIImage(named: "noimage")
        }
        cell.descriptionLabel.text = allData[indexPath.row].desc
        return cell
    }

    @IBAction func settingsPressed(_ sender: Any) {
        let settingsAlert = UIAlertController(title: "Settings", message: "Where do you want to pull data from?", preferredStyle: .alert)
        settingsAlert.addTextField { (textField) in
            if (UserDefaults.standard.string(forKey: "url") == "" || UserDefaults.standard.object(forKey: "url") == nil) {
                textField.text = "Enter URL here"
            } else {
                textField.text = UserDefaults.standard.string(forKey: "url")!
            }
        }
        let submitAction = UIAlertAction(title: "Check Now", style: .default) { [weak settingsAlert] _ in
            let answer = settingsAlert!.textFields![0]
            UserDefaults.standard.set(answer.text!, forKey: "url")
            self.getData(url: UserDefaults.standard.string(forKey: "url")!)
        }
        settingsAlert.addAction(submitAction)
        settingsAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(settingsAlert, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        timer.invalidate()
        let categorySelected = tableOfCategories.indexPathForSelectedRow?.row
        let destination = segue.destination as! QuestionsViewController
        destination.allQuestions = allData[categorySelected!].questions
        destination.questionCurrentIndex = 0
        destination.scoreCurrent = 0
    }
    
}

