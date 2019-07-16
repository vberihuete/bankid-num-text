//
//  ViewController.swift
//  BankId Num-Text
//
//  Created by Vincent Berihuete on 2019-07-16.
//  Copyright © 2019 Vincent Berihuete. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var numberTextField: NSTextField!
    @IBOutlet weak var languagePicker: NSPopUpButton!
    @IBOutlet weak var result: NSTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        result.isHidden = true
        result.isSelectable = true
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func magicAction(_ sender: Any) {
        guard !numberTextField.stringValue.isEmpty else { return }
        
        result.isHidden = false
        
        guard numberTextField.stringValue.count == 12 else {
            result.stringValue = "Must be a 12 digit number"
            return
        }
  
        let number: [Int] = numberTextField.stringValue.compactMap { (a) -> Int in
            return Int(String(a)) ?? 0
        }
        
        let first: [Int] = Array(number[0...7])
        let second: [Int] = Array(number [8...11])
        
        let 😜 = letters(from: first)
        let 🤪 = letters(from: second)
        result.stringValue = "\(😜) - \(🤪)"
       
    }
    
    
    /// Transforms a given array of int in its string representation per number
    ///
    /// - Parameter array: the elements to be turn into string
    private func letters(from array: [Int]) -> String{
        var language = "en"
        
        switch languagePicker.title {
        case "Spanish":
            language = "es"
        case "Russian":
            language = "ru_RU"
        case "Swedish":
            language = "sv_SE"
        default: ()
        }
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .spellOut
        formatter.locale =  Locale.init(identifier: language)
        
        return array.reduce("") { (word, num) -> String in
            return "\(word)\(formatter.string(from: NSNumber(value: num))?.capitalized ?? "")"
        }
    }
    
}

