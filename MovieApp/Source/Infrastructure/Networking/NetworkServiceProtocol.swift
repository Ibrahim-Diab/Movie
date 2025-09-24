//
//  NetworkServiceProtocol.swift
//  MovieApp
//
//  Created by Diab on  24/09/2025.
//

import Foundation
import Combine

protocol NetworkServiceProtocol {
    func request<ResponseData: Decodable>(_ endpoint: ConfigEndpoint<ResponseData>,progress: ((_ progress: Int) -> Void)?
    ) -> AnyPublisher<ResponseData, NetworkError>
}

final class NetworkService: NetworkServiceProtocol {
    
    private let executor: NetworkExecutor
    
    init(executor: NetworkExecutor) {
        self.executor = executor
    }
    func request<ResponseData: Decodable>(_ endpoint: ConfigEndpoint<ResponseData>,progress: ((Int) -> Void)? = nil
    ) -> AnyPublisher<ResponseData, NetworkError> {
        return executor.execute(endpoint)
    }
    
    deinit {
        print("NetworkService deinit ✅ (no memory leaks)")
    }
}
