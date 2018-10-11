// Created on: Oct 2018
// Created by: Amin Zeina
// Created for: ICS3U
// This program lets user guess the random number 

// this will be commented out when code moved to Xcode
import PlaygroundSupport


import UIKit

class ViewController : UIViewController {
    // this is the main view controller, that will show the UIKit elements
    
    // properties
    let NUMBER : Int = Int(arc4random_uniform(10) + 1)
    
    let instructionLabel = UILabel()
    let numberGuessedTextField = UITextField()
    let checkButton = UIButton()
    let answerLabel = UILabel()
    
    override func viewDidLoad() {
        // UI
        super.viewDidLoad()
        
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.view = view
        
        instructionLabel.text = "Guess a number between 1 and 10"
        view.addSubview(instructionLabel)
        instructionLabel.translatesAutoresizingMaskIntoConstraints = false
        instructionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        instructionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        numberGuessedTextField.borderStyle = UITextBorderStyle.roundedRect
        numberGuessedTextField.placeholder = "Enter a number"
        view.addSubview(numberGuessedTextField)
        numberGuessedTextField.translatesAutoresizingMaskIntoConstraints = false
        numberGuessedTextField.topAnchor.constraint(equalTo: instructionLabel.bottomAnchor, constant: 20).isActive = true
        numberGuessedTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        checkButton.setTitle("Check", for: .normal)
        checkButton.setTitleColor(.blue, for: .normal)
        checkButton.titleLabel?.textAlignment = .center
        checkButton.addTarget(self, action: #selector(checkNumberGuessed), for: .touchUpInside)
        view.addSubview(checkButton)
        checkButton.translatesAutoresizingMaskIntoConstraints = false
        checkButton.topAnchor.constraint(equalTo: numberGuessedTextField.bottomAnchor, constant: 20).isActive = true
        checkButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        answerLabel.text = nil
        view.addSubview(answerLabel)
        answerLabel.translatesAutoresizingMaskIntoConstraints = false
        answerLabel.topAnchor.constraint(equalTo: checkButton.bottomAnchor, constant: 20).isActive = true
        answerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
    }
    
    @objc func checkNumberGuessed() {
        
        let numberEntered : Int = Int(numberGuessedTextField.text!)!
        if numberEntered >= 1 &&   numberEntered <= 10 {
            
            if numberEntered == NUMBER {
                answerLabel.text = "Correct!"
            } else {
                answerLabel.text = "Incorrect. The number was \(String(NUMBER))"
            }
        } else {
            answerLabel.text = "Please enter a number between 1 and 10"
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

// this will be commented out when code moved to Xcode
PlaygroundPage.current.liveView = ViewController()
