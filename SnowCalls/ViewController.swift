//
//  ViewController.swift
//  SnowCalls
//
//  Created by Russell Gordon on 2019-11-26.
//  Copyright © 2019 Russell Gordon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    // MARK: Properties and Outlets
    @IBOutlet weak var inputPhoneNumbers: UITextView!
    @IBOutlet weak var outputPhoneNumbers: UITextView!
    
    
    // MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Give the focus to the input textview when the program begins
        inputPhoneNumbers.becomeFirstResponder()
        
        // Make this class (the view controller) be the delegate for the input text view
        inputPhoneNumbers.delegate = self

    }
    
    // MARK: Actions
    @IBAction func convertPhoneNumbers(_ sender: Any) {
        
        // Clear the output phone numbers list
        outputPhoneNumbers.text = ""
        
        // 1. INPUT
        guard let input = inputPhoneNumbers.text, inputPhoneNumbers.text.count > 0 else {
            outputPhoneNumbers.text = "Please enter phone numbers to convert."
            return
        }
        
        // 2. PROCESS & OUTPUT
        
        // Split given list of numbers into individual lines
        let phoneNumbers = input.split(separator: "\n")
        
        // Iterate over each number in the new collection
        for phoneNumber in phoneNumbers {
            print(phoneNumber)

            // Create the translated phone number
            var translatedPhoneNumber = ""
            
            // Iterate over each character in the collection and build the new phone number
            for character in phoneNumber {
                
                // Translate the character
                switch character {
                case "A", "B", "C":
                    translatedPhoneNumber += "2"
                case "D", "E", "F":
                    translatedPhoneNumber += "3"
                case "G", "H", "I":
                    translatedPhoneNumber += "4"
                case "J", "K", "L":
                    translatedPhoneNumber += "5"
                case "M", "N", "O":
                    translatedPhoneNumber += "6"
                case "P", "Q", "R", "S":
                    translatedPhoneNumber += "7"
                case "T", "U", "V":
                    translatedPhoneNumber += "8"
                case "W", "X", "Y", "Z":
                    translatedPhoneNumber += "9"
                case "-":
                    translatedPhoneNumber += ""
                default:
                    translatedPhoneNumber += String(character)
                }
                
                // Add a dash after 3 and 7 characters
                if translatedPhoneNumber.count == 3 || translatedPhoneNumber.count == 7 {
                    translatedPhoneNumber += "-"
                }
                
                // Stop translating after 12 characters
                if translatedPhoneNumber.count == 12 {
                    
                    // Stop the loop
                    break
                    
                }
                
            }
            
            // Only output phone numbers that are the correct number of digits
            if translatedPhoneNumber.count == 12 {
                // Assign the new phone number to the output text view
                outputPhoneNumbers.text += translatedPhoneNumber + "\n"
            }
            
        }
        
    }
    
    // MARK: UITextView Delegate Methods
    
    // Called when the contents of the text view are changed.
    func textViewDidChange(_ textView: UITextView) {
        // Reset the output text view
        outputPhoneNumbers.text = ""
    }
    

}

