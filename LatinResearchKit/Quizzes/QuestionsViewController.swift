//
//  QuestionsViewController.swift
//  LatinApp
//
//  Created by Siddharth Ganapathy on 4/19/21.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    let levels = ["Intro. to Latin", "Latin 1", "Latin 2", "Latin 3/4", "Advanced Latin"]
    var wrong = [String]()
    
    @IBOutlet weak var scoreView: UITextView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var optionA: UIButton!
    @IBOutlet weak var optionB: UIButton!
    @IBOutlet weak var optionC: UIButton!
    @IBOutlet weak var optionD: UIButton!
    
    var correctSender = UIButton()
    
    let allQuestions = QuestionBank()
    
    var qType:String = ""
    var qHint:String = ""
    var diagnosticTests:String = ""
    
    var aText = NSAttributedString()
    var hintUsed = Bool()
    
    var rightAnswer = Int()
    var userScore:Int = 100
    
    var questionNumber:Int = 0
    var remainingHints:Int = 4
    var score:Double = 0
    
    var name:String!
    var level:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuestion()
        updateScreen()
        
        optionA.tag = 1
        optionB.tag = 2
        optionC.tag = 3
        optionD.tag = 4
        
        let titleLabel1 = UILabel()
        
        titleLabel1.text = "\(diagnosticTests)"
        titleLabel1.font = UIFont(name: "Cinzel", size: 25.0)
        titleLabel1.textColor = .black
        titleLabel1.sizeToFit()

        navigationItem.titleView = titleLabel1
        
        if diagnosticTests == "Grammar" || diagnosticTests == "Derivatives" {
            let myAlert = UIAlertController(title: "QUIZ INSTRUCTIONS", message: "Choose the most accurate translation of the word or phrase in red. Bonam fortunam!", preferredStyle: .alert)
            
            myAlert.setTitle(font: UIFont(name: "Cinzel", size: 20.0), color: .black)
            myAlert.setMessage(font: UIFont(name: "Cinzel", size: 12.5), color: .black)
            myAlert.addAction(UIAlertAction(title: "CONTINUE", style: .default, handler: nil))
            self.present(myAlert, animated: true, completion: nil)
        } else {
            let myAlert = UIAlertController(title: "QUIZ INSTRUCTIONS", message: "Choose the most accurate answer using the buttons below. Bonam fortunam!", preferredStyle: .alert)
            
            myAlert.setTitle(font: UIFont(name: "Cinzel", size: 20.0), color: .black)
            myAlert.setMessage(font: UIFont(name: "Cinzel", size: 12.5), color: .black)
            myAlert.addAction(UIAlertAction(title: "CONTINUE", style: .default, handler: nil))
            self.present(myAlert, animated: true, completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func answerPressed(_ sender: UIButton) {
        if sender.tag == rightAnswer && hintUsed == false {
            sender.backgroundColor = .green
            score += 1
            imageView.isHidden = false
            imageView.image = UIImage(named: "optime")
            questionLabel.text = ""
            
            hintUsed = false
        } else if sender.tag == rightAnswer && hintUsed == true {
            sender.backgroundColor = .green
            score += 0.5
            imageView.isHidden = false
            imageView.image = UIImage(named: "optime")
            questionLabel.text = ""
            
            hintUsed = false
        } else {
            sender.backgroundColor = .red
            score += 0
            imageView.isHidden = false
            imageView.image = UIImage(named: "sad")
            questionLabel.text = ""
            
            hintUsed = false
            if !wrong.contains(qType) {
                wrong.append(qType)
            }
        }
        updateScreen()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.25) { [self] in
            sender.backgroundColor = UIColor(red: 0.881, green: 0.899, blue: 0.928, alpha: 1.0)
            updateQuestion()
        }
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
        let vc = segue.destination as! ResultsViewController
        vc.diagnosticTests = diagnosticTests
        vc.level = level
        vc.name = name
        vc.wrong = wrong
    }
    
    func updateQuestion() {
        //First Time Learning Diagnostic Tests
        imageView.isHidden = true
        
        if diagnosticTests == "Grammar" {
            if questionNumber <= allQuestions.introList_Gr.count - 1 {
                if questionNumber == 0 {
                    allQuestions.introList_Gr.shuffle()
                }
                let message = allQuestions.introList_Gr[questionNumber].question
                questionLabel.text = message
                let aFont = UIColor.red
                let text = questionLabel.text ?? ""
                let attributedString = NSAttributedString.adjustText(for: aFont, in: text, as: allQuestions.introList_Gr[questionNumber].fontAttributes.string)
                questionLabel.attributedText = attributedString
                questionLabel.textAlignment = .center
                
                questionLabel.font = UIFont(name: "Cinzel", size: 20.0)
                optionA.setTitle(allQuestions.introList_Gr[questionNumber].optionA, for: UIControl.State.normal)
                optionB.setTitle(allQuestions.introList_Gr[questionNumber].optionB, for: UIControl.State.normal)
                optionC.setTitle(allQuestions.introList_Gr[questionNumber].optionC, for: UIControl.State.normal)
                optionD.setTitle(allQuestions.introList_Gr[questionNumber].optionD, for: UIControl.State.normal)
                rightAnswer = allQuestions.introList_Gr[questionNumber].correctAnswer
                qType = allQuestions.introList_Gr[questionNumber].questionType
                qHint = allQuestions.introList_Gr[questionNumber].questionHint
                
                userScore += 10
                questionNumber += 1
            } else {
                userScore -= 10
                let myAlert = UIAlertController(title: "QUIZ COMPLETE!", message: "Bene factum!", preferredStyle: UIAlertController.Style.alert)
                let viewScore = UIAlertAction(title: "GO", style: .default, handler: {action in self.performSegue(withIdentifier: "resultSegue", sender: nil)})
                let restart = UIAlertAction(title: "CANCEL", style: .destructive, handler: {action in self.restartQuiz()})
                
                myAlert.setTitle(font: UIFont(name: "Cinzel", size: 20.0), color: .black)
                myAlert.setMessage(font: UIFont(name: "Cinzel", size: 15.0), color: .black)
                myAlert.addAction(restart)
                myAlert.addAction(viewScore)
                
                self.present(myAlert, animated: true, completion: nil)
                
            }
            updateScreen()
            
        } else if diagnosticTests == "History" {
            if questionNumber <= allQuestions.introList_H.count - 1 {
                if questionNumber == 0 {
                    allQuestions.introList_H.shuffle()
                }
                let message = allQuestions.introList_H[questionNumber].question
                questionLabel.text = message
                let aFont = UIColor.red
                let text = questionLabel.text ?? ""
                let attributedString = NSAttributedString.adjustText(for: aFont, in: text, as: allQuestions.introList_H[questionNumber].fontAttributes.string)
                questionLabel.attributedText = attributedString
                questionLabel.textAlignment = .center
                
                questionLabel.font = UIFont(name: "Cinzel", size: 20.0)
                optionA.setTitle(allQuestions.introList_H[questionNumber].optionA, for: UIControl.State.normal)
                optionB.setTitle(allQuestions.introList_H[questionNumber].optionB, for: UIControl.State.normal)
                optionC.setTitle(allQuestions.introList_H[questionNumber].optionC, for: UIControl.State.normal)
                optionD.setTitle(allQuestions.introList_H[questionNumber].optionD, for: UIControl.State.normal)
                rightAnswer = allQuestions.introList_H[questionNumber].correctAnswer
                qType = allQuestions.introList_H[questionNumber].questionType
                qHint = allQuestions.introList_H[questionNumber].questionHint
                
                userScore += 10
                questionNumber += 1
            } else {
                userScore -= 10
                let myAlert = UIAlertController(title: "QUIZ COMPLETE!", message: "Bene factum!", preferredStyle: UIAlertController.Style.alert)
                let restart = UIAlertAction(title: "Restart", style: .destructive, handler: {action in self.restartQuiz()})
                //                let viewScore = UIAlertAction(title: "Results", style: .default, handler: {action in self.performSegue(withIdentifier: "resultSegue", sender: nil)})
                
                myAlert.setTitle(font: UIFont(name: "Cinzel", size: 20.0), color: .black)
                myAlert.setMessage(font: UIFont(name: "Cinzel", size: 15.0), color: .black)
                //                myAlert.addAction(viewScore)
                myAlert.addAction(restart)
                
                self.present(myAlert, animated: true, completion: nil)
            }
            updateScreen()
            
        } else if diagnosticTests == "Derivatives" {
            if questionNumber <= allQuestions.introList_De.count - 1 {
                if questionNumber == 0 {
                    allQuestions.introList_De.shuffle()
                }
                let message = allQuestions.introList_De[questionNumber].question
                questionLabel.text = message
                let aFont = UIColor.red
                let text = questionLabel.text ?? ""
                let attributedString = NSAttributedString.adjustText(for: aFont, in: text, as: allQuestions.introList_De[questionNumber].fontAttributes.string)
                questionLabel.attributedText = attributedString
                questionLabel.textAlignment = .center
                
                questionLabel.font = UIFont(name: "Cinzel", size: 20.0)
                optionA.setTitle(allQuestions.introList_De[questionNumber].optionA, for: UIControl.State.normal)
                optionB.setTitle(allQuestions.introList_De[questionNumber].optionB, for: UIControl.State.normal)
                optionC.setTitle(allQuestions.introList_De[questionNumber].optionC, for: UIControl.State.normal)
                optionD.setTitle(allQuestions.introList_De[questionNumber].optionD, for: UIControl.State.normal)
                rightAnswer = allQuestions.introList_De[questionNumber].correctAnswer
                qType = allQuestions.introList_De[questionNumber].questionType
                qHint = allQuestions.introList_De[questionNumber].questionHint
                
                userScore += 10
                questionNumber += 1
            } else {
                userScore -= 10
                let myAlert = UIAlertController(title: "QUIZ COMPLETE!", message: "Bene factum!", preferredStyle: UIAlertController.Style.alert)
                let restart = UIAlertAction(title: "Restart", style: .destructive, handler: {action in self.restartQuiz()})
                //                let viewScore = UIAlertAction(title: "Results", style: .default, handler: {action in self.performSegue(withIdentifier: "resultSegue", sender: nil)})
                
                myAlert.setTitle(font: UIFont(name: "Cinzel", size: 20.0), color: .black)
                myAlert.setMessage(font: UIFont(name: "Cinzel", size: 15.0), color: .black)
                //                myAlert.addAction(viewScore)
                myAlert.addAction(restart)
                
                self.present(myAlert, animated: true, completion: nil)
            }
            updateScreen()
            
        } else if diagnosticTests == "Culture" {
            if questionNumber <= allQuestions.introList_DL.count - 1 {
                if questionNumber == 0 {
                    allQuestions.introList_DL.shuffle()
                }
                let message = allQuestions.introList_DL[questionNumber].question
                questionLabel.text = message
                let aFont = UIColor.red
                let text = questionLabel.text ?? ""
                let attributedString = NSAttributedString.adjustText(for: aFont, in: text, as: allQuestions.introList_DL[questionNumber].fontAttributes.string)
                questionLabel.attributedText = attributedString
                questionLabel.textAlignment = .center
                
                questionLabel.font = UIFont(name: "Cinzel", size: 20.0)
                optionA.setTitle(allQuestions.introList_DL[questionNumber].optionA, for: UIControl.State.normal)
                optionB.setTitle(allQuestions.introList_DL[questionNumber].optionB, for: UIControl.State.normal)
                optionC.setTitle(allQuestions.introList_DL[questionNumber].optionC, for: UIControl.State.normal)
                optionD.setTitle(allQuestions.introList_DL[questionNumber].optionD, for: UIControl.State.normal)
                rightAnswer = allQuestions.introList_DL[questionNumber].correctAnswer
                qType = allQuestions.introList_DL[questionNumber].questionType
                qHint = allQuestions.introList_DL[questionNumber].questionHint
                
                userScore += 10
                questionNumber += 1
            } else {
                userScore -= 10
                let myAlert = UIAlertController(title: "QUIZ COMPLETE!", message: "Bene factum!", preferredStyle: UIAlertController.Style.alert)
                let restart = UIAlertAction(title: "Restart", style: .destructive, handler: {action in self.restartQuiz()})
                //                let viewScore = UIAlertAction(title: "Results", style: .default, handler: {action in self.performSegue(withIdentifier: "resultSegue", sender: nil)})
                
                myAlert.setTitle(font: UIFont(name: "Cinzel", size: 20.0), color: .black)
                myAlert.setMessage(font: UIFont(name: "Cinzel", size: 15.0), color: .black)
                //                myAlert.addAction(viewScore)
                myAlert.addAction(restart)
                
                self.present(myAlert, animated: true, completion: nil)
            }
            updateScreen()
        }
            
//        } else if diagnosticTests == "Mythology" {
//            if questionNumber <= allQuestions.introList_M.count - 1 {
//                if questionNumber == 0 {
//                    allQuestions.introList_M.shuffle()
//                }
//                let message = allQuestions.introList_Gr[questionNumber].question
//                questionLabel.text = message
//                let aFont = UIColor.red
//                let text = questionLabel.text ?? ""
//                let attributedString = NSAttributedString.adjustText(for: aFont, in: text, as: allQuestions.introList_Gr[questionNumber].fontAttributes.string)
//                questionLabel.attributedText = attributedString
//                questionLabel.textAlignment = .center
//
//                questionLabel.font = UIFont(name: "Cinzel", size: 20.0)
//                optionA.setTitle(allQuestions.introList_M[questionNumber].optionA, for: UIControl.State.normal)
//                optionB.setTitle(allQuestions.introList_M[questionNumber].optionB, for: UIControl.State.normal)
//                optionC.setTitle(allQuestions.introList_M[questionNumber].optionC, for: UIControl.State.normal)
//                optionD.setTitle(allQuestions.introList_M[questionNumber].optionD, for: UIControl.State.normal)
//                rightAnswer = allQuestions.introList_M[questionNumber].correctAnswer
//                qType = allQuestions.introList_M[questionNumber].questionType
//                qHint = allQuestions.introList_M[questionNumber].questionHint
//
//                userScore += 10
//                questionNumber += 1
//            } else {
//                userScore -= 10
//                let myAlert = UIAlertController(title: "QUIZ COMPLETE!", message: "Bene factum!", preferredStyle: UIAlertController.Style.alert)
//                let restart = UIAlertAction(title: "Restart", style: .destructive, handler: {action in self.restartQuiz()})
//                //                let viewScore = UIAlertAction(title: "Results", style: .default, handler: {action in self.performSegue(withIdentifier: "resultSegue", sender: nil)})
//
//                myAlert.setTitle(font: UIFont(name: "Cinzel", size: 20.0), color: .black)
//                myAlert.setMessage(font: UIFont(name: "Cinzel", size: 15.0), color: .black)
//                //                myAlert.addAction(viewScore)
//                myAlert.addAction(restart)
//
//                self.present(myAlert, animated: true, completion: nil)
//            }
//            updateScreen()
            
//        }
    }
}
