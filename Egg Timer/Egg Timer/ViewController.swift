//
//  ViewController.swift
//  Egg Timer
//
//  Created by Admin on 25.07.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    
    var totalTime = 0
    var secondPassed = 0
    
    var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func hardnessSelected(_ sender: UIButton) {
        guard let hardness = sender.titleLabel?.text else { return }
        
        timer.invalidate()
        
        totalTime = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        progressView.progress = 0.0
        secondPassed = 0
        

    
    }
    
    @objc func updateTimer() {
        if secondPassed < totalTime {
            
            secondPassed += 1
            let percentageProgress = Float(secondPassed) / Float(totalTime)
            titleLabel.text = "\(totalTime - secondPassed) seconds"
            progressView.progress = percentageProgress
        
        } else {
            timer.invalidate()
            titleLabel.text = "Done!"
        
        }
    }
    
}

