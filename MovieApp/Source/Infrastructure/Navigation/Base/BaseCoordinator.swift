//
//  BaseCoordinator.swift
//  MovieApp
//
//  Created by Diab on 24/09/2025.
//

import SwiftUI

@MainActor
class BaseCoordinator<Route: Hashable>: ObservableObject {
    
    @Published var path: [Route] = []
    
    func navigate(to route: Route) {
        path.append(route)
    }
    
    @discardableResult
    func pop() -> Route? {
        path.popLast()
    }
    
    func popToRoot() {
        path.removeAll()
    }
    
    func replace(with route: Route) {
        path = [route]
    }
    
    func reset() {
        popToRoot()
    }
      
}

