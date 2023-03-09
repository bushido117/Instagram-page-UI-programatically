//
//  PostTableViewCell.swift
//  15.Instagram page using SnapKit
//
//  Created by Вадим Сайко on 11.01.23.
//

import SnapKit
import UIKit

class PostTableViewCell: UITableViewCell {
    
    private lazy var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 30 / 2
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 11)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var optionsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var likesButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(likesButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var commentButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "bubble.right"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private lazy var directButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "paperplane"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 12
        return stackView
    }()
    
    private lazy var likesLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var commentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        selectionStyle = .none
        contentView.addSubview(userImageView)
        userImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(12)
            make.top.equalToSuperview().offset(6)
            make.size.equalTo(30)
        }
        
        labelStackView.addArrangedSubview(usernameLabel)
        labelStackView.addArrangedSubview(subtitleLabel)
        contentView.addSubview(labelStackView)
        labelStackView.snp.makeConstraints { make in
            make.centerY.equalTo(userImageView)
            make.leading.equalTo(userImageView.snp.trailing).offset(12)
        }
        
        contentView.addSubview(optionsButton)
        optionsButton.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview().inset(12)
        }
        
        contentView.addSubview(postImageView)
        postImageView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(userImageView.snp.bottom).offset(6)
            make.height.equalTo(contentView.snp.width)
        }
        
        buttonsStackView.addArrangedSubview(likesButton)
        buttonsStackView.addArrangedSubview(commentButton)
        buttonsStackView.addArrangedSubview(directButton)
        contentView.addSubview(buttonsStackView)
        buttonsStackView.snp.makeConstraints { make in
            make.height.equalTo(24)
            make.leading.equalToSuperview().inset(6)
            make.top.equalTo(postImageView.snp.bottom).offset(6)
        }
        
        contentView.addSubview(likesLabel)
        likesLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(6)
            make.top.equalTo(buttonsStackView.snp.bottom).offset(12)
        }
        
        contentView.addSubview(commentLabel)
        commentLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(6)
            make.top.equalTo(likesLabel.snp.bottom).offset(12)
            make.bottom.equalToSuperview().inset(6)
        }
    }
    
    func configure(with post: PostCellModel) {
        userImageView.image = post.userImage
        usernameLabel.text = post.username
        subtitleLabel.text = post.postSubtitle
        postImageView.image = post.postImage
        likesLabel.text = "\(post.numberOfLikes) likes"
        if let comment = post.comment {
            setupCommentLabel(with: comment)
        }
    }
    
    private func setupCommentLabel(with comment: CommentShortInfo) {
        let string = comment.username + " " + comment.commentText
        let attributedString = NSMutableAttributedString(string: string)
        let range = NSRange(location: .zero, length: comment.username.count)
        attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 14), range: range)
        commentLabel.attributedText = attributedString
    }
    
    @objc private func likesButtonTapped() {
        print("Like")
    }
}
