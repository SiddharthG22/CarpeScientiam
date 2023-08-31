//
//  EDViewController.swift
//  LatinResearchKit
//
//  Created by Siddharth Ganapathy on 10/2/21.
//

import UIKit
import WebKit

class EDViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    var events:String = ""
    
    let event = ["National Convention (NJCL)", "State Convention (CAJCL)", "Carcer (Certamen)", "SCRAM (Southern CA.)", "Ludi (Northern CA.)", "ACL Institute"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if events == event[0] {
            load(url: "https://www.cajcl.org/national-convention.html")
        } else if events == event[1] {
            load(url: "https://www.cajcl.org/state-convention.html")
        } else if events == event[2] {
            load(url: "https://www.cajcl.org/carcer.html")
        } else if events == event[3] {
            load(url: "https://www.cajcl.org/socal---scram.html")
        } else if events == event[4] {
            load(url: "https://www.cajcl.org/norcal---ludi.html")
        } else if events == event[5] {
            load(url: "https://www.aclclassics.org/ACL-Institute/ACL-Institute-2021")
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
