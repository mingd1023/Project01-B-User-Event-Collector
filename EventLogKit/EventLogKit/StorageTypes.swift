//
//  StorageTypes.swift
//  EventLog
//
//  Created by TTOzzi on 2020/12/13.
//

import Foundation

public protocol LocalStorageType {
    func save(_ event: EventLogType)
    func sendToServer()
}

public protocol ServerStorageType {
    func send<T: EventLogType>(_ event: T)
    func setFailureHandler(_ handler: @escaping (EventLogType) -> Void)
}
