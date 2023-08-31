//
//  RulesViewController.swift
//  LatinResearchKit
//
//  Created by Siddharth Ganapathy on 10/8/21.
//

import UIKit

class RulesViewController: UIViewController {

    var textView:UITextView?
    var sysPref:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView = UITextView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        self.view.addSubview(textView!)
        
        textView!.center = self.view.center
        textView!.textAlignment = .center
        textView!.textColor = UIColor.init(red: 0.031, green: 0.379, blue: 0.704, alpha: 1.0)
        textView?.font = UIFont.init(name: "Cinzel", size: 20.0)
        textView!.adjustsFontForContentSizeCategory = true
        textView!.backgroundColor = .systemGray6
        
        if sysPref == "About" {
            textView?.text = "\nkdubvfeimldksfjnwdosfmoiedmoifoijefoji"
        } else if sysPref == "Copyright/Attributions" {
            textView?.text = "\nudfiuvusrgudohjgiurtughhldtugigurruit"
        } else if sysPref == "What is this?" {
            textView?.text = "\nHebden Bridge, Todmorden, Heptonstall, Bradford, West Yorkshire, UK"
        }
        
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
