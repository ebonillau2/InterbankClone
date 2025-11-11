//
//  ViewStates.swift
//  InterbankClone
//
//  Created by Enrique Bonilla on 10/11/25.
//

import Foundation

enum ViewStates {
  case idle
  case loading
  case success
  case failure(Error)
}
