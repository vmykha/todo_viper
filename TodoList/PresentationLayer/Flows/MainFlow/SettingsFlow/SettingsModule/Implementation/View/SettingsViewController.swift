//
//  SettingsViewController.swift
//  TodoList
//
//  Created by Volodymyr Myhailyuk on 10.07.2020.
//  Copyright © 2020 Volodymyr Mykhailiuk. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
	var presenter: SettingsPresenterProtocol!

	var onAccount: (() -> Void)?
	var onTheme: (() -> Void)?

	@IBOutlet weak var tableView: UITableView! {
		didSet {
			tableView.delegate = self
			tableView.dataSource = self
			tableView.registerNib(cellType: UserInfoTableViewCell.self)
			tableView.registerNib(cellType: EmailTableViewCell.self)
			tableView.registerNib(cellType: SwitchTableViewCell.self)
			tableView.registerNib(cellType: SettingsTableViewCell.self)
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		presenter.viewDidLoad()
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.navigationController?.navigationBar.topItem?.title = "Settings"
	}
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return presenter.numberOfRows(in: section)
	}

	func numberOfSections(in tableView: UITableView) -> Int {
		return presenter.numberOfSections
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cellType = presenter.sections[indexPath.section][indexPath.row]


		switch cellType {
		case .photo(let model, _):
			let cell = tableView.dequeue(cellType: UserInfoTableViewCell.self, for: indexPath)
			cell.configure(with: model)
			return cell
		case .regular(let model, _):
			let cell = tableView.dequeue(cellType: EmailTableViewCell.self, for: indexPath)
			cell.configure(with: model)
			return cell
		case .switch(let model, _):
			let cell = tableView.dequeue(cellType: SwitchTableViewCell.self, for: indexPath)
			cell.configure(with: model)
			return cell
		case .icon(let model, _):
			let cell = tableView.dequeue(cellType: SettingsTableViewCell.self, for: indexPath)
			cell.configure(with: model)
			return cell
		}

	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		presenter.didSelectTableViewCell(at: indexPath.section, and: indexPath.row)
		tableView.deselectRow(at: indexPath, animated: true)
	}

	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return presenter.titleForHeader(at: section)
	}
}

extension SettingsViewController: SettingsViewProtocol {
	func reloadData() {
		self.tableView.reloadData()
	}
}
