//
//  UITableViewCell +.swift
//  To-Do Manager
//
//  Created by Arman  Urstem on 29.08.2024.
//

import UIKit

extension UITableViewCell {
    static var reuseId: String {
        String(describing: self)
    }
}
