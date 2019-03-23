//
//  JournalTableViewController.swift
//  OneStepJournal
//
//  Created by Bernard Huff on 9/6/18.
//  Copyright © 2018 Flyhightech.LLC. All rights reserved.
//

import UIKit
import RealmSwift

class JournalTableViewController: UITableViewController {

    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var cameraButton: UIButton!
    
    var entries : Results<Entry>?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cameraButton.imageView?.contentMode = .scaleAspectFit
        plusButton.imageView?.contentMode = .scaleAspectFit
        
        
    }
    
    func getEntries() {
        if let realm = try? Realm() {
             entries = realm.objects(Entry.self).sorted(byKeyPath: "date", ascending: false)
            tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getEntries()
    }
    
//    The following code if for when you press either the camera or the plus button.
    
    @IBAction func cameraTapped(_ sender: Any) {
        performSegue(withIdentifier: "goToNew", sender: "camera")
    }
    
    @IBAction func addTapped(_ sender: Any) {
        performSegue(withIdentifier: "goToNew", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToNew" {
            if let text = sender as? String {
                if text == "camera" {
                    let createVC = segue.destination as? CreateJournalViewController
                    createVC?.startWithCamera = true
                }
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let entries = self.entries {
            return entries.count
        } else {
            return 0 
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "journalCell", for: indexPath) as? JournalCell {
            
            if let entry = entries?[indexPath.row] {
                cell.previewTextCell.text = entry.text
            }
            
            return cell
            
        }
        return UITableViewCell()
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

class JournalCell: UITableViewCell {
    
    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var previewTextCell: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var imageViewWidth: NSLayoutConstraint!
    
    
}
