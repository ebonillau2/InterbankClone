//
//  OptionRow.swift
//  InterbankClone
//
//  Created by Enrique Bonilla on 11/11/25.
//

import SwiftUI

struct OptionRow: View {
  let icon: String
  let text: String
  let color: Color = .theme.primaryColor
  
  var body: some View {
    HStack(spacing: 12) {
      Image(systemName: icon)
        .font(.title)
        .foregroundColor(color)
        .frame(width: 32, height: 32)
      
      Text(text)
        .font(.headline.weight(.medium))
        .foregroundColor(.primary)
      
      Spacer()
      
      Image(systemName: "chevron.right")
        .foregroundColor(.green)
        .font(.caption2.weight(.semibold))
    }
    .padding(.vertical, 10)
    .padding(.horizontal, 14)
    .background(
      RoundedRectangle(cornerRadius: 14)
        .fill(Color.white)
        .shadow(color: .black.opacity(0.1), radius: 3, x: 0, y: 3)
    )
  }
}

#Preview {
  OptionRow(icon: "person", text: "Perfil")
}
