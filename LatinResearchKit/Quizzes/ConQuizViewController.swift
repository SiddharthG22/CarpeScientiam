//
//  ConQuizViewController.swift
//  LatinResearchKit
//
//  Created by Siddharth Ganapathy on 9/27/21.
//

import UIKit

class ConQuizViewController: UIViewController, UITextFieldDelegate {

    let levels = ["Intro. to Latin", "Latin 1", "Latin 2", "Latin 3/4", "Advanced Latin"]
    var wrong = [String]()
    var level:String = ""

    @IBOutlet weak var scoreView: UITextView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIView!
    @IBOutlet weak var textField: UITextField!
    
    let allQuestions = QuestionBank()

    var qType:String = ""
    var qHint:String = ""
    var FL_Items:String = ""
    
    var aText = NSAttributedString()
    var hintUsed = Bool()
    
    var rightAnswer = String()
    var questionNumber:Int = 0
    var remainingHints:Int = 4
    var score:Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuestion()
        updateScreen()
        self.textField.delegate = self
        textField.placeholder = "Enter your answer"
        textField.font = UIFont.init(name: "Cinzel", size: 15.0)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nText = textField.text!
        if nText == rightAnswer || nText == rightAnswer.lowercased() || nText == rightAnswer.uppercased() {
            questionLabel.text = "Optime!"
            textField.text = ""
        } else {
            questionLabel.text = rightAnswer
            textField.text = ""
            if !wrong.contains(rightAnswer) {
                wrong.append(rightAnswer)
            }
        }
        textField.resignFirstResponder()
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func hintPressed(_ sender: UIBarButtonItem) {
        hintUsed = true
        remainingHints -= 1
        let myAlert = UIAlertController(title: "HINT!", message: "\(qHint)", preferredStyle: .alert)
        let OK = UIAlertAction(title: "OK", style: .default, handler: nil)
        let getMore = UIAlertAction(title: "GET MORE", style: .default, handler: {action in self.getMore()})
        
        myAlert.setTitle(font: UIFont(name: "Cinzel", size: 20.0), color: .black)
        myAlert.setMessage(font: UIFont(name: "Cinzel", size: 15.0), color: .black)
        myAlert.addAction(OK)

        self.present(myAlert, animated: true, completion: nil)
        
        if remainingHints == 0 {
            hintUsed = false
            remainingHints -= 0

            myAlert.addAction(getMore)
            myAlert.title = "EHEU!"
            myAlert.message = "You're out of hints! You can either continue on or get two additional hints which will result in a point being deducted."
            myAlert.setMessage(font: UIFont(name: "Cinzel", size: 15.0), color: .black)
            
            self.present(myAlert, animated: true, completion: nil)
        }
    }

    func getMore() {
//        hintUsed = true
        remainingHints += 3
        score -= 1
        updateScreen()
    }
    
    func updateScreen() {
        progressBar.frame.size.width = (view.frame.size.width / CGFloat(8.0)) * CGFloat(questionNumber)
        scoreView.text = "Score: \(score)/\(8.0)"
    }
    
    func restartQuiz() {
        score = 0
        questionNumber = 0
        updateQuestion()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
    func updateQuestion() {
        //First Time Learning Diagnostic Tests
        if FL_Items == "Alphabet" {
            if questionNumber <= allQuestions.introVocab_N.count - 1 {
                if questionNumber == 0 {
                    allQuestions.introVocab_N.shuffle()
                }
                    questionLabel.text = allQuestions.introVocab_N[questionNumber].question
                    questionLabel.font = UIFont(name: "Cinzel", size: 20.0)
                    questionLabel.textAlignment = .center
                
                    rightAnswer = allQuestions.introVocab_N[questionNumber].correctAnswer
                    qHint = allQuestions.introVocab_N[questionNumber].questionHint
                    questionNumber += 1
            } else {
                let myAlert = UIAlertController(title: "QUIZ COMPLETE!", message: "Bene factum!", preferredStyle: UIAlertController.Style.alert)
                let restart = UIAlertAction(title: "Restart", style: .destructive, handler: {action in self.restartQuiz()})
                
                myAlert.setTitle(font: UIFont(name: "Cinzel", size: 20.0), color: .black)
                myAlert.setMessage(font: UIFont(name: "Cinzel", size: 15.0), color: .black)
//                myAlert.addAction(viewScore)
                myAlert.addAction(restart)
                
                self.present(myAlert, animated: true, completion: nil)
                
            }
            updateScreen()
            
        } else if FL_Items == "inflected-language" {
            if questionNumber <= allQuestions.introVocab_N.count - 1 {
                if questionNumber == 0 {
                    allQuestions.introVocab_N.shuffle()
                }
                    questionLabel.text = allQuestions.introVocab_N[questionNumber].question
                    questionLabel.font = UIFont(name: "Cinzel", size: 20.0)
                    questionLabel.textAlignment = .center
                
                    rightAnswer = allQuestions.introVocab_N[questionNumber].correctAnswer
                    qHint = allQuestions.introVocab_N[questionNumber].questionHint
                    questionNumber += 1
            } else {
                let myAlert = UIAlertController(title: "QUIZ COMPLETE!", message: "Bene factum!", preferredStyle: UIAlertController.Style.alert)
                let restart = UIAlertAction(title: "Restart", style: .destructive, handler: {action in self.restartQuiz()})
                
                myAlert.setTitle(font: UIFont(name: "Cinzel", size: 20.0), color: .black)
                myAlert.setMessage(font: UIFont(name: "Cinzel", size: 15.0), color: .black)
//                myAlert.addAction(viewScore)
                myAlert.addAction(restart)
                
                self.present(myAlert, animated: true, completion: nil)
                
            }
            updateScreen()
    }

}
}
