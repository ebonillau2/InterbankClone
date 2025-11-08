//
//  header.swift
//  InterbankClone
//
//  Created by Enrique Bonilla on 8/11/25.
//

import SwiftUI

struct Header: View {
  var body: some View {
    HStack {
      Image(systemName: "line.3.horizontal")
        .font(.title2)
        .foregroundColor(.green)
      
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
    .padding(.horizontal)
  }
}

#Preview {
  Header()
}
