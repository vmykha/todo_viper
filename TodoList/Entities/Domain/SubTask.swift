//
//  SubTask.swift
//  TodoList
//
//  Created by Volodymyr Mykhailiuk on 28.05.2020.
//  Copyright © 2020 Volodymyr Mykhailiuk. All rights reserved.
//

import Foundation

struct SubTask {
	let uuid: String
	var description: String
	var completed: Bool

	init(uuid: String = UUID().uuidString, description: String, completed: Bool) {
		self.uuid = uuid
		self.description = description
		self.completed = completed
	}
}

// MARK: ViewModelMapping
extension SubTask: ViewModelMapping {
	var viewModel: SubTaskViewModel {
		return SubTaskViewModel(uuid: uuid,
								description: description,
								isCompleted: completed)
	}
}