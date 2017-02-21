//
//  Players.swift
//  HeadyTask
//
//  Created by Sanjay Mali on 21/02/17.
//  Copyright © 2017 Sanjay. All rights reserved.
//

import Foundation
import SwiftyJSON
class Players  {
    var playerName:String?
    var team_id:String?
    required init(json:JSON){
        self.playerName = json["_player_known_name"].string
        self.team_id = json["_team_id"].string
    }
}
