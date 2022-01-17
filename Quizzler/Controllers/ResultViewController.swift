//
//  ResultViewController.swift
//  Quizzler
//
//  Created by Cyrus Dumbwani on 16/01/22.
//

import UIKit

class ResultViewController: UIViewController {
    
    var marksObtained : String?
    var totalMarks : String?
    

    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var lineDiagonal: UIImageView!
    @IBOutlet weak var marksObtainedLabel: UILabel!
    @IBOutlet weak var totalMarksLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        marksObtainedLabel.text = marksObtained
        totalMarksLabel.text = totalMarks
        let percent = Double(Int(marksObtained!)!) / Double(Int(totalMarks!)!)
        if percent < 0.5 {
            emojiLabel.text = "✍️"
            textLabel.text = "Practice more!"
        } else if percent < 0.75 {
            emojiLabel.text = "👍"
            textLabel.text = "Good."
        } else if percent < 1 {
            emojiLabel.text = "🔥"
            textLabel.text = "Great."
        } else {
            emojiLabel.text = "💯"
            textLabel.text = "Perfect!"
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tryAgainButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
