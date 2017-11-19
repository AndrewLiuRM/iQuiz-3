//
//  Question.swift
//  iQuiz
//
//  Created by Andrew Liu on 11/12/17.
//  Copyright © 2017 Andrew Liu. All rights reserved.
//

import Foundation

class Question {
    public var prompt:String
    public var answer:[String]
    public var correct:String
    init(prompt: String, correct: String, answer: String...) {
        self.prompt = prompt
        self.answer = answer
        if answer.count == 0 || !answer.contains(correct) {
            self.answer = ["No answer available"]
        }
        self.correct = correct
    }
    init(json: [String:Any]){
        let correct = (json["answers"] as! [String])[Int(json["answer"] as! String)!]
        self.prompt = json["text"] as! String
        self.answer = json["answers"] as! [String]
        self.correct = correct
    }
}
