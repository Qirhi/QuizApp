//
//  Questions.swift
//  Quizzler-iOS13
//
//  Created by Rhiannon Stanford on 4/25/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Questions {
    // an array of question objects with two properties, prompt and answers
    // static is used in front of let, a property of the universal struct template rather than the property of an instance
    static let mochiData = [
        Question(prompt: "What word describes Mochi?", answers: ["a": "cute", "b": "happy", "c": "sad"], correctAnswer: "cute"),
        Question(prompt: "What food does Mochi like?", answers: ["a": "chicken", "b": "pig", "c": "cheese"], correctAnswer: "cheese"),
        Question(prompt: "What is Mochi's favorite color?", answers: ["a": "purple", "b": "pink", "c": "yellow"], correctAnswer: "pink"),
        Question(prompt: "What does Mochi smell like?", answers: ["a": "roses", "b": "plumeria", "c": "mud"], correctAnswer: "plumeria"),
        Question(prompt: "What does Mochi like to sniff?", answers: ["a": "butts", "b": "feet", "c": "flowers"], correctAnswer: "flowers"),
    ]
}
