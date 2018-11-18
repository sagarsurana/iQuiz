//
//  QuestionsViewController.swift
//  iQuiz
//
//  Created by Sagar Surana on 11/5/18.
//  Copyright © 2018 ischoolsagar. All rights reserved.
//

import UIKit


class QuestionsViewController: UIViewController {

    @IBOutlet weak var questionAsked: UILabel!
    @IBOutlet weak var optionOne: UIButton!
    @IBOutlet weak var optionTwo: UIButton!
    @IBOutlet weak var optionThree: UIButton!
    @IBOutlet weak var optionFour: UIButton!
    var currentSelected: UIButton!
    var allQuestions: [Questions]!
    var questionCurrentIndex: Int!
    var currentQuestion: Questions!
    var scoreCurrent: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentQuestion = allQuestions?[questionCurrentIndex!]
        questionAsked.text = currentQuestion?.text
        
        optionOne.setTitle(currentQuestion?.answers[0], for: .normal)
        optionTwo.setTitle(currentQuestion?.answers[1], for: .normal)
        optionThree.setTitle(currentQuestion?.answers[2], for: .normal)
        optionFour.setTitle(currentQuestion?.answers[3], for: .normal)
    }
    
    @IBAction func submit(_ sender: Any) {
        if currentSelected != nil {
            performSegue(withIdentifier: "answers", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "answers" {
            let destination = segue.destination as! AnswersViewController
            print("here2here" + currentQuestion.answer)
            destination.correctAnswer = currentQuestion.answers[Int(currentQuestion.answer)! - 1]
            destination.selectedAnswer = currentSelected.titleLabel?.text
            destination.currentIndex = questionCurrentIndex
            destination.currentQuestion = currentQuestion?.text
            destination.questions = allQuestions
            destination.score = scoreCurrent
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if (identifier == "answers") {
            if (currentSelected == nil) {
                return false
            } else {
                return true
            }
        } else {
            return true
        }
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let col = UIColor(red:0.00, green:0.57, blue:0.58, alpha:1.0)
        if currentSelected != nil {
            currentSelected?.backgroundColor = col
            currentSelected?.setTitleColor(UIColor.white, for: .normal)
        }
        currentSelected = sender
        sender.backgroundColor = UIColor.white
        sender.setTitleColor(col, for: .normal)
    }
    
    @IBAction func backToHome(_ sender: Any) {
        performSegue(withIdentifier: "backHome", sender: self)
    }
    
}
