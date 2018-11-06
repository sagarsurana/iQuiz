//
//  Database.swift
//  iQuiz
//
//  Created by Sagar Surana on 11/5/18.
//  Copyright © 2018 ischoolsagar. All rights reserved.
//

import UIKit

class Categories {
    var name: String
    var description: String
    var icons: String
    var questions: [Questions]
    
    init(nameVal: String, descriptionVal: String, iconsVal: String, questVals: [Questions]) {
        name = nameVal
        description = descriptionVal
        icons = iconsVal
        questions = questVals
    }
}

class Questions {
    var question: String
    var answer: [String]
    var correctAnswer: Int
    
    init(questVal: String, answers: [String], correct: Int) {
        question = questVal
        answer = answers
        correctAnswer = correct
    }
}

let mathQ1 = Questions.init(questVal: "What is the value of π?", answers: ["3.1415926", "3.1421367", "3.1415729", "3.1415927"], correct: 0)

let mathQ2 = Questions.init(questVal: "What is the newest shape discovered naturally existing in nature?", answers: ["Crytoid", "Cellugon", "Scutoid", "Sporium"], correct: 2)

let b99Q1 = Questions.init(questVal: "What's Boyle's son's name?", answers: ["Charles Jr.", "Nicolage", "Nick", "Nico"], correct: 1)

let b99Q2 = Questions.init(questVal: "Who knows best?", answers: ["Amy Knows Best", "Jake Knows Best", "Rosa Knows Best", "Gina Knows Best"], correct: 3)

let geogQ1 = Questions.init(questVal: "Which of these is not a Seven Wonders of the World?", answers: ["The Colosseum", "Chichen Itza", "Great Pyramid of Giza", "Statue of Liberty"], correct: 3)

let geogQ2 = Questions.init(questVal: "Which of these is not a world capital?", answers: ["Toronto", "Addis Ababa", "Harare", "Singapore"], correct: 0)

let math = Categories.init(nameVal: "Math", descriptionVal: "Quizzes you on simple calculus questions", iconsVal: "math", questVals: [mathQ1, mathQ2])

let geog = Categories.init(nameVal: "Geography", descriptionVal: "Questions related to different countries, cultures and capitals", iconsVal: "geog", questVals: [geogQ1, geogQ2])

let b99 = Categories.init(nameVal: "Brooklyn Nine-Nine", descriptionVal: "Simple trivia for fans of Brooklyn Nine-Nine", iconsVal: "b99", questVals: [b99Q1, b99Q2])

var database = [math, geog, b99]
