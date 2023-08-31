//
//  AlertModifications.swift
//  LatinApp
//
//  Created by Siddharth Ganapathy on 5/26/21.
//

import Foundation
import UIKit

extension UIAlertController {
    
    func setTitle(font: UIFont?, color: UIColor?) {
        guard let title = self.title else { return }
        let attributeString = NSMutableAttributedString(string: title)
        if let titleFont = font {
            attributeString.addAttributes([NSAttributedString.Key.font: titleFont], range: NSMakeRange(0, title.utf8.count))
        }
        
        self.setValue(attributeString, forKey: "attributedTitle")
    }
    
    func setMessage(font: UIFont?, color: UIColor?) {
        guard let message = self.message else { return }
        let attributeString = NSMutableAttributedString(string: message)
        if let messageFont = font {
            attributeString.addAttributes([NSAttributedString.Key.font: messageFont], range: NSMakeRange(0, message.utf8.count))
        }
        
        setValue(attributeString, forKey: "attributedMessage")
    }
    
}

extension UIViewController {
    
    func loader() -> UIAlertController {
        let alert = UIAlertController(title: nil, message: "Loading Results...", preferredStyle: .alert)
            alert.setMessage(font: UIFont(name: "Cinzel", size: 15.0), color: .black)
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
            loadingIndicator.hidesWhenStopped = true
            loadingIndicator.style = UIActivityIndicatorView.Style.large
            loadingIndicator.startAnimating()
            alert.view.addSubview(loadingIndicator)
            present(alert, animated: true, completion: nil)
        
            return alert
    }
        
    func stopLoader(loader: UIAlertController) {
            DispatchQueue.main.async {
                loader.dismiss(animated: true, completion: nil)
        }
    }

}

