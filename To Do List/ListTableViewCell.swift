//
//  ListTableViewCell.swift
//  To Do List
//
//  Created by Hannah Jiang on 4/6/20.
//  Copyright © 2020 Hannah Jiang. All rights reserved.
//

import UIKit

protocol ListTableViewCellDelegate: class {
       func checkBoxToggle(sender: ListTableViewCell) //this tableviewcell can send a message to any viewcontroller that agrees to be the delegate for the listtableviewcell
   }

class ListTableViewCell: UITableViewCell {
    weak var delegate: ListTableViewCellDelegate?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var checkBoxButton: UIButton!
    
    var toDoItem: ToDoItem! {
        
        didSet { //every time the value of toDoItem changes we'll execute the code below 
            nameLabel.text = toDoItem.name
            checkBoxButton.isSelected = toDoItem.completed
        }
    }
    
    @IBAction func checkToggled(_ sender: UIButton) {
        delegate?.checkBoxToggle(sender: self)
    }
}
