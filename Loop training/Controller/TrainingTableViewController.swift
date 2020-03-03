//
//  TrainingTableViewController.swift
//  Loop training
//
//  Created by Ivan Nikitin on 28.02.2020.
//  Copyright © 2020 Ivan Nikitin. All rights reserved.
//

import UIKit

protocol TimerDelegate {
    func restEnd()
}

protocol EndLoopDelegate {
    func endLoop()
}

class TrainingTableViewController: UITableViewController {
    
    var loops: Training?
    
    var restTime: Int?
    var currentLoop = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "TrainingTableViewCell", bundle: nil), forCellReuseIdentifier: "currentCell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let loops = loops?.numbersOfLoop else { return 0 }
        return loops + 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let loops = loops else { return UITableViewCell() }
        
        let loop = "Круг: \(indexPath.row + 1)"
        
        if (indexPath.row + 1) == tableView.numberOfRows(inSection: 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "doneCell") ?? UITableViewCell()
            return cell
        } else if indexPath.row == currentLoop - 1 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "currentCell", for: indexPath) as! TrainingTableViewCell

            cell.delegate = self
            cell.nameLabel.text = loop
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleCell")
        cell?.textLabel?.text = loop
        
        if indexPath.row < currentLoop - 1 {
            cell?.accessoryType = .checkmark
        }
        return cell ?? UITableViewCell()
    }

}

extension TrainingTableViewController: EndLoopDelegate {
    
    func endLoop() {
        
        currentLoop += 1
        performSegue(withIdentifier: "timer", sender: self)
        tableView.reloadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "timer" {
            let vc = segue.destination as! TimerViewController
//            vc.delegate = self
            if let restTime = restTime {
            vc.time = restTime
            }
        }
    }
}

extension TrainingTableViewController: TimerDelegate {
    func restEnd() {
        print("TimerDelegate")
    }
}
