//
//  ChatMessage.swift
//  SwiftUIByExample
//
//  Created by Siya Dagwar on 14/06/22.
//

import Foundation
import UIKit

struct ChatMessage: Identifiable, Equatable, Codable {
  var id = UUID()
  let displayName: String
  let body: String
  var time = Date()

  var isUser: Bool {
    return displayName == UIDevice.current.name
  }
}
