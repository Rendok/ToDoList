//
//  Task.swift
//  The Night Porter
//
//  Created by Dmitry Grebenyuk on 7/9/20.
//  Copyright © 2020 Dmitry Grebenyuk. All rights reserved.
//

import Foundation

enum TaskType {
    case daily
    case weekly
    case monthly
}

struct Task {
    var task: String
    var type: TaskType
    var isCompleted: Bool = false
    var completedOn: NSDate? = nil
}
