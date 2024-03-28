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
    
    override func viewDidLoad() {
        super.viewDidLoad()       // super: 부모클래스의 viewDidLoad를 실행한다.
        
        tableView.dataSource = self
        //tableView.delegate = self
    }
    
    
    @IBAction func AddTodoButtonTapped(_ sender: AddTodoButton) { // sender를 설정 = 인스턴트 생성 => 코드 실행됨
        let alert = UIAlertController(title: "할 일 추가", message: nil, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "취소", style: .cancel)          // 취소 버튼 생성 (액션 클로저는 nil)
        let ok = UIAlertAction(title: "확인", style: .default) { [weak self] _ in    // 확인 버튼 생성 및 액션 클로저 설정
            guard let title = alert.textFields?[0] else { return }
            if title.text?.isEmpty != true {        // 클로저 선언부에 weak나 unknowned 키워드로 캡쳐목록을 정의하지 않고 클로저 본문에서 self 키워드로 클래스 인스턴스의 프로퍼티에 접근하게 되면 강한 순환참조가 발생해 메모리 누수가 발생될 수 있다.
                let newTodo = TodoModel(id: self!.todoList.last!.id + 1, title: title.text!, isDone: false)
                self?.todoList.append(newTodo)
                self?.tableView.reloadData()
            }
        }
        alert.addAction(cancel)   //
        alert.addAction(ok)
        
        alert.addTextField(configurationHandler: { (tf) in          // textfield를 구성하는 클로저
            tf.placeholder = "할 일을 입력하세요"
            tf.isSecureTextEntry = false
        })
        
        self.present(alert, animated: true, completion: nil)
    }

    @IBOutlet weak var tableView: UITableView!
    
}


extension MyTodoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count            // 행 개수 리턴
    }
    
    // cellForRowAt 함수: 특정 섹션의 n번째 row를 그리는 데 필요한 셀을 반환
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // dequeueReusableCell 메소드: queue를 사용해서 cell을 재사용함.
        //  -> 화면에 보이는 cell에 대해서만 매모리를 로드한다. 스크롤을 내려서 새로운 cell이 보이면 지나간 cell은 reusePool라는 곳에 queue가되어 들어가고, 나중에 해당 데이터를 다시 보게 되면 dequeue로 Pool에서 나오게 된다. 화면에 보이는 cell을 재사용하므로 메모리 낭비를 방지할 수 있다.
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyTodoListTableViewCell", for: indexPath) as? MyTodoListTableViewCell else {
            // Identifier: 재사용할 셀 객체를 가져옴
            // indexPath: cellForRowAt 메소드 파라미터. 이 위치에서 셀을 재사용.
            return UITableViewCell()
        }
        cell.isDoneSwitch.tag = indexPath.row
        // tableView의 재사용가능한 셀을 가져옴
        let todo = todoList[indexPath.row]
       
        cell.onToggled = { isOn in
            self.todoList[indexPath.row].isDone = isOn
        }
        cell.configure(todo)
        return cell
    }
    // swipe하여 버튼 클릭하면 delete
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        todoList.remove(at: indexPath.row)
        tableView.reloadData()
    }
}
