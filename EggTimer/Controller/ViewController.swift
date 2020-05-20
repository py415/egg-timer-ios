//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    // MARK: - Properties
    private var timer = Timer()
    private var totalTime = 0
    private var secondsPassed = 0
    
    private let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    
    // MARK: - IBAction Section
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        let hardness = sender.currentTitle! // Soft, Medium, Hard
        totalTime = eggTimes[hardness]!
        
        // Reset settings for timer
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    // MARK: - Private Function Section
    
    @objc private func updateTimer() {
        
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
        } else {
            timer.invalidate()
            print("Your eggs are now done!")
            titleLabel.text = "Done!"
        }
        
    }
    
}
