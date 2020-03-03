//
//  TrainingModel.swift
//  Loop training
//
//  Created by Ivan Nikitin on 28.02.2020.
//  Copyright © 2020 Ivan Nikitin. All rights reserved.
//

import Foundation

struct Training {
    var numbersOfLoop: Int
    var loops: [TrainingLoop] {
        var array = [TrainingLoop]()
        for index in 1...numbersOfLoop {
            array.append(TrainingLoop(loop: index, time: nil))
        }
        return array
    }
}

class TrainingLoop {
    var loop: Int
    var time: TimeInterval?
    var isDone = false
    
    func doneLoop() {
        isDone = true
    }
    
    init(loop: Int, time: TimeInterval?) {
        self.loop = loop
    }
}
