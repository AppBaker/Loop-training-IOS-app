//
//  TimerViewController.swift
//  Loop training
//
//  Created by Ivan Nikitin on 28.02.2020.
//  Copyright © 2020 Ivan Nikitin. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    
    var time = 60
    var height : CGFloat = 0
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var progressView: UIView!
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var stopButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        heightConstraint.constant = height
        let deltaHeight = self.view.bounds.height / CGFloat(time)
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            DispatchQueue.main.async {
                self.height += deltaHeight
                self.timeLabel.text = "\(self.time)"
                
                
                
                UIView.animate(withDuration: 1) {
                    
                    self.heightConstraint.constant = self.height
                }
                if self.time == 0 {
                    timer.invalidate()
                }
                self.time -= 1
            }
        }
    }
    
    @IBAction func stopButtonPressed(_ sender: UIButton) {
        
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
