//
//  DiagnosticTableViewController.swift
//  LatinApp
//
//  Created by Siddharth Ganapathy on 4/18/21.
//

import UIKit

class DiagnosticTableViewController: UITableViewController {
    
    var user:String = ""
    var rotation:String = ""
    var name:String = ""
    
    let levels = ["Intro. to Latin", "Latin 1", "Latin 2", "Latin 3/4", "Advanced Latin"]
    let diagnosticTests = ["Grammar", "History", "Culture", "Mythology", "Geography"]
    let diagnosticTestsImage = ["grammar", "history", "dailylife", "mythology", "geography"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return diagnosticTests.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        cell.theLabel.text = diagnosticTests[indexPath.row] + " Test"
        cell.testImage.image = UIImage(named: diagnosticTestsImage[indexPath.row])
        cell.testImage.adjustsImageSizeForAccessibilityContentSizeCategory = true
        
        cell.theLabel.font = UIFont.init(name: "Cinzel", size: 25.0)
        cell.theLabel.textColor = UIColor(red: 0.031, green: 0.379, blue: 0.704, alpha: 1.0)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! QuestionsViewController
        let index = self.tableView.indexPathForSelectedRow?.row
        vc.diagnosticTests = diagnosticTests[index!]
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

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
}
