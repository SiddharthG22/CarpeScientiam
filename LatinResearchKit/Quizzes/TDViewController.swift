//
//  TDViewController.swift
//  LatinResearchKit
//
//  Created by Siddharth Ganapathy on 10/7/21.
//

import UIKit
import WebKit

class TDViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    var events:String = ""
    
    let event = ["NLE", "NME", "NLVE", "NLCEE", "AP® Latin"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        load(url: "https://www.nle.org/Syllabus")
        if events == event[0] {
            load(url: "https://www.nle.org/Syllabus")
        } else if events == event[1] {
            load(url: "https://www.etclassics.org/Contests/National-Mythology-Exam")
        } else if events == event[2] {
            load(url: "https://www.njcl.org/Online-Exams/National-Latin-Vocabulary")
        } else if events == event[3] {
            load(url: "https://www.njcl.org/Online-Exams/National-Classical-Etymology")
        } else if events == event[4] {
            load(url: "https://apcentral.collegeboard.org/courses/ap-latin/exam")
        }
    }
    
    func load(url: String) {
        let myURL = URL(string: url)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
