//
//  RickMortyViewController.swift
//  RickMortyApp
//
//  Created by Mine Rala on 30.04.2022.
//

import UIKit
import SnapKit

class RickMortyViewController: UIViewController {
    private let labelTitle: UILabel = UILabel()
    private let box: UIView = UIView()
    private let indicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        self.view.addSubview(labelTitle)
        self.view.addSubview(box)
        self.view.addSubview(indicator)
        drawDesign()
        makeLabel()
        makeIndicator()
        makeBox()
    }
    
    private func drawDesign() {
        DispatchQueue.main.async {
            self.view.backgroundColor = .white
            self.box.backgroundColor = .red
            self.labelTitle.text = "Mine"
            self.indicator.color = .red
        }
        indicator.startAnimating()
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
    
    private func makeBox() {
        box.snp.makeConstraints { make in
            make.top.equalTo(labelTitle.snp.bottom).offset(5)
            make.bottom.equalToSuperview()
            make.left.right.equalTo(labelTitle)
        }
    }
}
