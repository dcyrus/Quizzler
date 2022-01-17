//
//  QuizBrain.swift
//  Quizzler
//
//  Created by Cyrus Dumbwani on 16/01/22.
//

import Foundation

struct QuizBrain {
    
    let quiz = [
        Question(
            text: "Think of your favorite animal, place, and color now say one of them! What Did you say?",
            options: ["Animal", "Place", "Color"],
            answer: 1),
        Question(
            text: "If you sit here, and live here then where do you stand?",
            options: ["Here", "Nowhere", "I'm not standing"],
            answer: 2),
        Question(
            text: "3 people go onto a bus, 3 more people come off, 6 people com on. 3 more people come on. How people are in the bus if 3 come on?",
            options: ["Corret", "Wrong", "Correctly"],
            answer: 2)
    ]
    
    var questionNumber = 0
    var result : [Int] = []
    
    mutating func validateAnswer(answerChoosen: String) {
        let options = quiz[questionNumber].options
        let answer = quiz[questionNumber].answer
        
        if options[answer] == answerChoosen {
            result.append(1)
        } else {
            result.append(0)
        }
    }
    
    func getScore() -> String {
        var score = 0
        for point in result {
            score += point
        }
        return String(score)
    }
    
    
    mutating func nextQuestion() -> Bool {
        if questionNumber < quiz.count-1 {
            questionNumber += 1
            return true
        } else {
            questionNumber = 0
            return false
        }
    }
    
    mutating func prevQuestion() {
        if questionNumber > 0 {
            questionNumber -= 1
            result.removeLast()
        }
    }
    
    func getQuestionNumberLabel() -> String {
        return "Question \(questionNumber + 1)/\(quiz.count)"
    }
    
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    func getOptions() -> [String] {
        return quiz[questionNumber].options
    }
    
    func isLastQuestion() -> Bool {
        return questionNumber == quiz.count - 1
    }
    
    func isFirstQuestion() -> Bool {
        return questionNumber == 0
    }
    
}
