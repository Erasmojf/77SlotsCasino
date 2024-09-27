//
//  SlotMachineModel.swift
//  77SlotsCasino
//
//  Created by Erasmo  on 27/09/24.
//

import Foundation

struct SlotMachineModel {
    let symbols: [String]
    
    func spin() -> [String] {
        return (0..<3).map { _ in symbols.randomElement()! }
    }
    
    func isWin(result: [String]) -> Bool {
        return Set(result).count == 1 // Ganha se todos os símbolos forem iguais
    }
}

