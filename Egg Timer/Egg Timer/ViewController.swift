//
//  ViewController.swift
//  Egg Timer
//
//  Created by Admin on 25.07.2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var progressSecLabel: UILabel!
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    var totalTime = 0
    var secondPassed = 0
    var timer = Timer()
    var player: AVAudioPlayer!
    

    @IBAction func hardnessSelected(_ sender: UIButton) {
        guard let hardness = sender.titleLabel?.text else { return }
        
        timer.invalidate()
        titleLabel.text = hardness
        totalTime = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        progressView.progress = 0.0
        secondPassed = 0
    }
    
    @objc func updateTimer() {
        if secondPassed < totalTime {
            secondPassed += 1
            let percentageProgress = Float(secondPassed) / Float(totalTime)
            progressSecLabel.text = "\(totalTime - secondPassed) seconds"
            progressView.progress = percentageProgress
        
        }
        else {
            timer.invalidate()
            titleLabel.text = "Done!"
            progressSecLabel.text = ""
            playSound()
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                player = try! AVAudioPlayer(contentsOf: url!)
                player.play()
    }
    
}

