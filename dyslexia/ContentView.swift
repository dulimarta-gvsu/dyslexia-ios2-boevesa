//
//  ContentView.swift
//  dyslexia

import SwiftUI
import Combine

struct ContentView: View {
    init(viewModel: AppViewModel) {
        self._viewModel = ObservedObject(wrappedValue: viewModel)
    }
    @ObservedObject private var viewModel: AppViewModel
    @State private var letters: [Letter] = []
    
    var body: some View {
        VStack {
            Button("New") {
                viewModel.startNewGame()
            }.buttonStyle(.borderedProminent)
            Spacer()
            LetterGroup(letters: $letters) { arr in
                let z = arr.prettyPrint()
                print("Rearrange \(z)")
                viewModel.rearrange(to: arr)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background(.yellow)
        .onReceive(viewModel.$letters) { newValue in
            print("New word in content view")
            letters = newValue
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: AppViewModel())
    }
}
#endif

