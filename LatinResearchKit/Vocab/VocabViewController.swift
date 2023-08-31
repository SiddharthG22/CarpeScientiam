//
//  VocabViewController.swift
//  LatinResearchKit
//
//  Created by Siddharth Ganapathy on 9/4/21.
//

import UIKit

class VocabViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var searching = false
    var searchingDone = false
    var filteredData:[Body]!
//    var words:[Body]? = [Body]()
    var words:[Body]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.font = UIFont(name: "Cinzel", size: 17.5)
        textView.textColor = .black
        
        let attributes = [NSAttributedString.Key.font: UIFont(name: "Cinzel", size: 14.5), NSAttributedString.Key.foregroundColor: UIColor(red: 0.031, green: 0.379, blue: 0.704, alpha: 1.0)]
        
        let titleLabel1 = UILabel()
        
        titleLabel1.text = "Whitaker's Words"
        titleLabel1.font = UIFont(name: "Cinzel", size: 25.0)
        titleLabel1.textColor = .black
        titleLabel1.sizeToFit()
        
        navigationItem.titleView = titleLabel1

        searchBar.delegate = self
        searchBar.searchTextField.font = UIFont.init(name: "Cinzel", size: 14.0)
        searchBar.placeholder = "Parse Words"
        
        segmentedControl.setTitleTextAttributes(attributes as [NSAttributedString.Key : Any], for: .normal)
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searching = true
        searchingDone = false
        
        if searchText == "" {
            searching = false
            textView.text = ""
        } else {
            if segmentedControl.selectedSegmentIndex == 0 {
                let link = "https://archives.nd.edu/cgi-bin/wordz.pl?keyword="+searchText+""
                loadData(url: link)
            } else if segmentedControl.selectedSegmentIndex == 1 {
                let link = "https://archives.nd.edu/cgi-bin/wordz.pl?english="+searchText+""
                loadData(url: link)
            }
        }
    }
    
    func loadData(url: String) {
        let myURL = URL(string: url)
        var myRequest = URLRequest(url: myURL!)
        myRequest.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: myRequest, completionHandler: { [self] (words, response, error) in
            if response != nil {
                let str = String(data: words!, encoding: .utf32)!
                print(str)
                let chapters = try? JSONDecoder().decode(HTML.self, from: words!)
                if let chapList = chapters?.body {
                    for item in chapList {
                        print(item.pre)
                        textView?.text = item.pre
                        if searchingDone == true {
                            textView?.text = item.pre + "Salve!"
                            textView.backgroundColor = .red
                            print(item.pre)
                        }
                    }
                }
            }
        })
        task.resume()
    }
    
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchingDone = false
        textView.text = ""
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchingDone = true
        self.searchBar.endEditing(true)
    }

    
}
