//
//  ActionButton.swift
//  InterbankClone
//
//  Created by Enrique Bonilla on 8/11/25.
//

import SwiftUI

struct ActionButton: View {
  var icon: String
  var title: String
  
  var body: some View {
    VStack(spacing: 8) {
      Image(systemName: icon)
        .resizable()
        .scaledToFit()
        .frame(width: 32, height: 32)
        .foregroundColor(.white)
        .padding()
        .background(
          RoundedRectangle(cornerRadius: 16)
            .fill(Color.theme.primary)
            .padding(0)
          )
      
      Text(title)
        .font(.footnote)
        .multilineTextAlignment(.center)
        .foregroundColor(Color.theme.primaryText)
    }
    .frame(width: 75)
  }
}

#Preview {
  HStack(spacing: 16) {
    ActionButton(icon: "lock.fill", title: "Bloquear\ntarjeta")
    ActionButton(icon: "qrcode", title: "Pagar con\nQR")
    ActionButton(icon: "iphone", title: "Servicios y\nrecargas")
    ActionButton(icon: "message.fill", title: "Plinear a\ncelular")
  }
}
