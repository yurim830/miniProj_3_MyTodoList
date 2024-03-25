//
//  AddTodoButton.swift
//  MyTodoList
//
//  Created by 유림 on 3/25/24.
//

import UIKit

class AddTodoButton: UIButton {
    func addTodo() -> UIAlertController {
        let title = "할 일 추가"
        let message = "할 일을 추가하세요."
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let ok = UIAlertAction(title: "확인", style: .default) { (_) in
            // ok를 클릭했을 때 처리할 내용
            
        }
        alert.addAction(cancel)
        alert.addAction(ok)

        return alert
    }
}

// => 이렇게 클래스를 따로 만들면 ViewController에 있는 데이터에 접근하기가 현재로서는 까다로움...
