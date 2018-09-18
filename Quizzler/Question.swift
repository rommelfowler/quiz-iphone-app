//
//  Question.swift
//  Quizzler
//
//  Created by rommel fowler on 8/23/18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

//NOTE: When creating a 'class' variable starts with a cap
//Classes are caps, and objects are lowercase
class Question {
    let questionText : String
    let answer : Bool
    
//    initialize constant variables
    init(text: String, correctAnswer: Bool){
        questionText = text
        answer = correctAnswer
    }
}

