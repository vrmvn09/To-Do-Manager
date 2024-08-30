//
//  Task.swift
//  To-Do Manager
//
//  Created by Arman  Urstem on 27.08.2024.
//

import Foundation

// priority types of task
enum TaskPriority: Int, CaseIterable, Codable {
    case important
    case normal
}

// completion status of task
enum TaskStatus: Int, CaseIterable, Codable {
    case planned
    case completed
}

struct Task: Codable {
    var id = UUID().uuidString
    var title: String
    var priority: TaskPriority
    var status: TaskStatus
}
