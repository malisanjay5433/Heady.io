//
//  TeamTableViewController.swift
//  HeadyTask
//
//  Created by Sanjay Mali on 21/02/17.
//  Copyright © 2017 Sanjay. All rights reserved.
//

import UIKit
import SwiftyJSON
import KRProgressHUD
class TeamTableViewController: UITableViewController {
    var player = [Players]()
    var teams = [Teams]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()

    }
    
    func readJSON(){
        KRProgressHUD.show()
        if let path : String = Bundle.main.path(forResource:"player_rankings", ofType: "json") {
            if let data = NSData(contentsOfFile: path) {
                let json = JSON(data: data as Data)
                let teams = json["Teams"].dictionary!
                let team  = teams["Team"]?.array!
                let players  = json["Players"].dictionary!
                let player  =  players["Player"]?.array!
                for i in team! {
                    let team = Teams(json:i)
                    self.teams.append(team)
                }
                for j in player! {
                    let name = Players(json:j)
                    self.player.append(name)
                    print("count:\(self.player.count)")
                }
                DispatchQueue.main.async {
                self.tableView.reloadData()
                }
            }
        }
        KRProgressHUD.dismiss()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
        self.teams.removeAll()
        self.player.removeAll()
        readJSON()
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return teams.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = teams[indexPath.row].teamName
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "teamPlayer",let p = segue.destination as? PlayerNameTableViewController,
            let indexpath = self.tableView.indexPathForSelectedRow {
            let selectedTeamId = teams[indexpath.row].id
            p.id = selectedTeamId
            p.players = player
        }
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
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
