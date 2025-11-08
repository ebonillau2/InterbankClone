//
//  AuthCoordinator.swift
//  InterbankClone
//
//  Created by Enrique Bonilla on 8/11/25.
//

import SwiftUI
import Combine

final class AuthCoordinator: RouterProtocol {
  @Published var path: [Route] = []

  @ViewBuilder
  func destination(for screen: Route) -> some View {
    switch screen {
    case .login:
      LoginScreen()
    case .moreOptions:
      MoreOptionsScreen()
    }
  }
}

extension AuthCoordinator {
  enum Route: Hashable {
    case login
    case moreOptions
  }
}
