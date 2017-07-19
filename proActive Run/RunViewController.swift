//
//  RunViewController.swift
//  proActive Run
//
//  Created by Ryan Twohey on 7/16/17.
//  Copyright © 2017 Ryan Twohey. All rights reserved.
//

import UIKit

class RunViewController: UITableViewController {
    var runCollection: RunCollection!
    //images?
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return runCollection.allRuns.count
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        navigationItem.rightBarButtonItem = editButtonItem
    }
    
    override func tableView(_ tableView: UITableView,
                            moveRowAt sourceIndexPath: IndexPath,
                            to destinationIndexPath: IndexPath) {
        //Update the model
        runCollection.moveRun(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCellEditingStyle,
                            forRowAt indexPath: IndexPath) {
        //If the Table view is asking to commit a delete command...
        if editingStyle == .delete {
            let run = runCollection.allRuns[indexPath.row]
            
            let title = "Remove \(run.distance)?"
            let message = "Are you sure you want to delete this run?"
            
            let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            ac.addAction(cancelAction)
            
            let deleteAction = UIAlertAction(title: "Remove", style: .destructive, handler: { (action) -> Void in
                //Remove the run from teh Collection
                self.runCollection.removeRun(run)
                
                //Remove the run from the image Collection
                //self.imageCollection.deleteImage(forKey: run.runKey)
                
                //Also remove that row from the table view iwth an animation
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
            })
            ac.addAction(deleteAction)
            
            //Present the alert controller
            present(ac, animated: true, completion: nil)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Create an instance of UITableViewCell, with default appearance
        //let cell = UITableViewCell(style: .value1, reuseIdentifier: "UITableViewCell")
        
        //Get a new or recycled cell
        //let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RunCell", for: indexPath) as! RunCell
        
        //Set the text on the cell with the description of the run
        //that is at the nth index of runs, where n = row this cell
        //will appear in on the tableview
        let run = runCollection.allRuns[indexPath.row]
        
        //cell.textLabel?.text = run.name
        //cell.detailTextLabel?.text = "$\(run.valueInDollars)"
        
        //Configure the cell with the run
        cell.distanceLabel.text = "\(run.distance) miles"
        cell.timeLabel.text = "\(run.time) minutes"
        cell.dateLabel.text = dateFormatter.string(from: run.date)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String
    {
        return "Remove"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Past Runs"
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 65
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "editRun"?:
                if let row = tableView.indexPathForSelectedRow?.row {
                let run = runCollection.allRuns[row]
                let editRunViewController = segue.destination as! EditRunViewController
                editRunViewController.run = run
            }
        default:
            preconditionFailure("Unexpected segue identifier")
        }
    }

    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()

}
