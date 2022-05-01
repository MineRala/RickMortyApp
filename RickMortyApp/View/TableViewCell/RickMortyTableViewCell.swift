//
//  RickMortyTableViewCell.swift
//  RickMortyApp
//
//  Created by Mine Rala on 1.05.2022.
//

import UIKit
import AlamofireImage

class RickMortyTableViewCell: UITableViewCell {
    private let customImage: UIImageView = UIImageView()
    private let customTitle: UILabel = UILabel()
    private let customDescription: UILabel = UILabel()
    private let randomImage: String = "https://picsum.photos/id/237/200/300"

    enum Identifier: String {
        case custom = "cellIdentifier"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(customImage)
        addSubview(customTitle)
        addSubview(customDescription)
        customTitle.font = .boldSystemFont(ofSize: 18)
        customDescription.font = .italicSystemFont(ofSize: 14)
        
        customImage.snp.makeConstraints { make in
            make.height.equalTo(100)
            make.top.equalTo(contentView)
            make.left.right.equalToSuperview()
        }
        
        customTitle.snp.makeConstraints { make in
            make.top.equalTo(customImage.snp.bottom).offset(10)
            make.left.right.equalTo(customImage)
        }
        
        customDescription.snp.makeConstraints { make in
            make.top.equalTo(customTitle).offset(5)
            make.left.right.equalTo(contentView)
            make.bottom.equalToSuperview()
        }
        
    }
    
    func saveModel(model: Result) {
        customTitle.text = model.name
        customDescription.text = model.status
        customImage.af.setImage(withURL: URL(string: model.image ?? randomImage) ?? URL(string: randomImage)!)
    }
}
