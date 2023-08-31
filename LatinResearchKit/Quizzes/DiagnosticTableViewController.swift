//
//  DiagnosticTableViewController.swift
//  LatinApp
//
//  Created by Siddharth Ganapathy on 4/18/21.
//

import UIKit

class DiagnosticTableViewController: UITableViewController {
    
    var level:String = ""
    var name:String!
    var userScore = Int()
    var userAdding:Bool = false
    
    let levels = ["First Time Learning", "Latin 1", "Latin 2", "Latin 3/4", "Advanced Latin"]
    
    var s2 = [String]()
    var diagnosticTests = [[String]]()
    var diagnosticTestsImage = [[String]]()
    
    var deleteFn:UITableViewCell.EditingStyle = .delete
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let titleLabel1 = UILabel()
        
        titleLabel1.text = "Quizzes"
        titleLabel1.font = UIFont(name: "Cinzel", size: 25.0)
        titleLabel1.textColor = .black
        titleLabel1.sizeToFit()
        navigationItem.titleView = titleLabel1

        s2.append("Built-in Quizzes")
        s2.append("Certamen Prep")
        
        diagnosticTests.append(["Grammar", "History", "Culture", "Mythology", "Derivatives", "Geography"])
        diagnosticTests.append(["Certamen Prep"])
        
        diagnosticTestsImage.append(["quote.bubble", "book", "building.columns", "bolt", "flowchart", "map"])
        diagnosticTestsImage.append(["flame"])
    }
    
    @IBAction func createFolder(_ sender: UIBarButtonItem) {
        if tableView.isEditing == false {
            tableView.isEditing = true
            deleteFn = .delete
        } else {
            tableView.isEditing = false
            deleteFn = .none
        }
    }
    
    
    @IBAction func addStuff(_ sender: UIBarButtonItem) {
        userAdding = true
        
        let attributes = [NSAttributedString.Key.font: UIFont(name: "Cinzel", size: 13.5)]
        
        let myAlert = UIAlertController(title: "Add Your Own Topics", message: nil, preferredStyle: .alert)
        myAlert.setTitle(font: UIFont(name: "Cinzel", size: 20.0), color: .black)
        myAlert.addTextField { textField in
            textField.attributedPlaceholder = NSAttributedString(string: "Category", attributes: attributes as [NSAttributedString.Key: Any])
            textField.font = UIFont(name: "Cinzel", size: 12.5)
        }
        myAlert.addTextField { textField in
            textField.attributedPlaceholder = NSAttributedString(string: "Topic", attributes: attributes as [NSAttributedString.Key: Any])
            textField.font = UIFont(name: "Cinzel", size: 12.5)
        }
        
        myAlert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        myAlert.addAction(UIAlertAction(title: "Add", style: .default, handler: { [self] action in
            guard let fields = myAlert.textFields, fields.count == 2 else {
                return
            }
            let field1 = fields[0]
            guard let newCat = field1.text else {
                return
            }
            let field2 = fields[1]
            guard let newTopic = field2.text else {
                return
            }
            
            if field1.text?.isEmpty == true || field2.text?.isEmpty == true {
                let theAlert = UIAlertController(title: "Invalid Titles", message: nil, preferredStyle: .alert)
                theAlert.setTitle(font: UIFont(name: "Cinzel", size: 20.0), color: .black)
                theAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(theAlert, animated: true, completion: nil)
            } else {
                s2.append(newCat)
                diagnosticTests.append([newTopic])
                diagnosticTestsImage.append(["person"])
                tableView.reloadData()
            }
        }))
        self.present(myAlert, animated: true, completion: nil)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return s2[section]
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return s2.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diagnosticTests[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        if indexPath.section == 0 {
            cell.theLabel.text = diagnosticTests[indexPath.section][indexPath.row] + " Quiz"
            cell.testImage.image = UIImage(systemName: diagnosticTestsImage[indexPath.section][indexPath.row])
            cell.testImage.tintColor = UIColor(red: 0.031, green: 0.379, blue: 0.704, alpha: 1.0)
            cell.testImage.adjustsImageSizeForAccessibilityContentSizeCategory = true
            cell.theLabel.font = UIFont.init(name: "Cinzel", size: 25.0)
            cell.theLabel.textColor = .red
        } else {
            cell.theLabel.text = diagnosticTests[indexPath.section][indexPath.row]
            cell.testImage.image = UIImage(systemName: diagnosticTestsImage[indexPath.section][indexPath.row])
            cell.testImage.tintColor = UIColor(red: 0.031, green: 0.379, blue: 0.704, alpha: 1.0)
            cell.testImage.adjustsImageSizeForAccessibilityContentSizeCategory = true
            cell.theLabel.font = UIFont.init(name: "Cinzel", size: 25.0)
            cell.theLabel.textColor = .red
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 0 {
            let vc = storyboard?.instantiateViewController(withIdentifier: "QuestionsViewController") as? QuestionsViewController
            vc?.diagnosticTests = diagnosticTests[indexPath.section][indexPath.row]
            vc?.level = level
            vc?.name = name
            vc?.userScore = userScore
            self.navigationController?.pushViewController(vc!, animated: true)
        } else if indexPath.section == 1 {
            let myAlert = UIAlertController(title: "NOTA BENE!", message: "Don't know how to play Certamen? Click 'RULES' below.", preferredStyle: .alert)
            
            myAlert.setTitle(font: UIFont(name: "Cinzel", size: 20.0), color: .black)
            myAlert.setMessage(font: UIFont(name: "Cinzel", size: 12.5), color: .black)
            myAlert.addAction(UIAlertAction(title: "RULES", style: .default, handler: {action in self.getRules()}))
            myAlert.addAction(UIAlertAction(title: "CONTINUE", style: .default, handler: { [self] action in
                let vc = storyboard?.instantiateViewController(withIdentifier: "QuestionsViewController") as? QuestionsViewController
                vc?.diagnosticTests = diagnosticTests[indexPath.section][indexPath.row]
                vc?.level = level
                vc?.name = name
                vc?.userScore = userScore
                self.navigationController?.pushViewController(vc!, animated: true)
            }))
            
            self.present(myAlert, animated: true, completion: nil)
        } else {
            let vc = RulesViewController()
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            deleteFn = .none
        } else {
            deleteFn = .delete
            s2.remove(at: indexPath.row)
            diagnosticTests[indexPath.section].remove(at: indexPath.row)
            diagnosticTestsImage[indexPath.section].remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .bottom)
            tableView.deleteSections(IndexSet(arrayLiteral: 3), with: .bottom)
            
            tableView.reloadData()
        }
    }
    
    func getRules() {
        let vc = RulesViewController()
        self.present(vc, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85.0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
}

//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let button = UIButton()
//        button.tag = section
//        button.setTitle("Quiz", for: .normal)
//        button.setTitleColor(.black, for: .normal)
//        button.addTarget(self, action: #selector(self.openSection), for: .touchUpInside)
//
//        return button
//    }

//    @objc func openSection(sender: Any) {
//        UIView.animate(withDuration: 0.1) {
//            self.tableView.isHidden = !self.tableView.isHidden
//        }
//    }

//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerLabel = UILabel()
//        headerLabel.text = "\(s2[section])"
//        headerLabel.frame = CGRect(x: 0, y: 0, width: 390, height: 44)
//        headerLabel.textAlignment = .center
//        headerLabel.font = UIFont.init(name: "Cinzel", size: 22.5)
//        headerLabel.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1.0)
//
//        return headerLabel
//    }

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
