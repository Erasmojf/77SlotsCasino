//
//  SlotMachineGame.swift
//  77SlotsCasino
//
//  Created by Erasmo  on 27/09/24.
//

import Foundation
import SwiftUI
import AVFoundation

class SlotMachineViewModel: ObservableObject {
    @Published var credits: Int = 100
    @Published var result: [String] = ["🍒", "🍋", "🍊"]
    private var slotMachine: SlotMachineModel
    private var audioPlayer: AVAudioPlayer?
    
    init() {
        slotMachine = SlotMachineModel(symbols: ["🍒", "🍋", "🍊", "🍉", "⭐️"])
    }
    
    func spin() {
        if credits > 0 {
            credits -= 1
            result = slotMachine.spin()
            if slotMachine.isWin(result: result) {
                credits += 10
                playWinSound()
            }
        }
    }
    
    private func playWinSound() {
        guard let url = Bundle.main.url(forResource: "win", withExtension: "mp3") else { return }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Erro ao tocar som: \(error)")
        }
    }
}
