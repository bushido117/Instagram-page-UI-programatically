//
//  ViewController.swift
//  15.Instagram page using SnapKit
//
//  Created by Вадим Сайко on 10.01.23.
//

import UIKit
import SnapKit

enum TableViewItemType {
    case stories([StoryCellModel])
    case post(PostCellModel)
}

class ViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.register(StoriesTableViewCell.self, forCellReuseIdentifier: String(describing: StoriesTableViewCell.self))
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: String(describing: PostTableViewCell.self))
        tableView.separatorColor = .clear
        return tableView
    }()
    
    private var items: [TableViewItemType] = [
        .stories([
        StoryCellModel(image: UIImage(named: "dog")!, username: "user1", isAddButtonVisible: true, isNewStory: false),
        StoryCellModel(image: UIImage(named: "dog")!, username: "user2", isAddButtonVisible: false, isNewStory: true),
        StoryCellModel(image: UIImage(named: "dog")!, username: "user3", isAddButtonVisible: false, isNewStory: false),
        StoryCellModel(image: UIImage(named: "dog")!, username: "user4", isAddButtonVisible: false, isNewStory: false),
        StoryCellModel(image: UIImage(named: "dog")!, username: "user5", isAddButtonVisible: false, isNewStory: true),
        StoryCellModel(image: UIImage(named: "dog")!, username: "user6", isAddButtonVisible: false, isNewStory: true),
        StoryCellModel(image: UIImage(named: "dog")!, username: "user7", isAddButtonVisible: false, isNewStory: false)
    ]),
        .post(
            PostCellModel(userImage: UIImage(named: "dog")!, username: "user1", postSubtitle: "Sponsored", postImage: UIImage(named: "dog")!, numberOfLikes: 123, comment: CommentShortInfo(username: "user3", commentText: "Hello"))
        ),
        .post(
            PostCellModel(userImage: UIImage(named: "dog")!, username: "user1", postSubtitle: "Sponsored", postImage: UIImage(named: "dog")!, numberOfLikes: 123, comment: CommentShortInfo(username: "user3", commentText: "Hello"))
        ),
        .post(
            PostCellModel(userImage: UIImage(named: "dog")!, username: "user1", postSubtitle: "Sponsored", postImage: UIImage(named: "dog")!, numberOfLikes: 123, comment: CommentShortInfo(username: "user3", commentText: "Hello"))
        )
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
    }
    
    private func setupVC() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        setupConstraints()
        navigationItem.leftBarButtonItems = makeLeftBarButtonItems()
        navigationItem.rightBarButtonItems = makeRightBarButtonItems()
        navigationController?.navigationBar.tintColor = .black
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func makeLeftBarButtonItems() -> [UIBarButtonItem] {
        let logoBarButtonItem = UIBarButtonItem(customView: LogoView())
        let dropDownButtonItem = UIBarButtonItem(title: nil,
                                                 image: UIImage(systemName: "chevron.down"),
                                                 target: self,
                                                 action: nil,
                                                 menu: makeDropDownMenu())
        return [logoBarButtonItem, dropDownButtonItem]
    }
    
    private func makeRightBarButtonItems() -> [UIBarButtonItem] {
        let addBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.app"), style: .plain, target: self, action: #selector(addBarButtomItemTapped))
        let directBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "paperplane"), style: .plain, target: self, action: #selector(directBarButtomItemTapped))
        return [directBarButtonItem, addBarButtonItem]
    }
    
    @objc private func addBarButtomItemTapped() {
        print("Add")
    }
    
    @objc private func directBarButtomItemTapped() {
        print("Direct")
    }

    private func makeDropDownMenu() -> UIMenu {
        let subsItem = UIAction(title: "Подписки", image: UIImage(systemName: "person.2")) {_ in
            print("Subs")
        }
        let favsItem = UIAction(title: "Избранное", image: UIImage(systemName: "star")) {_ in
            print("Favs")
        }
        return UIMenu(title: "", children: [subsItem, favsItem])
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        switch item {
        case .stories(let stories):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: StoriesTableViewCell.self), for: indexPath) as? StoriesTableViewCell else { return UITableViewCell()}
            cell.configure(with: stories)
            return cell
        case .post(let post):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PostTableViewCell.self), for: indexPath) as? PostTableViewCell else { return UITableViewCell()}
            cell.configure(with: post)
            return cell
        }
    }
}
