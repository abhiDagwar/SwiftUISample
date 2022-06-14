//
//  Passcode.swift
//  SwiftUIByExample
//
//  Created by Siya Dagwar on 14/06/22.
//

import Foundation

class Passcode: NSObject {
    func generate() -> String {
        return String("\(Int.random(in: 0...9))\(Int.random(in: 0...9))\(Int.random(in: 0...9))\(Int.random(in: 0...9))")
    }
}
