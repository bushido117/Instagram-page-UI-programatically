//
//  PostCellModel.swift
//  15.Instagram page using SnapKit
//
//  Created by Вадим Сайко on 10.01.23.
//

import UIKit

struct PostCellModel {
    let userImage: UIImage
    let username: String
    let postSubtitle: String
    let postImage: UIImage
    let numberOfLikes: Int
    let comment: CommentShortInfo?
}

struct CommentShortInfo {
    let username: String
    let commentText: String
}
