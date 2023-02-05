//
//  DemoView.swift
//  ProgressButtonDemo
//
//  Created by Alex Nagy on 05.02.2023.
//

import SwiftUI

struct DemoView: View {
    
    @State private var isInProgress = false
    @State private var progressValue: Float = 0.0
    
    var body: some View {
        ScrollView {
            ProgressButton(direction: .left, clipShape: RoundedRectangle(cornerRadius: 12, style: .continuous)) { done in
                Service.doSomeWork(progressValue: $progressValue, completion: done)
            } progressState: { isInProgress in
                self.isInProgress = isInProgress
            } label: {
                Label("Undo", systemImage: "arrow.uturn.backward.circle.fill")
                    .foregroundColor(.white)
                    .padding(.vertical, 6)
                    .padding(.horizontal, 38)
            } progress: {
                ProgressView()
                    .tint(Color.white)
#if os(macOS)
                    .scaleEffect(0.5)
#endif
            } background: {
                Color.orange
            }
            .disabled(isInProgress)
            
            ProgressButton(direction: .right, clipShape: RoundedRectangle(cornerRadius: 4, style: .continuous)) { done in
                Service.doSomeWork(progressValue: $progressValue, completion: done)
            } progressState: { isInProgress in
                self.isInProgress = isInProgress
            } label: {
                HStack {
                    Text("Next")
                    Image(systemName: "arrow.right")
                }
                .foregroundColor(.white)
                .padding(.vertical, 6)
                .padding(.horizontal, 38)
            } progress: {
                Label("Saving...", systemImage: "opticaldiscdrive")
                    .foregroundColor(.white)
            } background: {
                LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .leading, endPoint: .trailing)
            }
            .disabled(isInProgress)
            
            ProgressButton(direction: .up, clipShape: Capsule(style: .continuous)) { done in
                Service.doSomeWork(progressValue: $progressValue, completion: done)
            } progressState: { isInProgress in
                self.isInProgress = isInProgress
            } label: {
                Label("Upload", systemImage: "icloud.and.arrow.up.fill")
                    .foregroundColor(.white)
                    .padding(.vertical, 16)
                    .padding(.horizontal, 38)
            } progress: {
                VStack {
                    ProgressView()
                        .tint(Color.white)
#if os(macOS)
                        .scaleEffect(0.5)
#endif
                    Text("Uploading...")
                        .foregroundColor(.white)
                        .font(.caption)
                        .bold()
                }
                .padding(.horizontal)
            } background: {
                Color.blue
            }
            .disabled(isInProgress)
            
            ProgressButton(direction: .down, clipShape: Rectangle()) { done in
                Service.doSomeWork(progressValue: $progressValue, completion: done)
            } progressState: { isInProgress in
                self.isInProgress = isInProgress
            } label: {
                Label("Download", systemImage: "square.and.arrow.down")
                    .foregroundColor(.white)
                    .padding(.vertical, 16)
                    .padding(.horizontal, 38)
            } progress: {
                VStack(spacing: 4) {
                    ProgressView(value: progressValue, label: {
                        Text("Downloading...")
                    }, currentValueLabel: {
                        Text("\(progressValue, specifier: "%.2f") / 1.00")
                    })
                    .tint(Color.white)
                    .progressViewStyle(.linear)
                    .foregroundColor(.white)
                    .font(.caption)
                    .bold()
                }
                .padding(.horizontal)
                .frame(width: 160)
            } background: {
                Color.green
            }
            .disabled(isInProgress)
        }
    }
}

