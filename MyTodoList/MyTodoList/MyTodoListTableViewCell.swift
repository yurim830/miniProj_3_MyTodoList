//
//  MyTodoListTableViewCell.swift
//  MyTodoList
//
//  Created by 유림 on 3/22/24.
//

import UIKit

class MyTodoListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var todoLabel: UILabel!
    
    @IBOutlet weak var isDoneSwitch: UISwitch!
    @IBAction func isDoneSwitch(_ sender: UISwitch) {
        print(sender.tag)
    }
    
    func configure(_ todo: TodoModel) {
        todoLabel.text = todo.title
        isDoneSwitch.isOn = todo.isDone
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
