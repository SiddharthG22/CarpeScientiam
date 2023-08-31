//
//  ViewController.swift
//  LatinResearchKit
//
//  Created by Siddharth Ganapathy on 9/1/21.
//

import UIKit
import ResearchKit

class ViewController: UIViewController, ORKTaskViewControllerDelegate {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    
    var nameFormat = ORKAnswerFormat()
    var profileCreated:Bool = false
    
    var name:String = ""
    var level:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.layer.cornerRadius = 10.0
        button1.layer.borderWidth = 2.0
        button1.layer.borderColor = UIColor.init(red: 0.72, green: 0.7, blue: 0.7, alpha: 0.7).cgColor
        
        button2.layer.cornerRadius = 10.0
        button2.layer.borderWidth = 2.0
        button2.layer.borderColor = UIColor.init(red: 0.72, green: 0.7, blue: 0.7, alpha: 0.7).cgColor
        
        //
        //        let value = UserDefaults.standard.bool(forKey: "userData")
        //        if value != nil {
        //            profileCreated = value
        //        } else {
        //            profileCreated = false
        //        }
        
        if profileCreated == true {
            let myAlert = UIAlertController(title: "Salve, \(name)!", message: "Your Level: \(level)", preferredStyle: .alert)
            
            myAlert.setTitle(font: UIFont(name: "Cinzel", size: 20.0), color: .black)
            myAlert.setMessage(font: UIFont(name: "Cinzel", size: 12.5), color: .black)
            
            myAlert.addAction(UIAlertAction(title: "LET'S GO!", style: .default, handler: {action in self.performSegue(withIdentifier: "retSegue", sender: nil)}))
            
            //            UserDefaults.standard.set(myAlert, forKey: "userData")
            self.present(myAlert, animated: true, completion: nil)
        }
    }
    
    @IBAction func retButton(_ sender: UIButton) {
        if profileCreated == true {
            let myAlert = UIAlertController(title: "Salve, \(name)!", message: "Your Level: \(level)", preferredStyle: .alert)
            
            myAlert.setTitle(font: UIFont(name: "Cinzel", size: 20.0), color: .black)
            myAlert.setMessage(font: UIFont(name: "Cinzel", size: 12.5), color: .black)
            
            myAlert.addAction(UIAlertAction(title: "LET'S GO!", style: .default, handler: {action in self.performSegue(withIdentifier: "retSegue", sender: nil)}))
            
            self.present(myAlert, animated: true, completion: nil)
        } else {
            let myAlert = UIAlertController(title: "Create a profile first!", message: nil, preferredStyle: .alert)
            
            myAlert.setTitle(font: UIFont(name: "Cinzel", size: 20.0), color: .black)
            myAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(myAlert, animated: true, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "newSegue" {
            let vc = segue.destination as! SelectionViewController
            vc.profileCreated = profileCreated
        }
    }
    
    
    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
        taskViewController.dismiss(animated: true, completion: nil)
    }
    
    func taskViewController(_ taskViewController: ORKTaskViewController, stepViewControllerWillAppear stepViewController: ORKStepViewController) {
        stepViewController.skipButtonItem = nil
    }
    
    //    @IBAction func surveyTapped(sender: Any) {
    //        let taskViewController = ORKTaskViewController(task: IntroSurvey, taskRun: nil)
    //        taskViewController.delegate = self
    //        //       taskViewController.outputDirectory = URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] , isDirectory: true)
    //        present(taskViewController, animated: true, completion: nil)
    //    }
}
