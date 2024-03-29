//
//  MyTodoListTableViewCell.swift
//  MyTodoList
//
//  Created by 유림 on 3/22/24.
//

import UIKit

class MyTodoListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var todoLabel: UILabel!
    
    @IBOutlet weak var deadLineLabel: UILabel!
    @IBOutlet weak var isDoneSwitch: UISwitch!
    
    var onToggled: ((Bool) -> Void)?

    @IBAction func isSwitchToggled(_ sender: UISwitch) {
        onToggled?(isDoneSwitch.isOn)
        applyStrike(sender.isOn)
    }
    
    func configure(_ todo: TodoModel) {
        todoLabel.attributedText = nil
        todoLabel.text = todo.title
        deadLineLabel.text = todo.deadLine != "" ? "\(todo.deadLine)까지!" : ""
        isDoneSwitch.isOn = todo.isDone
        //onToggled?(isDoneSwitch.isOn)
        applyStrike(todo.isDone)
        //print(todo)
    }
    
    func applyStrike(_ isDone: Bool) {
        if isDone {
            todoLabel.attributedText = todoLabel.text?.strikeThrough()
            todoLabel.textColor = .gray
        } else {
            todoLabel.attributedText = todoLabel.text?.deStrikeThrough()
            todoLabel.textColor = .black
        }
    }
    

}

extension String {
    func strikeThrough() -> NSAttributedString {
        let attributeString = NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attributeString.length))
        return attributeString
    }
    
    func deStrikeThrough() -> NSAttributedString {
        let attributeString = NSMutableAttributedString(string: self)
        attributeString.removeAttribute(NSAttributedString.Key.strikethroughStyle, range: NSMakeRange(0, attributeString.length))
        return attributeString
    }
}
//
//private var nsAttributedString: NSAttributedString {
//    let string = "NSAttributedString String"
//    let attributes: [NSAttributedString.Key : Any] = [
//        NSAttributedString.Key.foregroundColor: UIColor.systemPink,
//        NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 40),
//        NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue
//    ]
//    return NSAttributedString(string: string, attributes: attributes)
//}
//
//// AttributedString
//private var attributedString: AttributedString {
//    let string = "Attributed String"
//    var attributedString = AttributedString(string)
//    attributedString.foregroundColor = .blue
//    attributedString.font = .boldSystemFont(ofSize: 40)
//    attributedString.underlineStyle = .single
//    return attributedString
//}
