//
//  Teams.swift
//  HeadyTask
//
//  Created by Sanjay Mali on 21/02/17.
//  Copyright © 2017 Sanjay. All rights reserved.
//

import Foundation
import SwiftyJSON
class Teams  {
    var teamName:String?
    var id:String?
    required init(json:JSON){
        self.id  = json["_id"].string
        self.teamName = json["_name"].string
    }
}
