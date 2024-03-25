//
//  AddTodoButton.swift
//  MyTodoList
//
//  Created by 유림 on 3/25/24.
//

import UIKit

class AddTodoButton: UIButton {
    func addTodo() {
        let title = "할 일 추가"
        let message = "할 일을 추가하세요."
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let ok = UIAlertAction(title: "확인", style: .default) { (_) in
            // ok를 클릭했을 때 처리할 내용
        }
        alert.addAction(cancel)
        alert.addAction(ok)

    }
}
