//
//  MyTodoListTableViewCell.swift
//  MyTodoList
//
//  Created by 유림 on 3/22/24.
//

import UIKit

class MyTodoListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var todoLabel: UILabel!
    
    @IBAction func isDoneSwitch(_ sender: UISwitch) {
    }
    
    func configure(_ todoList: TodoModel) {
        todoLabel.text = todoList.title
    }
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
