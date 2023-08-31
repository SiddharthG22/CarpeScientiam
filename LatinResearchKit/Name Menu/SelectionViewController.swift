//
//  SelectionViewController.swift
//  LatinResearchKit
//
//  Created by Siddharth Ganapathy on 9/3/21.
//

import UIKit
import ResearchKit

class SelectionViewController: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var nameFormat = ORKAnswerFormat()
    var profileCreated = Bool()
    
    var userScore:Int = 100
    let pV = ["First Time Learning", "Latin 1", "Latin 2", "Latin 3", "Advanced Latin"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField?.delegate = self
        
        textField?.placeholder = "Enter your name"
        textField?.font = UIFont.init(name: "Cinzel", size: 15.0)
        textView?.text = "Quid est nomen tibi?"
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        profileCreated = true
        
        //        let value = UserDefaults.standard.string(forKey: "nameData")
        //        if value != nil {
        //            textField.text = value
        //        } else {
        //            textField.text = ""
        //        }
        //
        //        let value1 = UserDefaults.standard.integer(forKey: "lvlData")
        //        if value1 != nil {
        //            pickerView.selectRow(value1, inComponent: 0, animated: true)
        //        } else {
        //            pickerView.selectRow(0, inComponent: 0, animated: true)
        //        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func translateMsg(_ sender: UIButton) {
        if textView.text == "Quid est nomen tibi?" {
            sender.setTitle("Nesci quid hoc significat?", for: .normal)
            textView.text = "What is your name?"
        } else if textView.text == "What is your name?" {
            sender.setTitle("Don't know what this means?", for: .normal)
            textView.text = "Quid est nomen tibi?"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "qrSegue" {
            let vc = segue.destination as! ProfileViewController
            vc.name = textField.text!
        }
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pV.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pV[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        let titleData = pV[row]
        
        let attributes = [NSAttributedString.Key.font: UIFont(name: "Cinzel", size: 25.0), NSAttributedString.Key.foregroundColor: UIColor(red: 0.031, green: 0.379, blue: 0.704, alpha: 1.0)]
        let updatedFont = NSAttributedString(string: titleData, attributes: attributes as [NSAttributedString.Key: Any])
        
        pickerLabel.attributedText = updatedFont
        pickerLabel.textAlignment = .center
        
        return pickerLabel
    }
    
    //    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    //        UserDefaults.standard.setValue(row, forKey: "lvlData")
    //    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nText = textField.text!
        if nText.isEmpty || nText.count < 2 {
            let myAlert = UIAlertController(title: "Sorry! That is not a valid name!", message: nil, preferredStyle: .alert)
            
            myAlert.setTitle(font: UIFont(name: "Cinzel", size: 20.0), color: .black)
            myAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            textField.resignFirstResponder()
            
            self.present(myAlert, animated: true, completion: nil)
        } else {
            goBack()
            textField.resignFirstResponder()
        }
        textField.resignFirstResponder()
        return true
    }
    
    func goBack() {
        let row = pickerView.selectedRow(inComponent: 0)
        let level = pV[row]
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        vc!.level = level
        vc!.name = textField.text!
        vc!.profileCreated = profileCreated
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}
