//
//  String+.swift
//  Leetcode
//
//  Created by Tomonao Hashiguchi on 2022-10-30.
//

import Foundation


extension String {

	var length: Int {
		return count
	}

	subscript (i: Int) -> String {
		return self[i ..< i + 1]
	}

	func substring(fromIndex: Int) -> String {
		return self[min(fromIndex, length) ..< length]
	}

	func substring(toIndex: Int) -> String {
		return self[0 ..< max(0, toIndex)]
	}
	
	func substring(startAt: Int, length: Int) -> String {
		let start = index(startIndex, offsetBy: startAt)
		let end = index(start, offsetBy: length)
		return String(self[start..<end])
	}

	subscript (r: Range<Int>) -> String {
		let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
											upper: min(length, max(0, r.upperBound))))
		let start = index(startIndex, offsetBy: range.lowerBound)
		let end = index(start, offsetBy: range.upperBound - range.lowerBound)
		return String(self[start ..< end])
	}
}
