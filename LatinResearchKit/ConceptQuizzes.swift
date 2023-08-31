//
//  ConceptQuizzes.swift
//  LatinResearchKit
//
//  Created by Siddharth Ganapathy on 9/12/21.
//

import Foundation
import ResearchKit

public var quizRK: ORKOrderedTask {
    
        var x:Int = 1
    
        let instructionStep = ORKInstructionStep(identifier: "stroopInstructionStep")
        instructionStep.title = "Quiz Time!"
        instructionStep.text = "Your description goes here."
        instructionStep.image = UIImage(named: "stroop")
        instructionStep.imageContentMode = .center
        instructionStep.detailText = "There are 10 questions in total. Take your time answering each one. You can review your answers before you submit the quiz, after which you will not be able to edit the results."
        
        let questQuestionStepTitle = "What is your quest?"
        let textChoices = [
            ORKTextChoice(text: "Seek the Holy Grail", value: 0 as NSNumber),
            ORKTextChoice(text: "Seek the PS5", value: 1 as NSNumber),
            ORKTextChoice(text: "Seek the PS5", value: 2 as NSNumber),
            ORKTextChoice(text: "Seek the PS5", value: 3 as NSNumber)
        ]

        let questAnswerFormat: ORKTextChoiceAnswerFormat =
            ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: textChoices)
        let questQuestionStep = ORKQuestionStep(identifier: "TextChoiceQuestionStep", title: "Question \(x)", question: questQuestionStepTitle, answer: questAnswerFormat)
        questQuestionStep.isOptional = false
    
        let questQuestionStepTitle1 = "What is your quest?"
        let textChoices1 = [
            ORKTextChoice(text: "Seek the Holy Grail", value: 0 as NSNumber),
            ORKTextChoice(text: "Seek the PS5", value: 1 as NSNumber),
            ORKTextChoice(text: "Seek the PS5", value: 2 as NSNumber),
            ORKTextChoice(text: "Seek the PS5", value: 3 as NSNumber)
        ]
        x += 1

        let questAnswerFormat1: ORKTextChoiceAnswerFormat =
            ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: textChoices1)
        let questQuestionStep1 = ORKQuestionStep(identifier: "TextChoiceQuestionStep1", title: "Question \(x)", question: questQuestionStepTitle1, answer: questAnswerFormat1)
        questQuestionStep1.isOptional = false
    
        let questQuestionStepTitle2 = "What is your quest?"
        let textChoices2 = [
            ORKTextChoice(text: "Seek the Holy Grail", value: 0 as NSNumber),
            ORKTextChoice(text: "Seek the PS5", value: 1 as NSNumber),
            ORKTextChoice(text: "Seek the PS5", value: 2 as NSNumber),
            ORKTextChoice(text: "Seek the PS5", value: 3 as NSNumber)
        ]
        x += 1

        let questAnswerFormat2: ORKTextChoiceAnswerFormat =
            ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: textChoices2)
        let questQuestionStep2 = ORKQuestionStep(identifier: "TextChoiceQuestionStep2", title: "Question \(x)", question: questQuestionStepTitle2, answer: questAnswerFormat2)
        questQuestionStep2.isOptional = false
    
        let questQuestionStepTitle3 = "What is your quest?"
        let textChoices3 = [
            ORKTextChoice(text: "Seek the Holy Grail", value: 0 as NSNumber),
            ORKTextChoice(text: "Seek the PS5", value: 1 as NSNumber),
            ORKTextChoice(text: "Seek the PS5", value: 2 as NSNumber),
            ORKTextChoice(text: "Seek the PS5", value: 3 as NSNumber)
        ]
        x += 1

        let questAnswerFormat3: ORKTextChoiceAnswerFormat =
            ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: textChoices3)
        let questQuestionStep3 = ORKQuestionStep(identifier: "TextChoiceQuestionStep3", title: "Question \(x)", question: questQuestionStepTitle3, answer: questAnswerFormat3)
        questQuestionStep3.isOptional = false
        
        let questQuestionStepTitle4 = "What is your quest?"
        let textChoices4 = [
            ORKTextChoice(text: "Seek the Holy Grail", value: 0 as NSNumber),
            ORKTextChoice(text: "Seek the PS5", value: 1 as NSNumber),
            ORKTextChoice(text: "Seek the PS5", value: 2 as NSNumber),
            ORKTextChoice(text: "Seek the PS5", value: 3 as NSNumber)
        ]
        x += 1

        let questAnswerFormat4: ORKTextChoiceAnswerFormat =
            ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: textChoices4)
        let questQuestionStep4 = ORKQuestionStep(identifier: "TextChoiceQuestionStep4", title: "Question \(x)", question: questQuestionStepTitle4, answer: questAnswerFormat4)
        questQuestionStep4.isOptional = false
        
        let questQuestionStepTitle5 = "What is your quest?"
        let textChoices5 = [
            ORKTextChoice(text: "Seek the Holy Grail", value: 0 as NSNumber),
            ORKTextChoice(text: "Seek the PS5", value: 1 as NSNumber),
            ORKTextChoice(text: "Seek the PS5", value: 2 as NSNumber),
            ORKTextChoice(text: "Seek the PS5", value: 3 as NSNumber)
        ]
        x += 1

        let questAnswerFormat5: ORKTextChoiceAnswerFormat =
            ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: textChoices5)
        let questQuestionStep5 = ORKQuestionStep(identifier: "TextChoiceQuestionStep5", title: "Question \(x)", question: questQuestionStepTitle5, answer: questAnswerFormat5)
        questQuestionStep5.isOptional = false
        
        let questQuestionStepTitle6 = "What is your quest?"
        let textChoices6 = [
            ORKTextChoice(text: "Seek the Holy Grail", value: 0 as NSNumber),
            ORKTextChoice(text: "Seek the PS5", value: 1 as NSNumber),
            ORKTextChoice(text: "Seek the PS5", value: 2 as NSNumber),
            ORKTextChoice(text: "Seek the PS5", value: 3 as NSNumber)
        ]
        x += 1

        let questAnswerFormat6: ORKTextChoiceAnswerFormat =
            ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: textChoices6)
        let questQuestionStep6 = ORKQuestionStep(identifier: "TextChoiceQuestionStep6", title: "Question \(x)", question: questQuestionStepTitle6, answer: questAnswerFormat6)
        questQuestionStep6.isOptional = false
        
        let questQuestionStepTitle7 = "What is your quest?"
        let textChoices7 = [
            ORKTextChoice(text: "Seek the Holy Grail", value: 0 as NSNumber),
            ORKTextChoice(text: "Seek the PS5", value: 1 as NSNumber),
            ORKTextChoice(text: "Seek the PS5", value: 2 as NSNumber),
            ORKTextChoice(text: "Seek the PS5", value: 3 as NSNumber)
        ]
        x += 1

        let questAnswerFormat7: ORKTextChoiceAnswerFormat =
            ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: textChoices7)
        let questQuestionStep7 = ORKQuestionStep(identifier: "TextChoiceQuestionStep7", title: "Question \(x)", question: questQuestionStepTitle7, answer: questAnswerFormat7)
        questQuestionStep7.isOptional = false
        
        let questQuestionStepTitle8 = "What is your quest?"
        let textChoices8 = [
            ORKTextChoice(text: "Seek the Holy Grail", value: 0 as NSNumber),
            ORKTextChoice(text: "Seek the PS5", value: 1 as NSNumber),
            ORKTextChoice(text: "Seek the PS5", value: 2 as NSNumber),
            ORKTextChoice(text: "Seek the PS5", value: 3 as NSNumber)
        ]
        x += 1

        let questAnswerFormat8: ORKTextChoiceAnswerFormat =
            ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: textChoices8)
        let questQuestionStep8 = ORKQuestionStep(identifier: "TextChoiceQuestionStep8", title: "Question \(x)", question: questQuestionStepTitle8, answer: questAnswerFormat8)
        questQuestionStep8.isOptional = false
        
        let questQuestionStepTitle9 = "What is your quest?"
        let textChoices9 = [
            ORKTextChoice(text: "Seek the Holy Grail", value: 0 as NSNumber),
            ORKTextChoice(text: "Seek the PS5", value: 1 as NSNumber),
            ORKTextChoice(text: "Seek the PS5", value: 2 as NSNumber),
            ORKTextChoice(text: "Seek the PS5", value: 3 as NSNumber)
        ]
        x += 1

        let questAnswerFormat9: ORKTextChoiceAnswerFormat =
            ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: textChoices9)
        let questQuestionStep9 = ORKQuestionStep(identifier: "TextChoiceQuestionStep9", title: "Question \(x)", question: questQuestionStepTitle9, answer: questAnswerFormat9)
        questQuestionStep9.isOptional = false
        
        let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
        summaryStep.title = "Off you go!"
        summaryStep.text = "Bonam fortunam!"
        summaryStep.headerTextAlignment = .center
        summaryStep.bodyItemTextAlignment = .center

        return ORKOrderedTask(identifier: "quizRK", steps: [instructionStep, questQuestionStep, questQuestionStep1, questQuestionStep2, questQuestionStep3, questQuestionStep4, questQuestionStep5, questQuestionStep6, questQuestionStep7, questQuestionStep8, questQuestionStep9, summaryStep])
}
