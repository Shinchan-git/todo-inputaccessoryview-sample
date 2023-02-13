//
//  ViewController.swift
//  TodoApp
//
//  Created by Owner on 2023/02/07.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var todos: [String] = []

    lazy var myInputAccessoryView: InputAccessoryView = {
        let view = InputAccessoryView()
        view.frame = .init(x: 0, y: 0, width: view.frame.size.width, height: 80)
        view.delegate = self
        return view
    }()
    
    override var inputAccessoryView: UIView? { return myInputAccessoryView }
    
    override var canBecomeFirstResponder: Bool { return true }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = todos[indexPath.row]
        
        return cell
    }
}


extension ViewController: InputAccessoryViewDelegate {
    func tappedSendButton(text: String) {
        todos.append(text)
        tableView.reloadData()
    }
}
