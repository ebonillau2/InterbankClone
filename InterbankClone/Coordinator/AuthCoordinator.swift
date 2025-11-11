//
//  AuthCoordinator.swift
//  InterbankClone
//
//  Created by Enrique Bonilla on 8/11/25.
//

import SwiftUI
import Combine

final class AuthCoordinator: @MainActor RouterProtocol, @MainActor FullScreenCoverProtocol {
  @Published var path: [Route] = []
  @Published var fullScreenCover: FullScreenCover?
  
  @ViewBuilder
  func destination(for screen: Route) -> some View {
    switch screen {
    case .login:
      LoginScreen()
    case .moreOptions:
      MoreOptionsScreen()
    case .home:
      HomeScreen()
    }
  }
  
  @ViewBuilder
  func buildCover(cover: FullScreenCover) -> some View {
    switch cover {
    case .customAlert:
      CustomAlert()
    case .home:
      HomeScreen()
    }
  }
}

extension AuthCoordinator {
  enum Route: Hashable {
    case login
    case moreOptions
    case home
  }
  
  enum FullScreenCover: String, Identifiable {
    var id: String {
      self.rawValue
    }
    case customAlert
    case home
  }
}

