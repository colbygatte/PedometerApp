//: Playground - noun: a place where people can play

import UIKit

let date = Date()

let df = DateFormatter()

df.dateFormat = "MM/dd/yy"

df.string(from: date)