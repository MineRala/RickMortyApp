//
//  RickMortyTableViewCell.swift
//  RickMortyApp
//
//  Created by Mine Rala on 1.05.2022.
//

import UIKit
import AlamofireImage

class RickMortyTableViewCell: UITableViewCell {
    
    private lazy var customImage: UIImageView = {
        let imageview = UIImageView(frame: .zero)
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.layer.cornerRadius = 10
        imageview.clipsToBounds = true
        return imageview
    }()
    
    private lazy var customTitle: UILabel = {
        let title = UILabel(frame: .zero)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let customDescription: UILabel = {
        let description = UILabel(frame: .zero)
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()
    
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
            make.height.equalTo(150)
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
        }
        
        customTitle.snp.makeConstraints { make in
            make.top.equalTo(customImage.snp.bottom).offset(10)
            make.left.right.equalToSuperview()
        }
        
        customDescription.snp.makeConstraints { make in
            make.top.equalTo(customTitle.snp.bottom)
            make.left.right.equalTo(contentView)
            make.height.equalTo(10)
        }
    }
    
    func saveModel(model: Result) {
        customTitle.text = model.name
        customDescription.text = model.status
        customImage.af.setImage(withURL: URL(string: model.image ?? randomImage) ?? URL(string: randomImage)!)
    }
}
