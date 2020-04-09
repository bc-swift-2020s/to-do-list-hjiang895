//
//  ToDoItem.swift
//  To Do List
//
//  Created by Hannah Jiang on 4/3/20.
//  Copyright © 2020 Hannah Jiang. All rights reserved.
//

import Foundation

//program wide scope

struct ToDoItem: Codable {
    var name: String
    var date: Date
    var notes: String
    var reminderSet: Bool
    var completed: Bool
    var notificationID: String? 
}
