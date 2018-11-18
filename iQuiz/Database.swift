//
//  Database.swift
//  iQuiz
//
//  Created by Sagar Surana on 11/5/18.
//  Copyright © 2018 ischoolsagar. All rights reserved.
//

import UIKit

class Categories: Decodable {
    var title: String
    var desc: String
    var icons: String?
    var questions: [Questions]
    
    init(nameVal: String, descriptionVal: String, iconsVal: String?, questVals: [Questions]) {
        icons = iconsVal
        title = nameVal
        desc = descriptionVal
        questions = questVals
    }
}

class Questions: Decodable {
    var text: String
    var answers: [String]
    var answer: String
    
    init(questVal: String, answersVal: [String], correct: String) {
        text = questVal
        answers = answersVal
        answer = correct
    }
}

let mathQ1 = Questions.init(questVal: "What is the value of π?", answersVal: ["3.1415926", "3.1421367", "3.1415729", "3.1415927"], correct: "1")

let mathQ2 = Questions(questVal: "What is the newest shape discovered naturally existing in nature?", answersVal: ["Crytoid", "Cellugon", "Scutoid", "Sporium"], correct: "3")

let b99Q1 = Questions(questVal: "What's Boyle's son's name?", answersVal: ["Charles Jr.", "Nicolage", "Nick", "Nico"], correct: "2")

let b99Q2 = Questions(questVal: "Who knows best?", answersVal: ["Amy Knows Best", "Jake Knows Best", "Rosa Knows Best", "Gina Knows Best"], correct: "4")

let geogQ1 = Questions(questVal: "Which of these is not a Seven Wonders of the World?", answersVal: ["The Colosseum", "Chichen Itza", "Great Pyramid of Giza", "Statue of Liberty"], correct: "4")

let geogQ2 = Questions(questVal: "Which of these is not a world capital?", answersVal: ["Toronto", "Addis Ababa", "Harare", "Singapore"], correct: "1")

let math = Categories(nameVal: "Math", descriptionVal: "Quizzes you on simple calculus questions", iconsVal: "math", questVals: [mathQ1, mathQ2])

let geog = Categories.init(nameVal: "Geography", descriptionVal: "Questions related to different countries, cultures and capitals", iconsVal: "geog", questVals: [geogQ1, geogQ2])

let b99 = Categories(nameVal: "Brooklyn Nine-Nine", descriptionVal: "Simple trivia for fans of Brooklyn Nine-Nine", iconsVal: "b99", questVals: [b99Q1, b99Q2])

var database = [math, geog, b99]
