//
//  AddTaskPresenter.swift
//  TodoList
//
//  Created by Volodymyr Mykhailiuk on 02.06.2020.
//  Copyright © 2020 Volodymyr Mykhailiuk. All rights reserved.
//

protocol AddTaskOutput: class {
	init(view: AddTaskInput, dataProvider: TasksRepositoryType, router: RouterProtocol)
	func saveButtonPressed(with data: TaskEntity)
}

protocol AddTaskInput: class {
	//func taskDidSave()
}

final class AddTaskPresenter: AddTaskOutput {

	weak var view: AddTaskInput?
	let repository: TasksRepositoryType!
	let router: RouterProtocol?

	init(view: AddTaskInput, dataProvider: TasksRepositoryType, router: RouterProtocol) {
		self.view = view
		self.repository = dataProvider
		self.router = router
	}

	func saveButtonPressed(with data: TaskEntity) {
		_ = repository.create(task: data)
		router?.popToRoot()
		
	}
}
