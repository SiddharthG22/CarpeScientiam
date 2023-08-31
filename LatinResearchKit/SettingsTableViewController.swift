//
//  SettingsTableViewController.swift
//  LatinResearchKit
//
//  Created by Siddharth Ganapathy on 9/3/21.
//

import UIKit

class SettingsTableViewController: UITableViewController, UISearchBarDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let levels = ["First Time Learning", "Latin 1", "Latin 2", "Latin 3/4", "Advanced Latin"]
    var profileUpdated:Bool = true
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return levels.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return levels[row]
    }

    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        let titleData = levels[row]
        
        let attributes = [NSAttributedString.Key.font: UIFont(name: "Cinzel", size: 15.0), NSAttributedString.Key.foregroundColor: UIColor(red: 0.031, green: 0.379, blue: 0.704, alpha: 1.0)]
        let updatedFont = NSAttributedString(string: titleData, attributes: attributes as [NSAttributedString.Key: Any])
        
        pickerLabel.attributedText = updatedFont
        pickerLabel.textAlignment = .center
        
        return pickerLabel
    }
    
//------------------------------------------------------------------------------
    
    let settings = ["Name", "Level", "Font Size", "About"]
    var filteredData: [String]!
    
    @IBOutlet weak var searchBar: UISearchBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        searchBar.searchTextField.font = UIFont.init(name: "Cinzel", size: 15.0)
        searchBar.placeholder = "Search Settings"
        
        let adjustForTabbarInsets:UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
        
        self.tableView.contentInset = adjustForTabbarInsets
        self.tableView.scrollIndicatorInsets = adjustForTabbarInsets
        self.extendedLayoutIncludesOpaqueBars = false
        
        filteredData = settings
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filteredData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = filteredData[indexPath.row]
        cell.textLabel?.textAlignment = .left

        cell.textLabel?.font = UIFont.init(name: "Cinzel", size: 22.5)
        cell.textLabel?.textColor = UIColor(red: 0.031, green: 0.379, blue: 0.704, alpha: 1.0)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            let attributes = [NSAttributedString.Key.font: UIFont(name: "Cinzel", size: 13.5)]
            
            let myAlert = UIAlertController(title: "Change Your Name", message: nil, preferredStyle: .alert)
            myAlert.setTitle(font: UIFont(name: "Cinzel", size: 20.0), color: .black)
            myAlert.addTextField { textField in
                textField.attributedPlaceholder = NSAttributedString(string: "Enter Your Name", attributes: attributes as [NSAttributedString.Key: Any])
                textField.font = UIFont(name: "Cinzel", size: 12.5)
            }
            
            myAlert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
            myAlert.addAction(UIAlertAction(title: "Save Change", style: .default, handler: { [self] action in
                guard let fields = myAlert.textFields, fields.count == 1 else {
                    return
                }
                let nameField = fields[0]
                guard let newName = nameField.text else {
                    return
                }
                let vc = storyboard?.instantiateViewController(identifier: "SelectionViewController") as? SelectionViewController
                self.navigationController?.pushViewController(vc!, animated: true)
            }))
            
            self.present(myAlert, animated: true, completion: nil)
        } else if indexPath.row == 1 {
            let myAlert = UIAlertController(title: "Change Your Level", message: nil, preferredStyle: .alert)
            myAlert.setTitle(font: UIFont(name: "Cinzel", size: 22.5), color: .black)
            
            let pickerView = UIPickerView(frame: CGRect(x: 0, y: 50, width: 300, height: 100))
            myAlert.view.addSubview(pickerView)

            pickerView.delegate = self
            pickerView.dataSource = self
            
//            pickerView.centerXAnchor.constraint(equalTo: myAlert.view.centerXAnchor).isActive = true
//            pickerView.centerYAnchor.constraint(equalTo: myAlert.view.centerYAnchor).isActive = true
            
            let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
            let save = UIAlertAction(title: "Save Change", style: .default, handler: { [self] action in
                let newRow = pickerView.selectedRow(inComponent: 0)
                let newLevel = self.levels[newRow]
                
                let vc = storyboard?.instantiateViewController(identifier: "SelectionViewController") as? SelectionViewController
                self.navigationController?.pushViewController(vc!, animated: true)
            })
            
            myAlert.addAction(cancel)
            myAlert.addAction(save)
    
            self.present(myAlert, animated: true, completion: nil)
        } else if indexPath.row == 2 {
            let myAlert = UIAlertController(title: "Change Font Size", message: nil, preferredStyle: .alert)
            myAlert.setTitle(font: UIFont(name: "Cinzel", size: 22.5), color: .black)
            
            let fSelector = UIScrollView(frame: CGRect(x: 0, y: 50, width: 250, height: 20))
            myAlert.view.addSubview(fSelector)
            
            let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
            myAlert.addAction(cancel)
            
            self.present(myAlert, animated: true, completion: nil)
        } else if indexPath.row == 3 {
            print("heyyyyyy")
        }
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = []

        if searchText == "" {
            filteredData = settings
        } else {
            for item in settings {
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

}
