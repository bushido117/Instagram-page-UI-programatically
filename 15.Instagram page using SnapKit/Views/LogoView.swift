//
//  LogoView.swift
//  15.Instagram page using SnapKit
//
//  Created by Вадим Сайко on 10.01.23.
//

import UIKit
import SnapKit

class LogoView: UIView {
    private lazy var imageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "IGlogo")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addSubview(imageView)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(30)
            make.width.equalTo(104)
        }
    }
    
}
