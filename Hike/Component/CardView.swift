//
//  CardView.swift
//  Hike
//
//  Created by Bhavin Bhadani on 14/01/25.
//

import SwiftUI

struct CardView: View {
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet = false

    func randomImage() {
        repeat {
            randomNumber = Int.random(in: 1...5)
        } while randomNumber == imageNumber
        
        imageNumber = randomNumber
    }
    
    var body: some View {
        ZStack {
            CustomBackgroundView()
            
            VStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .font(.system(size: 52))
                            .fontWeight(.black)
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [.colorGrayLight, .colorGrayMedium],
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                        
                        Spacer()
                        
                        Button {
                            isShowingSheet.toggle()
                        } label: {
                            CustomButtonView()
                        }
                        .sheet(isPresented: $isShowingSheet) {
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium, .large])
                        }
                    }
                    
                    Text("Fun and enjoyable outdoor activities with friends & families.")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundStyle(.colorGrayMedium)
                }
                .padding(.horizontal, 30)
                
                ZStack {
                    CustomCircleView()
                    
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.default, value: imageNumber)
                }
                
                Button {
                    randomImage()
                } label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.colorGreenLight, .colorGreenMedium],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
                }
                .buttonStyle(GradientButton())
            }
        }
        .frame(width: 320, height: 570)
    }
}

#Preview {
    CardView()
}
