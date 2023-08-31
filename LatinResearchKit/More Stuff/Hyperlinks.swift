//
//  Hyperlinks.swift
//  LatinApp
//
//  Created by Siddharth Ganapathy on 4/18/21.
//

import Foundation
import UIKit

extension NSAttributedString {
    static func makeHyperLink(for path: String, in string: String, as substring: String) -> NSAttributedString {
        let nsString = NSString(string: string)
        let substringRange = nsString.range(of: substring)
        let attributedString = NSMutableAttributedString(string: string)
        attributedString.addAttribute(.link, value: path, range: substringRange)

        return attributedString
    }
    
    static func adjustText(for path: UIColor?, in string: String, as substring: String) -> NSAttributedString {
        let nsString = NSString(string: string)
        let substringRange = nsString.range(of: substring)
        let attributedString = NSMutableAttributedString(string: string)
        attributedString.addAttribute(.foregroundColor, value: path!, range: substringRange)

        return attributedString
    }
}

