//
//  SettingsPresenterProtocol.swift
//  TodoList
//
//  Created by Volodymyr Myhailyuk on 04.09.2020.
//  Copyright © 2020 Volodymyr Mykhailiuk. All rights reserved.
//

protocol SettingsPresenterProtocol {

	var interactor: SettingsInteractorInput! { get }
	var numberOfSections: Int { get }
	var sections: [[SettingsCellType]] { get }

	func viewDidLoad()
	func numberOfRows(in section: Int) -> Int
	func titleForHeader(at index: Int) -> String
	func didSelectTableViewCell(at section: Int, and row: Int)
}
