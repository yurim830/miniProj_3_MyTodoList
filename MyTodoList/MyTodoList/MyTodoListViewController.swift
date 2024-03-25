//
//  MyTodoListViewController.swift
//  MyTodoList
//
//  Created by 유림 on 3/22/24.
//

import UIKit

class MyTodoListViewController: UIViewController {
    
    var todoList: [TodoModel] = [
        TodoModel(id: 1, title: "밥먹기", isDone: true),
        TodoModel(id: 2, title: "Lv1 완성하기", isDone: false)
    ]
    
    @IBAction func AddTodoButtonTapped(_ sender: AddTodoButton) { // sender를 설정 = 인스턴트 생성 => 코드 실행됨
        let title = "할 일 추가"
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let ok = UIAlertAction(title: "확인", style: .default) { (_) in
            guard let title = alert.textFields?[0] else { return }
            if title.text?.isEmpty != true {
                let newTodo = TodoModel(id: self.todoList.count + 1, title: title.text!, isDone: false)
                self.todoList.append(newTodo)
            }
        }
        alert.addAction(cancel)
        alert.addAction(ok)
        
        alert.addTextField() { (tf) in
            tf.placeholder = "할 일을 입력하세요"
            tf.isSecureTextEntry = false
        }
        
        self.present(alert, animated: true)
    }

    @IBOutlet weak var TableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()       // super: 부모클래스의 viewDidLoad를 실행한다.
        
        TableView.dataSource = self
    }

}


extension MyTodoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count            // 행 개수 리턴
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyTodoListTableViewCell", for: indexPath) as? MyTodoListTableViewCell else {
            return UITableViewCell()
        }
        // tableView의 재사용가능한 셀을 가져옴
        let todo = todoList[indexPath.item]
        cell.configure(todo)
        return cell
    }
}
