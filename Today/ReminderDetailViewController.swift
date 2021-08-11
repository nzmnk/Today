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
        
        var cellImage: UIImage? { // Return an image for the row based on the current enumeration case.
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
    static let reminderDetailCellIdentifier = "ReminderDetailCell" // Constant for the cell identifier.
    
    //A table view asks its data source for the number of rows in a section when determining how many cells can be displayed on screen.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ReminderRow.allCases.count //The number of rows in the table view equals the number of cases in the enumeration.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: Self.reminderDetailCellIdentifier, for: indexPath)
           let row = ReminderRow(rawValue: indexPath.row)
           cell.textLabel?.text = row?.displayText(for: reminder) // Updating cell text
           cell.imageView?.image = row?.cellImage // Updating cell image
           return cell
       }
}
