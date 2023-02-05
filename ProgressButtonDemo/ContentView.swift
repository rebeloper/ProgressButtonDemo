//
//  ContentView.swift
//  ProgressButtonDemo
//
//  Created by Alex Nagy on 05.02.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ProgressButton(direction: .right, clipShape: RoundedRectangle(cornerRadius: 15, style: .continuous)) { done in
                Service.doSomeWork(progressValue: .constant(0), completion: done)
            } progressState: { isInProgress in
                print(isInProgress)
            } label: {
                Label("Beyond Code", systemImage: "house")
                    .padding(.horizontal, 32)
                    .padding(.vertical, 12)
                    .foregroundColor(.white)
            } progress: {
                ProgressView()
                    .tint(.white)
            } background: {
                Color.orange
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
