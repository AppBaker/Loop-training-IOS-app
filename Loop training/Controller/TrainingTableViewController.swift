//
//  TrainingTableViewController.swift
//  Loop training
//
//  Created by Ivan Nikitin on 28.02.2020.
//  Copyright © 2020 Ivan Nikitin. All rights reserved.
//

import UIKit

class TrainingTableViewController: UITableViewController {
    
    var loopsNumber: Int?
    var correntLoop = 0

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
        guard let loops = loopsNumber else { return 0 }
        return loops + 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.row + 1) == tableView.numberOfRows(inSection: 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "doneCell") ?? UITableViewCell()
            return cell
        } else if indexPath.row == correntLoop {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "currentCell", for: indexPath) as! TrainingTableViewCell
            
            
            cell.nameLabel.text = "loop \(indexPath.row)"
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleCell")
        cell?.textLabel?.text = "Loop \(indexPath.row)"
        cell?.accessoryType = .checkmark
        return cell ?? UITableViewCell()
        

    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
