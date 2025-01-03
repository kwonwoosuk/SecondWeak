//
//  ShoppingListTableViewController.swift
//  SecondWeak
//
//  Created by 권우석 on 1/3/25.
//


import UIKit


class ShoppingListTableViewController: UITableViewController {
    
    @IBOutlet weak var listTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    var list = ["그립톡 구매하기", "사이다 구매", "아이패드 케이스 최저가 알아보기", "맥북 알아보기"] {
        didSet{
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 48
    }
    
    @IBAction func addListButtonTapped(_ sender: UIButton) {
        guard let text = listTextField.text else { listTextField.text = "다시 입력하세요"
            return }
        list.append(text)
        tableView.reloadData()
    }
    
    //셀 갯수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell")!
    
        cell.textLabel?.text = list[indexPath.row]
        
        cell.textLabel?.textColor = .black
        cell.textLabel?.font = .systemFont(ofSize: 12)
        print(#function, indexPath)
        return cell
    }
    
    
    func setUpUI() {
        listTextField.placeholder = "무엇을 구매하실 건가요?"
        listTextField.borderStyle = .roundedRect
    }
}
