//
//  SlotMachineView.swift
//  77SlotsCasino
//
//  Created by Erasmo  on 27/09/24.
//

import SwiftUI

struct SlotMachineView: View {
    @StateObject private var viewModel = SlotMachineViewModel()
    @State private var showWinAnimation = false
    
    var body: some View {
        ZStack {
            Image("slotMachineBackground") // Imagem de fundo
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Slot Machine Game")
                    .font(.largeTitle)
                   .foregroundColor(.white)
                   .background(.green)
                   .padding()
                Text("Credits: \(viewModel.credits)")
                    .font(.title)
                    .foregroundColor(.white)
                    .background(.green)
                    .padding(.bottom, 50)

                HStack {
                    ForEach(viewModel.result, id: \.self) { symbol in
                        Text(symbol)
                            .animation(.default)
                            .font(.system(size: 80))
                            .padding()
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(10)
                    }
                    Spacer()
                }
                //.padding()
                
                Button(action: {
                    viewModel.spin()
                }) {
                    Text("Spin")
                        .font(.title)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                }
                .padding(.top, 50)
                if showWinAnimation {
                    Text("You Win!")
                        .font(.largeTitle)
                        .foregroundColor(.yellow)
                        .background(.green)
                        .transition(.scale)
                        .animation(.easeIn)
                }
            }
        }
    }
}

struct SlotMachineView_Previews: PreviewProvider {
    static var previews: some View {
        SlotMachineView()
    }
}
