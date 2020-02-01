//
//  ViewController.swift
//  Word Garden
//
//  Created by Kyle Gangi on 2/1/20.
//  Copyright © 2020 Kyle Gangi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var wordToGuess = "CODE"
    var lettersGuessed = ""
    let maxNumeberofWrongGuesses = 8
    var wrongGuessesRemaining = 8
    var guessCount = 0
    
    
    
    
    @IBOutlet weak var userGuessLabel: UILabel!
    
    @IBOutlet weak var guessedLetterField: UITextField!
    
    @IBOutlet weak var guessLetterButton: UIButton!
    
    @IBOutlet weak var guessCountLabel: UILabel!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBOutlet weak var flowerImageView: UIImageView!
    
    override func viewDidLoad() {
        formatUserGuessLabel()
        guessLetterButton.isEnabled = false
        playAgainButton.isHidden = true
        super.viewDidLoad()
        
    }
    
    func updateUIAfterGuess(){
        guessedLetterField.resignFirstResponder()
        guessedLetterField.text = ""
    
    }
    
    func formatUserGuessLabel(){
        var revealedWord = ""
               
               lettersGuessed += guessedLetterField.text!

               for letter in wordToGuess{
                   if lettersGuessed.contains(letter){
                       revealedWord = revealedWord + " \(letter)"
                   }
                   else{
                       revealedWord = revealedWord + " _"
                   }
               }
               revealedWord.removeFirst()
               userGuessLabel.text = revealedWord
        
    }
    
    
    func guessLetter(){
       formatUserGuessLabel()
        guessCount += 1
        let currentLetterGuessed = guessedLetterField.text!
        if !wordToGuess.contains(currentLetterGuessed){
            wrongGuessesRemaining = wrongGuessesRemaining - 1
            flowerImageView.image = UIImage(named: "flower\(wrongGuessesRemaining)")
        }
        
        let revealedword = userGuessLabel.text!
        
        if wrongGuessesRemaining == 0{
            playAgainButton.isHidden = false
            guessedLetterField.isEnabled = false
            guessLetterButton.isEnabled = false
            guessCountLabel.text = "So Sorry, You're all out of Guesses. Try Again?"
            
        }else if !revealedword.contains("_"){
            playAgainButton.isHidden = false
            guessedLetterField.isEnabled = false
            guessLetterButton.isEnabled = false
            guessCountLabel.text = "You Got It! It took you \(guessCount) guesses to guess the word"
            
        }
        else{
            var guess = "guesses"
            if guessCount == 1{
                guess = "guess"
            }
            guessCountLabel.text = "You've Made \(guessCount) \(guess)"
                
            
        }
    
        
    }
    
    
    @IBAction func guessedLetterFieldChanged(_ sender: UITextField) {
        if let letterGuessed = guessedLetterField.text?.last{
            guessedLetterField.text = "\(letterGuessed)"
            guessLetterButton.isEnabled = true
        } else {
            guessLetterButton.isEnabled = false
            
        }
        
        
    }
    

    @IBAction func doneKeyPressed(_ sender: UITextField) {
        guessLetter()
        updateUIAfterGuess()
        
    }
    
    @IBAction func guessLetterButtonPressed(_ sender: UIButton) {
        guessLetter()
        updateUIAfterGuess()
        
        
        
    }
    
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
        playAgainButton.isHidden = true
        guessedLetterField.isEnabled = true
        guessLetterButton.isEnabled = false
        flowerImageView.image = UIImage(named: "flower8")
        wrongGuessesRemaining = maxNumeberofWrongGuesses
        lettersGuessed = ""
        formatUserGuessLabel()
        guessCountLabel.text = "You've Made 0 Guesses"
        guessCount = 0
        
    }
    
    
    
}

