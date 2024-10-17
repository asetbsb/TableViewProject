//
//  ViewController.swift
//  TableViewProject
//
//  Created by Asset on 10/10/24.
//

import UIKit

class ViewController: UIViewController {
    private var whichTable: TableViewStyle = .mentor
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.backgroundColor = .systemBackground
        tableView.allowsSelection = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private lazy var firstButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Mentors", for: .normal)
        button.layer.cornerRadius = 35
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(viewMentorsTable), for: .touchUpInside)
        return button
    }()
    
    private lazy var secondButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Menties", for: .normal)
        button.layer.cornerRadius = 35
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(viewMentieesTable), for: .touchUpInside)
        return button
    }()
    
    private let buttonsView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemMint
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func addSubviews(){
        view.addSubview(buttonsView)
        view.addSubview(tableView)
        buttonsView.addSubview(firstButton)
        buttonsView.addSubview(secondButton)
    }
    
    private func setupUI(){
        addSubviews()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        NSLayoutConstraint.activate([
            buttonsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            buttonsView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            buttonsView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            buttonsView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.2),
            
            firstButton.centerYAnchor.constraint(equalTo: buttonsView.centerYAnchor),
            firstButton.heightAnchor.constraint(equalTo: buttonsView.heightAnchor, multiplier: 0.5),
            firstButton.widthAnchor.constraint(equalTo: buttonsView.widthAnchor, multiplier: 0.3),
            firstButton.leadingAnchor.constraint(equalTo: buttonsView.leadingAnchor, constant: 16),
            
            secondButton.centerYAnchor.constraint(equalTo: buttonsView.centerYAnchor),
            secondButton.heightAnchor.constraint(equalTo: buttonsView.heightAnchor, multiplier: 0.5),
            secondButton.widthAnchor.constraint(equalTo: buttonsView.widthAnchor, multiplier: 0.3),
            secondButton.trailingAnchor.constraint(equalTo: buttonsView.trailingAnchor, constant: -16),

            tableView.topAnchor.constraint(equalTo: buttonsView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc private func viewMentorsTable() {
        whichTable = .mentor
        firstButton.backgroundColor = .systemGray
        secondButton.backgroundColor = .systemBlue
        tableView.reloadData()
    }
    
    @objc private func viewMentieesTable() {
        whichTable = .mentee
        firstButton.backgroundColor = .systemBlue
        secondButton.backgroundColor = .systemGray
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return whichTable.values().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let list = whichTable.values()
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }
}
