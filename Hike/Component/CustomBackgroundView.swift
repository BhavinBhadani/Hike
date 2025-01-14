//
//  CustomBackgroundView.swift
//  Hike
//
//  Created by Bhavin Bhadani on 14/01/25.
//

import SwiftUI

struct CustomBackgroundView: View {
    var body: some View {
        ZStack {
            Color(.colorGreenDark)
                .clipShape(.rect(cornerRadius: 40))
                .offset(y: 12)
            
            Color(.colorGreenLight)
                .clipShape(.rect(cornerRadius: 40))
                .offset(y: 3)
                .opacity(0.85)

            LinearGradient(
                colors: [.colorGreenLight, .colorGreenMedium],
                startPoint: .top,
                endPoint: .bottom
            )
            .clipShape(.rect(cornerRadius: 40))
        }
    }
}

#Preview {
    CustomBackgroundView()
        .padding()
}
