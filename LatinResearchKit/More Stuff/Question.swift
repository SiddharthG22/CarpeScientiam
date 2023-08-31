//
//  Question.swift
//  LatinApp
//
//  Created by Siddharth Ganapathy on 5/20/21.
//

import Foundation

class Question {
    var question:String
//    var question:NSAttributedString
    let optionA:String
    let optionB:String
    let optionC:String
    let optionD:String
    let questionType:String
    let questionHint:String
    let fontAttributes:NSAttributedString
    let correctAnswer:Int
    
    init(questionText: String, choiceA: String, choiceB: String, choiceC: String, choiceD: String, type: String, hint: String, attributes: NSAttributedString, answer: Int) {
        question = questionText
        optionA = choiceA
        optionB = choiceB
        optionC = choiceC
        optionD = choiceD
        questionType = type
        questionHint = hint
        fontAttributes = attributes
        correctAnswer = answer
    }
    
}

class vocabQuestion {
    let question:String
    let changedForm:String
    let questionHint:String
    let correctAnswer:String
    
    init(questionText: String, genitive: String, hint: String, answer: String) {
        question = questionText
        changedForm = genitive
        questionHint = hint
        correctAnswer = answer
    }
    
    
}
