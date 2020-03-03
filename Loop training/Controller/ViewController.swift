//
//  ViewController.swift
//  Loop training
//
//  Created by Ivan Nikitin on 28.02.2020.
//  Copyright © 2020 Ivan Nikitin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loopsLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var restTimeLabel: UILabel!
    @IBOutlet weak var restTimeStepper: UIStepper!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        stepper.value = 10
        restTimeStepper.value = 55
        startButton.layer.cornerRadius = startButton.frame.height/2
        startButton.clipsToBounds = true
    }

    @IBAction func stepperChangeValue(_ sender: UIStepper) {
        DispatchQueue.main.async {
            self.loopsLabel.text = "\(Int(sender.value))"
        }
    }
    @IBAction func restTimeChangeValue(_ sender: UIStepper) {
        DispatchQueue.main.async {
            self.restTimeLabel.text = "\(Int(sender.value))"
        }
    }
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goTraining", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goTraining" {
            let vc = segue.destination as! TrainingTableViewController
            vc.restTime = Int(restTimeStepper.value)
            vc.loops = Training(numbersOfLoop: Int(stepper.value))
        }
    }
}

