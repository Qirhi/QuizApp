//
//  Quiz.swift
//  Quizzler-iOS13
//
//  Created by Rhiannon Stanford on 12/14/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct Quiz {
    var questions: [Question]
    var totalNumberOfQuestions: Int
    var score: Int = 0

    init(questions: [Question]) {
        self.totalNumberOfQuestions = questions.count
        self.questions = questions.shuffled() // this shuffles the questions and returns them (NOT IN PLACE)
    }
    
    
    mutating func nextQuestion() -> Question? {
        return self.questions.popLast() // take the last one
    }

    mutating func addQuestion(newQuestion: Question) { // this func mutates the struct, because self. otherwise cannot be mutated

        self.questions.append(newQuestion)
        
   } // will return nothing
    
    func percentComplete() -> Double {
        // the current number of questions left / the total number of questions I started with
        let percent = 1 - (Double(self.questions.count)/Double(self.totalNumberOfQuestions))
        return percent
    } // will return a Double
    
    func getScore() -> Int {
        return self.score
    } // will return an Int
    
    mutating func updateScore() {
        self.score += 1
    } // just modify the score

}
