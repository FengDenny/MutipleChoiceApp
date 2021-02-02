//
//  ViewController.swift
//  MutipleChoiceQuiz
//
//  Created by Denny Feng on 2/2/21.
//

import UIKit

class ViewController: UIViewController {
    
//MARK: Label's Declaration
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var firstChoice: UIButton!
    @IBOutlet weak var secondChoice: UIButton!
    @IBOutlet weak var thirdChoice: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
//  MARK: Method Initialization
    var questionBank = QuestionBank()
    
    
//  MARK: Three button Declaration
    @IBAction func answerPressed(_ sender: UIButton) {
    
//  MARK: Force unwrap
        // send back Choice 1, Choice 2, Choice 3
        let userAnswer = sender.currentTitle!
        let correctAnswer = questionBank.checkAnswer(userAnswer: userAnswer)
        
        if correctAnswer{
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
//  MARK: Change/Reset UI
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false);
        
//  MARK: next Question
        questionBank.nextQuestion()
        
    }
    
// MARK: Three Button Customization
    func customizeThreeButton(){

        firstChoice.layer.borderColor = UIColor.white.cgColor;
        firstChoice.layer.borderWidth = 2;
        firstChoice.layer.cornerRadius = 5
        
        secondChoice.layer.borderColor = UIColor.white.cgColor;
        secondChoice.layer.borderWidth = 2;
        secondChoice.layer.cornerRadius = 5
        
        thirdChoice.layer.borderColor = UIColor.white.cgColor;
        thirdChoice.layer.borderWidth = 2;
        thirdChoice.layer.cornerRadius = 5
        
    }
    
    
//  MARK: For #selector usage
    @objc func updateUI(){
  
//  MARK: Change questionText to questions accordingly
        questionText.text = questionBank.getQuestion()
        
//  MARK: Change scoreLabel to the score accordingly
        scoreLabel.text = "Score:  \(questionBank.getScore())"
        
//  fetch answers and update the button titles using setTitle method
        let answerBank = questionBank.getAnswer()
        
      
//   MARK: Grab QuestionBanks 1st/2nd/3rd Array Answer (a)
        firstChoice.setTitle(answerBank[0], for: .normal)
        secondChoice.setTitle(answerBank[1], for: .normal)
        thirdChoice.setTitle(answerBank[2], for: .normal)
        
//  MARK: Progress Bar Progression 
        progressBar.progress = questionBank.getProgress()
        
// MARK: Button Color Reset
        firstChoice.backgroundColor = UIColor.clear
        secondChoice.backgroundColor = UIColor.clear
        thirdChoice.backgroundColor = UIColor.clear

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        customizeThreeButton()
        updateUI()
    }


}

