//
//  TopicsTableViewController.swift
//  LatinResearchKit
//
//  Created by Siddharth Ganapathy on 9/4/21.
//

import UIKit
import ResearchKit

class TopicsTableViewController: UITableViewController, UISearchBarDelegate {
    
    var name:String = ""
    var level:String = ""
    var topic:String = ""
    
    var diagnosticTests:String = ""
    var recResources:String = ""
    var segued = Bool()
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var wrong = [String]()
    var study_options = ["Vocabulary", "Grammar", "History", "Culture", "Mythology", "Geography"]
    
    //    var FL_Items = [
    //        ["Interactive Vocab Practice"],
    //        ["Alphabet", "Parts of Speech", "Accents", "Inflection", "Other Topics"],
    //        ["Rome's Origins", "The Days of the Republic", "The Rise of the Empire", "The Roman Emperors", "Decline, Disorder, and Disintegration"],
    //        ["Structure of Government", "Religious Life", "Rome's Social Hierarchy", "Revolutionary Ideas", "Creative Expression Explodes"],
    //        ["Important Roles", "Relationships between Gods", "Interactions with Humans", "Famous Myths", "Status in Rome"],
    //        ["MAPS..."]
    //    ]
    
    var FL_gr:[String:String] = ["Alphabet": "Alphabet", "Parts of Speech": "parts-speech", "Language": "inflected-language", "Nouns":"rules-noun-declension", "Verbs":"verb-conjugations", "Adjectives":"formation-adjectives"]
    var FL_h = ["Rome's Origins":"bruh"]
    var FL_ge = ["MAPS...":"rome"]
    var FL_m = ["Important Roles":"romana"]
    var FL_c = ["Structure of Government":"caesar"]
    
    var searching = false
    
    var FL_allItems = [String:String]()
    var filteredData: [String:String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        searchBar.delegate = self
        searchBar.searchTextField.font = UIFont.init(name: "Cinzel", size: 15.0)
        searchBar.placeholder = "Search Topics"
        
        if segued == true {
            diagnosticTests = topic
        }
        
        if topic == "History" {
            for (key, value) in FL_h {
                FL_allItems[key] = value
            }
        } else if topic == "Grammar" {
            for (key, value) in FL_gr {
                FL_allItems[key] = value
            }
        } else if topic == "Culture" {
            for (key, value) in FL_c {
                FL_allItems[key] = value
            }
        } else if topic == "Mythology" {
            for (key, value) in FL_m {
                FL_allItems[key] = value
            }
        } else if topic == "Geography" {
            for (key, value) in FL_ge {
                FL_allItems[key] = value
            }
        }
        
        filteredData = FL_allItems
    }
    
        override func viewWillAppear(_ animated: Bool) {
            self.tableView.reloadData()
        }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching == false {
            return FL_allItems.keys.count
        } else {
            return filteredData.keys.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if searching == false {
            cell.textLabel?.text = Array(FL_allItems.keys)[indexPath.row] as String
            cell.textLabel?.textAlignment = .left
            
            cell.textLabel?.font = UIFont.init(name: "Cinzel", size: 22.5)
            cell.textLabel?.textColor = UIColor(red: 0.031, green: 0.379, blue: 0.704, alpha: 1.0)
        } else {
            cell.textLabel?.text = Array(filteredData.keys)[indexPath.row] as String
            cell.textLabel?.textAlignment = .left
            
            cell.textLabel?.font = UIFont.init(name: "Cinzel", size: 22.5)
            cell.textLabel?.textColor = UIColor(red: 0.031, green: 0.379, blue: 0.704, alpha: 1.0)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController
        
        if searching == false {
            let cellKey = Array(FL_allItems.values)[indexPath.row] as String
            vc!.FL_Items = cellKey
            vc!.level = level
            vc!.name = name
            vc!.searching = searching
        } else {
            let cellKey = Array(filteredData.values)[indexPath.row] as String
            vc!.FL_bruh = cellKey
            vc!.level = level
            vc!.name = name
            vc!.searching = searching
        }
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = [:]
        searching = true
        
        if searchText == "" {
            searching = false
        } else {
            for (key, value) in FL_allItems {
                if key.lowercased().contains(searchText.lowercased()) || key.uppercased().contains(searchText.uppercased()) || key.contains(searchText) {
                    filteredData[key] = value
                }
            }
        }
        self.tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.endEditing(true)
    }
}

/*
 // Override to support conditional editing of the table view.
 override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
 
 // Return false if you do not want the specified item to be editable.
 return true
 }
 */


/*
 // Override to support editing the table view.
 override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
 if editingStyle == .delete {
 // Delete the row from the data source
 tableView.deleteRows(at: [indexPath], with: .fade)
 } else if editingStyle == .insert {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
 
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
 // Return false if you do not want the item to be re-orderable.
 return true
 }
 */

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */
