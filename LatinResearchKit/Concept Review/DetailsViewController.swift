//
//  DetailsViewController.swift
//  LatinResearchKit
//
//  Created by Siddharth Ganapathy on 9/8/21.
//

import UIKit
import ResearchKit
import WebKit
import SwiftUI

class DetailsViewController: UIViewController {
    
    //    ORKTaskViewControllerDelegate
    
    var level:String = ""
    var name:String = ""
    
    var FL_Items:String = ""
    var FL_bruh:String = ""
    
    var searching = Bool()
    var bookmarks = [String]()
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var bookmarkLesson: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.font = UIFont(name: "Cinzel", size: 17.5)
        textView.textColor = UIColor(red: 0.031, green: 0.379, blue: 0.704, alpha: 1.0)
        textView.textAlignment = .center
        
        if searching == false {
            textView.text = "\(FL_Items)\(level)"
            load(url: "https://dcc.dickinson.edu/grammar/latin/"+FL_Items+"")
        } else {
            textView.text = "\(FL_bruh)\(level)"
            load(url: "https://dcc.dickinson.edu/grammar/latin/"+FL_bruh+"")
        }
    }
    
    func load(url: String) {
        let myURL = URL(string: url)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    
    //    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
    //        taskViewController.dismiss(animated: true, completion: nil)
    //    }
    //
    //    func taskViewController(_ taskViewController: ORKTaskViewController, stepViewControllerWillAppear stepViewController: ORKStepViewController) {
    //        stepViewController.skipButtonItem = nil
    //    }
    
    //    func didSave() {
    //        let vc = storyboard?.instantiateViewController(withIdentifier: "BookmarksTableViewController") as? BookmarksTableViewController
    //        let vc = storyboard?.instantiateViewController(withIdentifier: "HomeTBController") as? HomeTBController
    //        vc!.bookmarks = bookmarks
    //        vc!.FL_Items = FL_Items
    //        vc!.level = level
    //        self.navigationController?.pushViewController(vc!, animated: true)
    //    }
    
    //    @IBAction func quizTapped(sender: UIBarButtonItem) {
    //        let taskViewController = ORKTaskViewController(task: quizRK, taskRun: nil)
    //        taskViewController.delegate = self
    //        taskViewController.outputDirectory = URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] , isDirectory: true)
    //        present(taskViewController, animated: true, completion: nil)
    //    }
    
    @IBAction func saveLesson(_ sender: UIBarButtonItem) {
        if bookmarkLesson.image == UIImage(systemName: "bookmark") {
            bookmarkLesson.image = UIImage(systemName: "bookmark.fill")
//            let imgData:NSData = UIImage.pngData(bookmarkLesson.image!)()! as NSData
            
            bookmarks.append(FL_Items)
            let myAlert = UIAlertController(title: "Lesson Saved!", message: nil, preferredStyle: .alert)
            myAlert.setTitle(font: UIFont(name: "Cinzel", size: 20.0), color: .black)
            myAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        
            self.present(myAlert, animated: true, completion: nil)
        } else if bookmarkLesson.image == UIImage(systemName: "bookmark.fill") {
            bookmarkLesson.image = UIImage(systemName: "bookmark")
//            let imgData:NSData = UIImage.pngData(bookmarkLesson.image!)()! as NSData
            
            let myAlert = UIAlertController(title: "Lesson Unsaved!", message: nil, preferredStyle: .alert)
            myAlert.setTitle(font: UIFont(name: "Cinzel", size: 20.0), color: .black)
            myAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            
            self.present(myAlert, animated: true, completion: nil)
        }
        
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "cquizSegue" {
            let vc = segue.destination as! ConQuizViewController
            vc.FL_Items = FL_Items
            vc.level = level
        } else {
            let vc = segue.destination as! BookmarksTableViewController
            vc.bookmarks = bookmarks
            vc.level = level
        }
    }
    
    
}
