//
//  MyTodoListViewController.swift
//  MyTodoList
//
//  Created by 유림 on 3/22/24.
//

import UIKit

class MyTodoListViewController: UIViewController {
    
    let todoList: [TodoModel] = [
        TodoModel(id: 1, title: "밥먹기", isDone: true),
        TodoModel(id: 1, title: "Lv1 완성하기", isDone: false)
    ]
    @IBOutlet weak var TableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
