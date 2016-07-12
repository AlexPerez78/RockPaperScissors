//
//  ResultsViewController.swift
//  RockPaperScissor
//
//  Created by Alex Perez on 6/29/16.
//  Copyright © 2016 Alex Perez. All rights reserved.
//

import UIKit

// The enum "Shape" represents a play or move
enum Shape: String {
    case Rock = "Rock"
    case Paper = "Paper"
    case Scissors = "Scissors"
    
    // Computers Randomizer function for his move
    static func randomShape() -> Shape {
        let shapes = ["Rock", "Paper", "Scissors"]    //Let shapes array contains the three possible answers, which represet 0,1,2
        let randomChoice = Int(arc4random_uniform(3)) //Random from 0 - 2
        print("CPU Shape: " + shapes[randomChoice])
        return Shape(rawValue: shapes[randomChoice])! //Return one of the three values
    }
}

class ResultsViewController: UIViewController {
    
    @IBOutlet private weak var resultImage: UIImageView!
    @IBOutlet private weak var resultLabel: UILabel!
    
    //Pass in the choices that were made by the user and the computer randomizer
    var userChoice: Shape!
    private let opponentChoice: Shape = Shape.randomShape()
    
    //When viewWillAppear shows, it will display the result
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        displayResult()
    }
    
    // The displayResult method generates the image and message for the results of a match.
    private func displayResult() {
        // Ideally, most of this would be handled by a model.
        var imageName: String
        var text: String
        let matchup = "\(userChoice.rawValue) vs. \(opponentChoice.rawValue)"
        
        //Pass in Users choice and CPU Choice
        switch (userChoice!, opponentChoice) {
        
        //If both user and CPU have the same answer set the match up to tie and return tie photo
        case let (user, opponent) where user == opponent:
            text = "\(matchup): it's a tie!"
            imageName = "Tie"
            
        //If Player whens in any of threee argument return win matchup with right photo
        case (.Rock, .Scissors), (.Paper, .Rock), (.Scissors, .Paper):
            text = "You win with \(matchup)!"
            imageName = "\(userChoice.rawValue)_\(opponentChoice.rawValue)"
            
        //Base case: if user loses and does not match any arguments, return lose matchup and right photo matchup
        default:
            text = "You lose with \(matchup) :(."
            imageName = "\(opponentChoice.rawValue)_\(userChoice.rawValue)"
        }
        
        //imageName = imageName.lowercaseString
        //Update Your Image and Text
        resultImage.image = UIImage(named: imageName)
        resultLabel.text = text
    }
    
    //Dismiss secondiew controller to show the ChoiceViewController to play again
    @IBAction private func playAgain() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
