//
//  ViewController.swift
//  RockPaperScissor
//
//  Created by Alex Perez on 6/28/16.
//  Copyright © 2016 Alex Perez. All rights reserved.
//

import UIKit

class ChoiceViewController: UIViewController {
    
    @IBAction private func playRock(sender: UIButton) {
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("ResultsViewController") as! ResultsViewController
        vc.userChoice = getUserShape(sender) //Send the Name of the button choice to Results view
        presentViewController(vc, animated: true, completion: nil) //Present the Results view controller
    }
    
    @IBAction private func playPaper(sender: UIButton) {
        performSegueWithIdentifier("result", sender: sender)
    }
    
    //Used for Scissor Move, using the segue to perform its action
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "result" {
            let vc = segue.destinationViewController as! ResultsViewController
            vc.userChoice = getUserShape(sender as! UIButton) //Send the Name of the button choice to Results view
        }
    }
    
    // The enum "Shape" represents a play or move
    private func getUserShape(sender: UIButton) -> Shape {
        
        //Grabs the title of the button to set to shape
        let shape = sender.titleForState(.Normal)!
        print("User Shape: " + shape)
        return Shape(rawValue: shape)! //Return the value String shape to Object of Shape
    }


}

