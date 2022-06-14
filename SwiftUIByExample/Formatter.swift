//
//  Formatter.swift
//  SwiftUIByExample
//
//  Created by Siya Dagwar on 14/06/22.
//

import Foundation

extension DateFormatter {
  static var dueDateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .none
    return formatter
  }()

  static var timestampFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .none
    formatter.timeStyle = .short
    return formatter
  }()
}
