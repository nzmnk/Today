//
//  ReminderDetailViewController.swift
//  Today
//
//  Created by Никита Зименко on 19.07.2021.
//

import UIKit

class ReminderDetailViewController: UITableViewController {
    enum ReminderRow: Int, CaseIterable {
        case title
        case date
        case time
        case notes
        
        func displayText(for reminder: Reminder?) -> String? { // Method to return the display text for a reminder.
            switch self {
            case .title:
                return reminder?.title
            case .date:
                return reminder?.dueDate.description
            case .time:
                return reminder?.dueDate.description
            case .notes:
                return reminder?.notes
            }
        }
        
        var cellImage: UIImage? { // Return an image for the row.
            switch self {
            case .title:
                return nil
            case .date:
                return UIImage(systemName: "calendar.circle")
            case .time:
                return UIImage(systemName: "clock")
            case .notes:
                return UIImage(systemName: "square.and.pencil")
            }
        }
    }
        
    var reminder: Reminder?
    
//When initializing a view controller from a storyboard, iOS calls the init(coder:) initializer. This configure method approach is useful for configuring after initializing, such as injecting dependencies.
    
    func configure(with reminder: Reminder) { // Method that injects reminder
            self.reminder = reminder
    }
}


extension ReminderDetailViewController {
    static let reminderDetailCellIdentifier = "ReminderDetailCell"
}
