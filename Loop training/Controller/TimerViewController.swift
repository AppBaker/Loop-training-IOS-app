//
//  TimerViewController.swift
//  Loop training
//
//  Created by Ivan Nikitin on 28.02.2020.
//  Copyright © 2020 Ivan Nikitin. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    
    var time = 55
    var height : CGFloat = 0
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var progressView: UIView!
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var stopButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeLabel.text = "\(time)"
        
        heightConstraint.constant = 0
        let deltaHeight = self.view.bounds.height / CGFloat(time)
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            DispatchQueue.main.async {
                self.time -= 1
                self.height += deltaHeight
                self.timeLabel.text = "\(self.time)"
                
                self.heightConstraint.constant = self.height
                
                if self.time == 0 {
                    timer.invalidate()
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func stopButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
