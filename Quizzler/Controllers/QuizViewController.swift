//
//  ViewController.swift
//  Quizzler
//
//  Created by Cyrus Dumbwani on 15/01/22.
//

import UIKit

class QuizViewController: UIViewController {
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerOption1: UIButton!
    @IBOutlet weak var answerOption2: UIButton!
    @IBOutlet weak var answerOption3: UIButton!
    @IBOutlet weak var questionNumLabel: UILabel!
    @IBOutlet weak var nextButtonLabel: UIButton!
    
    var answerChoosen : String?
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        answerOption1.backgroundColor = UIColor.clear
        answerOption2.backgroundColor = UIColor.clear
        answerOption3.backgroundColor = UIColor.clear
        
        sender.layer.cornerRadius = 22
        sender.layer.masksToBounds = true
        sender.backgroundColor = UIColor.tintColor
        
        answerChoosen = sender.currentTitle
        
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        quizBrain.prevQuestion()
        updateUI()
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        if answerChoosen != nil {
            quizBrain.validateAnswer(answerChoosen: answerChoosen!)
        }
        
        if !quizBrain.nextQuestion() {
            self.performSegue(withIdentifier: "goToResult", sender: self)
        }
        
        updateUI()
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.totalMarks = String(quizBrain.quiz.count)
            destinationVC.marksObtained = quizBrain.getScore()
        }
    }
    
    
    func updateUI() {
        
        if quizBrain.isFirstQuestion() {
            quizBrain.result = []
        }
        
        answerOption1.backgroundColor = UIColor.clear
        answerOption2.backgroundColor = UIColor.clear
        answerOption3.backgroundColor = UIColor.clear
        questionNumLabel.text = quizBrain.getQuestionNumberLabel()
        
        if quizBrain.isLastQuestion() {
            nextButtonLabel.setTitle("Submit", for: .normal)
        } else {
            nextButtonLabel.setTitle("Next", for: .normal)
        }
        
        questionLabel.text = quizBrain.getQuestionText()
        let options = quizBrain.getOptions()
        answerOption1.setTitle(options[0] , for: .normal)
        answerOption2.setTitle(options[1] , for: .normal)
        answerOption3.setTitle(options[2] , for: .normal)
        answerChoosen = nil
        
        
    }
    
}

