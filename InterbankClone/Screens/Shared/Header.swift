//
//  header.swift
//  InterbankClone
//
//  Created by Enrique Bonilla on 8/11/25.
//

import SwiftUI

struct Header: View {
  let buttonTapped: () -> Void

  var body: some View {
    HStack {
      Button {
        buttonTapped()
      } label: {
        Image(systemName: "line.3.horizontal")
          .font(.title2)
          .foregroundColor(.green)
      }
      
      Spacer()
      
      HStack {
        Image("logotipo")
          .resizable()
          .scaledToFit()
          .frame(width: 24, height: 24)
      }
      HStack(alignment: .lastTextBaseline, spacing: 6) {
        Text("Interclone")
          .font(.title2.bold())
          .foregroundColor(Color.theme.primary)
        Text("v21.2")
          .font(.caption2)
          .foregroundColor(.gray)
      }
      
      Spacer()
    }
    .padding()
    .frame(height: 60)
  }
}

#Preview {
  VStack {
    Header() {}
    Spacer()
  }
}
