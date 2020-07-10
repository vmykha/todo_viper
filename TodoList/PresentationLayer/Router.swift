//
//  Router.swift
//  TodoList
//
//  Created by Volodymyr Mykhailiuk on 29.05.2020.
//  Copyright © 2020 Volodymyr Mykhailiuk. All rights reserved.
//

import UIKit

protocol RouterMain {
	//var navigationController: UINavigationController! { get set }
	var mainNavigationController: UINavigationController! { get set }
	var settingsNavigationController: UINavigationController! { get set }
	var assemblyBuilder: AssemblyBuilderProtocol! { get set }
}

protocol RouterProtocol: RouterMain {
	func showTaskListViewController()
	func showSubTaskListViewController(task: Task)
	func showTaskDetailsViewController(scope: Scope<TaskViewModel>)
	func showSubTaskDetailsViewController(task: Task, scope: Scope<SubTaskViewModel>)

	func popToRoot()
	func pop()
}

class Router: RouterProtocol {
	var mainNavigationController: UINavigationController!
	var settingsNavigationController: UINavigationController!
	var assemblyBuilder: AssemblyBuilderProtocol!

	init(assemblyBuilder: AssemblyBuilder?) {
		//self.navigationController = navigationController
		self.assemblyBuilder = assemblyBuilder
	}

	func showTaskListViewController() {
		let mainVC = assemblyBuilder.createMainModule(router: self)
		mainNavigationController.viewControllers = [mainVC]
	}

	func showSubTaskListViewController(task: Task) {
		let vc = assemblyBuilder.createSubTaskListModule(router: self, task: task)
		mainNavigationController.pushViewController(vc, animated: true)
	}

	func showTaskDetailsViewController(scope: Scope<TaskViewModel>) {
		let vc = assemblyBuilder.createTaskDetailsModule(router: self, scope: scope)
		mainNavigationController.pushViewController(vc, animated: true)
	}

	func showSubTaskDetailsViewController(task: Task, scope: Scope<SubTaskViewModel>) {
		let vc = assemblyBuilder.createSubTaskDetailsModule(router: self, task: task, scope: scope)
		mainNavigationController.pushViewController(vc, animated: true)
	}

	func popToRoot() {
		mainNavigationController.popToRootViewController(animated: true)
	}

	func pop() {
		mainNavigationController.popViewController(animated: true)
	}
}
