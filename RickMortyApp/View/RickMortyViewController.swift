//
//  RickMortyViewController.swift
//  RickMortyApp
//
//  Created by Mine Rala on 30.04.2022.
//

import UIKit
import SnapKit

protocol RickMortyOutput{
    func changeLoading(isLoading: Bool)
    func saveDatas(values: [Result])
}

class RickMortyViewController: UIViewController {
    private let labelTitle: UILabel = UILabel()
    private let tableView: UITableView = UITableView()
    private let indicator: UIActivityIndicatorView = UIActivityIndicatorView()
    private lazy var results: [Result] = []
    lazy var viewModel: RickMortyViewModel = RickMortyViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        viewModel.fetchItems()
        viewModel.setDelegate(output: self)
    }
    
    private func configure() {
        self.view.addSubview(labelTitle)
        self.view.addSubview(tableView)
        self.view.addSubview(indicator)
        drawDesign()
        makeLabel()
        makeIndicator()
        makeTableView()
    }
    
    private func drawDesign() {
        tableView.delegate = self
        tableView.dataSource = self
        DispatchQueue.main.async {
            self.view.backgroundColor = .white
            self.labelTitle.text = "Rick Morty"
            self.labelTitle.font = .boldSystemFont(ofSize: 25)
            self.indicator.color = .red
        }
        indicator.startAnimating()
    }
}

extension RickMortyViewController: RickMortyOutput {
    func changeLoading(isLoading: Bool) {
        isLoading ? indicator.startAnimating() : indicator.stopAnimating()
    }
    
    func saveDatas(values: [Result]) {
        results = values
        tableView.reloadData()
    }
    
    
}

extension RickMortyViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = results[indexPath.row].name ?? ""
        return cell
    }
    
    
}

extension RickMortyViewController {
    private func makeLabel() {
        labelTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
            make.height.greaterThanOrEqualTo(10)
        }
    }
    
    private func makeIndicator() {
        indicator.snp.makeConstraints { make in
            make.top.height.equalTo(labelTitle)
            make.right.equalTo(labelTitle).offset(-5)
        }
    }
    
    private func makeTableView() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(labelTitle.snp.bottom).offset(5)
            make.bottom.equalToSuperview()
            make.left.right.equalTo(labelTitle)
        }
    }
}
