//
//  BookmarksTableViewController.swift
//  LatinResearchKit
//
//  Created by Siddharth Ganapathy on 9/5/21.
//

import UIKit

class BookmarksTableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var level:String = ""
    var bookmarks = [String]()
    var filteredData:[String]!
    
    var search:Bool = false
    var FL_Items:String = ""
    var FL_allItems:String = ""
    
    var deleteFn:UITableViewCell.EditingStyle = .delete
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bookmarks.append("Test 1")
        bookmarks.append("Test 2")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    
        searchBar.delegate = self
        searchBar.searchTextField.font = UIFont.init(name: "Cinzel", size: 15.0)
        searchBar.placeholder = "Search Bookmarks"
        
        let adjustForTabbarInsets:UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        self.tableView.contentInset = adjustForTabbarInsets
        self.tableView.scrollIndicatorInsets = adjustForTabbarInsets
        self.extendedLayoutIncludesOpaqueBars = false
        
        navigationItem.rightBarButtonItem = editButtonItem
        editButtonItem.image = UIImage(systemName: "trash")
        
        filteredData = bookmarks
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
//    @IBAction func createFolder(_ sender: UIButton) {
//        if tableView.isEditing == false {
//            tableView.isEditing = true
//            deleteFn = .delete
//        } else {
//            tableView.isEditing = false
//            deleteFn = .none
//        }
//    }
//    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
//    @IBAction func shareBookmark(_ sender: UIBarButtonItem) {
//        let actionSheet = UIAlertController(title: "Share Your Progress!", message: "Click on any of the apps below to share!", preferredStyle: .actionSheet)
//        actionSheet.addAction(UIAlertAction(title: "iMessages", style: .default, handler: nil))
//        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
//
//        self.present(actionSheet, animated: true, completion: nil)
//    }
    
    func getDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        return dateFormatter.string(from: Date())
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of row
        if search == false {
            return bookmarks.count
        } else {
            return filteredData.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if search == false {
            cell.textLabel?.text = bookmarks[indexPath.row] + " (Saved on " + getDate() + ")"
            cell.textLabel?.textAlignment = .left
            
            cell.textLabel?.font = UIFont.init(name: "Cinzel", size: 22.5)
            cell.textLabel?.textColor = UIColor(red: 0.031, green: 0.379, blue: 0.704, alpha: 1.0)
        } else {
            cell.textLabel?.text = filteredData[indexPath.row] + " (Saved on " + getDate() + ")"
            cell.textLabel?.textAlignment = .left
            
            cell.textLabel?.font = UIFont.init(name: "Cinzel", size: 22.5)
            cell.textLabel?.textColor = UIColor(red: 0.031, green: 0.379, blue: 0.704, alpha: 1.0)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if deleteFn == .delete {
            bookmarks.remove(at: indexPath.row)
            filteredData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .bottom)
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = []
        search = true
        
        if searchText == "" {
            search = false
            filteredData = bookmarks
        } else {
            for item in bookmarks {
                if item.lowercased().contains(searchText.lowercased()) || item.uppercased().contains(searchText.uppercased()) || item.contains(searchText) {
                    filteredData.append(item)
                }
            }
        }
        self.tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.endEditing(true)
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
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
    
}
