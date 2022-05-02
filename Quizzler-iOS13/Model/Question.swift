//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Rhiannon Stanford on 12/11/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

// Swift nil = JS null

struct Question {
    let prompt: String
    var answers: [String: String]
    var correctAnswer: String

   init(prompt: String, answers: [String: String], correctAnswer: String) {
       self.prompt = prompt
       self.answers = answers
       self.correctAnswer = correctAnswer
   } // you get this default init for free

    func isAnswerCorrect(_ userAnswer: String) -> Bool {

        return userAnswer == self.correctAnswer

    } // will return a Bool

}


