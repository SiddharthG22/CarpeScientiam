//
//  IntroSurvey.swift
//  LatinResearchKit
//
//  Created by Siddharth Ganapathy on 9/1/21.
//

import Foundation
import UIKit
import ResearchKit

public var IntroSurvey: ORKOrderedTask {
  
//        var steps = [ORKFormStep]()
//        var newUser = true
        var x:Int = 1
    
        let steps = ORKFormStep(identifier: "FormStep", title: "New User Setup", text: "Asterixed questions must be answered. This survey shouldn't take more than 2 minutes to complete.")
    
        let section1 = ORKFormItem(sectionTitle: "Your Profile", detailText: "Fill in your information below", learnMoreItem: nil, showsProgress: true)
        let section2 = ORKFormItem(sectionTitle: "Experience", detailText: "Click on the text below to select your level", learnMoreItem: nil, showsProgress: true)
    
        let nameText = "Name*"
        let nameFormat = ORKAnswerFormat.textAnswerFormat()
        let nameItem = ORKFormItem(identifier: "NameStep", text: nameText, answerFormat: nameFormat)
        nameItem.placeholder = "Enter your name"
        nameItem.isOptional = false
    
        let pwordText = "Email"
        let pwordItem = ORKFormItem(identifier: "PasswordStep", text: pwordText, answerFormat: ORKAnswerFormat.emailAnswerFormat())
        pwordItem.placeholder = "Enter your email"

        let levelSelector = "How long have you been learning Latin?*"
        let levelChoices = [
            ORKTextChoice(text: "First Time Learning", value: 0 as NSNumber),
            ORKTextChoice(text: "1 Year", value: 1 as NSNumber),
            ORKTextChoice(text: "2 Years", value: 2 as NSNumber),
            ORKTextChoice(text: "3 Years", value: 3 as NSNumber),
            ORKTextChoice(text: "3+ Years", value: 4 as NSNumber)
        ]
    
        

        let levelAnswerFormat = ORKValuePickerAnswerFormat(textChoices: levelChoices)
        let levelQuestionItem = ORKFormItem(identifier: "LevelStep", text: levelSelector, answerFormat: levelAnswerFormat)
        levelQuestionItem.isOptional = false
    
        let aboutStepTitle = "What aspects of Latin interest you?*"
        let aboutChoices = [
            ORKTextChoice(text: "Spoken Language", value: 0 as NSNumber),
            ORKTextChoice(text: "Literature", value: 1 as NSNumber),
            ORKTextChoice(text: "History", value: 2 as NSNumber),
            ORKTextChoice(text: "Culture", value: 3 as NSNumber),
            ORKTextChoice(text: "Other", value: 4 as NSNumber)
        ]

        let aboutAnswerFormat: ORKTextChoiceAnswerFormat =
            ORKAnswerFormat.choiceAnswerFormat(with: .multipleChoice, textChoices: aboutChoices)
        let aboutQuestionItem = ORKFormItem(identifier: "AboutQuestionStep", text: aboutStepTitle, answerFormat: aboutAnswerFormat)
        aboutQuestionItem.isOptional = false
    
        let scaleText = "What do you think about Latin?"
        let scaleAnswerFormat = ORKScaleAnswerFormat(maximumValue: 10, minimumValue: 0, defaultValue: 0, step: 1, vertical: false, maximumValueDescription: "Very Relevant", minimumValueDescription: "Very Dead")
        scaleAnswerFormat.shouldHideRanges = false
        let scaleItem = ORKFormItem(identifier: "SliderStep", text: scaleText, answerFormat: scaleAnswerFormat)
        scaleItem.detailText = "Please be honest"
    
        let infoStepTitle = "How did you hear about us?*"
        let infoChoices = [
            ORKTextChoice(text: "Internet", value: 0 as NSNumber),
            ORKTextChoice(text: "Friends/Family", value: 1 as NSNumber),
            ORKTextChoice(text: "Email", value: 2 as NSNumber),
            ORKTextChoice(text: "In Class", value: 3 as NSNumber),
            ORKTextChoice(text: "Other", value: 4 as NSNumber)
        ]

        let infoAnswerFormat: ORKTextChoiceAnswerFormat =
            ORKAnswerFormat.choiceAnswerFormat(with: .multipleChoice, textChoices: infoChoices)
        let infoQuestionItem = ORKFormItem(identifier: "InfoQuestionStep", text: infoStepTitle, answerFormat: infoAnswerFormat)
        infoQuestionItem.isOptional = false
    
        steps.formItems = [
            section1,
            nameItem,
            pwordItem,
            section2,
            levelQuestionItem,
            aboutQuestionItem,
            infoQuestionItem,
            scaleItem
        ]
        
        let consentDocument = ConsentDocument
        let visualConsentStep = ORKVisualConsentStep(identifier: "VisualConsentStep", document: consentDocument)
        

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
    
//    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            let vc = segue.destination as! ViewController
//            vc.nameFormat = nameFormat
//    }

    return ORKOrderedTask(identifier: "IntroSurvey", steps: [steps, visualConsentStep, summaryStep])

//        return ORKOrderedTask(identifier: "IntroSurvey", steps: [steps, visualConsentStep, questQuestionStep, questQuestionStep1, questQuestionStep2, questQuestionStep3, questQuestionStep4, questQuestionStep5, questQuestionStep6, questQuestionStep7, questQuestionStep8, questQuestionStep9, summaryStep])

        
}
    



