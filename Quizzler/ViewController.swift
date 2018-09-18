//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = QuestionBank()
//    This variable keeps track of the state of the question
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        constant that holds first question
//        let firstQuestion = allQuestions.list[0]
//        questionLabel.text = firstQuestion.questionText
        nextQuestion()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
        }
        else if sender.tag == 2 {
            pickedAnswer = false
        }
        checkAnswer()
        
        questionNumber += 1
        
        nextQuestion()
    }
    
    
    func updateUI() {
//    You can escape the string - "\(var)" or use String(var)
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNumber + 1) / 13" // questionNumber starts at 1
        
        progressBar.frame.size.width = (view.frame.size.width / 13 ) * CGFloat(questionNumber + 1)
    }

    func nextQuestion() {
        
        if questionNumber <= 12 {
            questionLabel.text = allQuestions.list[questionNumber].questionText
            updateUI()

        }
        else {
//            print("End of Quiz")
//            questionNumber = 0
            
//            UIAlertController alerts the user
            let alert = UIAlertController(title: "End of Quiz", message: "You've finished all the questions, do you want to start over?", preferredStyle: .alert)

//            UIAlertActionStyle what does UIAlertController look like
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler:
//            This is called a closure
//            When you see 'in' - you need to insert self
            { (restartAction) in
                self.startOver()
            })
            
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
            
        }
    }
    
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionNumber].answer
//      What happens when the use gets the question right
        if correctAnswer == pickedAnswer {
//            ProgressHUD - 3rd party library component that creates a popup of success and error
            ProgressHUD.showSuccess("Correct")
//            print("You got it!")
            score += 1
        }
        else {
            ProgressHUD.showError("Wrong!")

//            print("Wrong! ")
        }
        
    }
    
    
    func startOver() {
        score = 0
        questionNumber = 0
        nextQuestion()
    }
    

    
}
