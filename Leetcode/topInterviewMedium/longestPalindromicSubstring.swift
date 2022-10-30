//
//  longestPalindromicSubstring.swift
//  Leetcode
//
//  Created by Tomonao Hashiguchi on 2022-10-30.
//

import Foundation

func longestPalindrome(_ s: String) -> String {
	
	let length = s.count
	let arr = Array(s)
	
	var left = 0
	var right = 0
	var map = Array(repeating: Array(repeating: false, count: length), count: length)
	
	for i in 1..<length {
		for j in 0..<i where arr[j] == arr[i] && (map[j+1][i-1] || i - j <= 2) {
			map[j][i] = true
			if i - j > right - left {
				left = j
				right = i
			}
		}
	}
	return String(arr[left...right])
}
