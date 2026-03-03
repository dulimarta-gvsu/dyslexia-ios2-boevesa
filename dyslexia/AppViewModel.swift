//
//  AppViewModel.swift
//  dyslexia

import Foundation
import Combine

class AppViewModel: ObservableObject {
    @Published var letters: [Letter] = []
    
    private let vocabulary: Set<String> = ["mars", "jupiter", "pluto", "uranus", "venus"]
    private var secretWord: String = ""
    
    init () {
        self.startNewGame()
    }
    
    func startNewGame() {
        self.secretWord = vocabulary.randomElement()!.uppercased()
        self.letters.removeAll()
        self.letters.append(contentsOf: self.secretWord
            .uppercased()
            .map { Letter(text:String($0),point:1) }
            .shuffled())
    }
    
    func rearrange(to: Array<Letter>) {
        self.letters = to
    }
}
