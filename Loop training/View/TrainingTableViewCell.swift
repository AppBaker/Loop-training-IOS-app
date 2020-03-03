//
//  TrainingTableViewCell.swift
//  Loop training
//
//  Created by Ivan Nikitin on 28.02.2020.
//  Copyright © 2020 Ivan Nikitin. All rights reserved.
//

import UIKit

class TrainingTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    
    var delegate: EndLoopDelegate?
    var time = 0
    var timer = Timer()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            self.timeLabel.text = "\(self.time)"
            self.time += 1
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        print("Done button pressed")
        timer.invalidate()
        time = 0
        delegate?.endLoop()
        
    }
    
}
