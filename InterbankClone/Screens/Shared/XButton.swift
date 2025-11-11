//
//  XButton.swift
//  InterbankClone
//
//  Created by Enrique Bonilla on 11/11/25.
//

import SwiftUI

struct XButton: View {
  let actionButton: () -> Void
  
  var body: some View {
    Button {
      actionButton()
    } label: {
      VStack {
        Image(systemName: "xmark")
          .resizable()
          .imageScale(.small)
          .frame(width: 16, height: 16)
          .foregroundColor(Color.theme.primaryText)
      }
      .frame(width: 45, height: 45)
    }
  }
}

struct LeadingXButton: View {
  var systemName: String = "xmark"
  let actionButton: () -> Void
  
  var body: some View {
    HStack {
      XButton(actionButton: actionButton)
      Spacer()
    }
  }
}

struct TrailingXButton: View {
  var systemName: String = "xmark"
  let actionButton: () -> Void
  
  var body: some View {
    HStack {
      Spacer()
      XButton(actionButton: actionButton)
    }
  }
}

#Preview {
  VStack {
    LeadingXButton {}
    TrailingXButton {}
  }
}
