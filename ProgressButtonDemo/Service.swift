//
//  Service.swift
//  ProgressButtonDemo
//
//  Created by Alex Nagy on 05.02.2023.
//

import SwiftUI

struct Service {
    static func doSomeWork(progressValue: Binding<Float>, completion: @escaping () -> ()) {
        progressValue.wrappedValue = 0.0
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            progressValue.wrappedValue = 0.15
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.75, execute: {
            progressValue.wrappedValue = 0.25
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.25, execute: {
            progressValue.wrappedValue = 0.40
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
            progressValue.wrappedValue = 0.70
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.6, execute: {
            progressValue.wrappedValue = 0.90
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.7, execute: {
            withAnimation {
                progressValue.wrappedValue = 1.0
            }
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
            completion()
        })
    }
}
