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
        
        TableView.dataSource = self
    }

}


extension MyTodoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count            // 행 개수 리턴
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
