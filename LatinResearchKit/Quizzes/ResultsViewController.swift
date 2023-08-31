//
//  ResultsViewController.swift
//  LatinResearchKit
//
//  Created by Siddharth Ganapathy on 10/1/21.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var level:String = ""
    var str:String = ""
    var diagnosticTests:String = ""
    
    var name:String!
    var wrong = [String]()
    var recResources = [String]()
    
    var segued = true
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var button1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button1.layer.cornerRadius = 10.0
        
        textView.textColor = UIColor(red: 0.031, green: 0.379, blue: 0.704, alpha: 1.0)
        textView.font = UIFont(name: "Cinzel", size: 25.0)
        textView.textAlignment = .center
        
        for item in 0 ..< wrong.count {
            recResources.append("\(item)")
            str += "\(wrong[item].uppercased())\n"
            if wrong.count == 1 {
                textView.text = "Area of Improvement: \n\n" + str
            } else {
                textView.text = "Areas of Improvement: \n\n" + str
            }
        }
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "cReview" {
            let vc = segue.destination as! TopicsTableViewController
            vc.level = level
            vc.diagnosticTests = diagnosticTests
            vc.wrong = wrong
        }
    }

}
