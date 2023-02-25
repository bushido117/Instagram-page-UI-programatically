//
//  StoryCollectionViewCell.swift
//  15.Instagram page using SnapKit
//
//  Created by Вадим Сайко on 11.01.23.
//

import UIKit
import SnapKit

class StoryCollectionViewCell: UICollectionViewCell {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 60 / 2
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var plusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "addStoryButton"), for: .normal)
        return button
    }()
    
    private lazy var circleImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "storyRing"))
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.size.equalTo(60)
            make.leading.trailing.top.equalToSuperview().inset(6)
        }
        contentView.addSubview(usernameLabel)
        usernameLabel.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(6)
            make.top.equalTo(imageView.snp.bottom).offset(6)
        }
        contentView.addSubview(plusButton)
        plusButton.snp.makeConstraints { make in
            make.trailing.bottom.equalTo(imageView)
            make.size.equalTo(20)
        }
        contentView.addSubview(circleImage)
        circleImage.snp.makeConstraints { make in
            make.center.equalTo(imageView)
            make.size.equalTo(72)
        }
    }
    
    func configure(with story: StoryCellModel) {
        imageView.image = story.image
        usernameLabel.text = story.username
        plusButton.isHidden = !story.isAddButtonVisible
        circleImage.isHidden = !story.isNewStory
    }
}
