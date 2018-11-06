//
//  AnswersViewControllera.swift
//  iQuiz
//
//  Created by Sagar Surana on 11/5/18.
//  Copyright © 2018 ischoolsagar. All rights reserved.
//

import UIKit

internal class AnswersViewController: UIViewController {
    
    @IBOutlet weak var questionAsked: UILabel!
    @IBOutlet weak var sorryNotSorry: UILabel!
    @IBOutlet weak var answerDisplay: UILabel!
    var correctAnswer: String!
    var selectedAnswer: String!
    var currentIndex: Int!
    var currentQuestion: String!
    var questions: [Questions]!
    var score: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionAsked.text = currentQuestion
        if correctAnswer == selectedAnswer {
            sorryNotSorry.text = "That's the right answer!"
            score = score + 1
        } else {
            sorryNotSorry.text = "Sorry, that is incorrect!"
        }
        answerDisplay.text = "The right answer is: \"" + correctAnswer + "\"."
    }
    @IBAction func nextPressed(_ sender: Any) {
        if currentIndex == questions.count - 1 {
            performSegue(withIdentifier: "finish", sender: self)
        } else {
            performSegue(withIdentifier: "questionAgain", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "questionAgain") {
            let destination = segue.destination as! QuestionsViewController
            destination.questionCurrentIndex = currentIndex + 1
            destination.allQuestions = questions
            destination.scoreCurrent = score
        } else if (segue.identifier == "finish") {
            let destination = segue.destination as! FinishViewController
            destination.totalScore = score
        }
    }
    @IBAction func backHome(_ sender: Any) {
        performSegue(withIdentifier: "goingHome", sender: self)
    }
}
