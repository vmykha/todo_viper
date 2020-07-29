//
//  BaseCoordinator.swift
//  TodoList
//
//  Created by Volodymyr Myhailyuk on 30.07.2020.
//  Copyright © 2020 Volodymyr Mykhailiuk. All rights reserved.
//

import Foundation

class BaseCoordinator {
	var childCoordinators: [Coordinatable] = []

	func addDependency(_ coordinator: Coordinatable) {
		for element in childCoordinators {
			if element === coordinator { return }
		}

		childCoordinators.append(coordinator)
	}

	func removeDependency(_ coordinator: Coordinatable?) {
		guard let coordinator = coordinator, !childCoordinators.isEmpty else {
			return
		}

		for (index, element) in childCoordinators.enumerated() {
			if element === coordinator {
				childCoordinators.remove(at: index)
				break
			}
		}
	}
}


