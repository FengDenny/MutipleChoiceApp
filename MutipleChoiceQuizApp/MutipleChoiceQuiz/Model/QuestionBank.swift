//
//  QuestionBank.swift
//  MutipleChoiceQuiz
//
//  Created by Denny Feng on 2/2/21.
//

import Foundation


struct QuestionBank {
    var questionNumber = 0;
    var score = 0;
//MARK: App Brewery Question Bank
    let questions = [
    
                Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
                Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
                Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
                Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
                Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
                Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
                Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
                Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
                Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
                Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
    ]
    
   mutating func checkAnswer(userAnswer: String) -> Bool {
        
        if userAnswer == questions[questionNumber].rightAnswer {
            score += 1
            return true
        }else {
            return false
        }
    }

    
    
    
//    MARK:UpdateUI Method
    func getAnswer() -> [String] {
        return questions[questionNumber].answers
    }
    
//    MARK: Progress Bar Method
    func getProgress() -> Float{
        return Float(questionNumber) / Float(questions.count)
    }
    
// MARK: Question Text Label
    func getQuestion() -> String{
        return questions[questionNumber].question
    }
    
    
//  MARK: Score Label Method
    
    func getScore() -> Int{
        return score
    }
    
//    MARK: Update Next Queston
    
   mutating func nextQuestion() {
        
        if questionNumber + 1 < questions.count{
            
            questionNumber += 1;
        } else{
           
            questionNumber = 0
            score = 0;
        }
        
    }
    
    
    
    
    
    
    
    
    
}
