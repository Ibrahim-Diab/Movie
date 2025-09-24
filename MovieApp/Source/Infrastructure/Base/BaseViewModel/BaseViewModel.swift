//
//  BaseViewModel.swift
//  MovieApp
//
//  Created by Diab on 24/09/2025.
//

import Combine
typealias Cancellables = Set<AnyCancellable>

import SwiftUI

@MainActor
class BaseViewModel:ObservableObject{
    
    var cancellables = Cancellables()
    
    @Published var viewState: ViewState = .content {
          didSet {
              if case .error = viewState {
                  returnToActiveState()
              }
              if case .showSuccessAlert(_) = viewState {
                  returnToActiveState()
              }
          }
      }
    
    init() {
        #if DEBUG
          $viewState
              .dropFirst()
              .sink { state in
                  print(" ⚪️ view state changed to ->>>>>>>>>> \(state)")
              }
              .store(in: &cancellables)
        #endif
      }
    
    
    func returnToActiveState(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [weak self] in
            guard let self else { return }
            if viewState != .content {
                viewState = .content
            }
        }
    }
    
    
    deinit {
        print("🟢 \(Self.self) deallocated, no memory leak.")
    }
        
}
