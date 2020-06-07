//
//  Task+CoreDataProperties.swift
//  TodoList
//
//  Created by Volodymyr Mykhailiuk on 04.06.2020.
//  Copyright © 2020 Volodymyr Mykhailiuk. All rights reserved.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var imagePath: String
    @NSManaged public var name: String
    @NSManaged public var id: String
    @NSManaged public var subTasks: NSSet

}

// MARK: Generated accessors for subTasks
extension Task {

    @objc(addSubTasksObject:)
    @NSManaged public func addToSubTasks(_ value: SubTask)

    @objc(removeSubTasksObject:)
    @NSManaged public func removeFromSubTasks(_ value: SubTask)

    @objc(addSubTasks:)
    @NSManaged public func addToSubTasks(_ values: NSSet)

    @objc(removeSubTasks:)
    @NSManaged public func removeFromSubTasks(_ values: NSSet)

}

extension Task: StorableModel {
	var domainModel: TaskEntity {
		TaskEntity(id: id, name: name, imagePath: imagePath)
	}
}

extension Task: EntityMappable {
	func map(_ entity: TaskEntity) {
		id = entity.id
		name = entity.name
		imagePath = entity.imagePath
	}
}
