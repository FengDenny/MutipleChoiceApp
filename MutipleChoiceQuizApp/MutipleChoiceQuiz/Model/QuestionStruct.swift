//
//  QuestionStruct.swift
//  MutipleChoiceQuiz
//
//  Created by Denny Feng on 2/2/21.
//

import Foundation


struct Question{
    let question: String;
    
    // use array for multiplie choice
    let answers: [String];
    
    let rightAnswer :String
    
    init(q:String, a:[String], correctAnswer: String)
    {
        question = q;
        answers = a;
        rightAnswer = correctAnswer
    }
}
