//
//  PlayerNameTableViewController.swift
//  HeadyTask
//
//  Created by Sanjay Mali on 21/02/17.
//  Copyright © 2017 Sanjay. All rights reserved.
//

import UIKit
class PlayerNameTableViewController: UITableViewController {
    var id:String?
    var players = [Players]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        self.navigationItem.title = "List of Player Names"
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return players.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if id == players[indexPath.row].team_id {
            cell.textLabel?.text = players[indexPath.row].playerName
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
