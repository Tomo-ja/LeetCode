//
//  longestSubStrings.swift
//  Leetcode
//
//  Created by Tomonao Hashiguchi on 2022-10-29.
//

import Foundation

//Given a string s, find the length of the longest substring without repeating characters.
//Input: s = "abcabcbb"
//Output: 3
//Explanation: The answer is "abc", with the length of 3.


func lengthOfLongestSubstring(_ s: String) -> Int {
	
	var dict = [Character: Int]()
	var leftIdx = 0
	var maxLength = 0
	
	for (rightIdx, letter) in s.enumerated() {
		if dict[letter] == nil ||  dict[letter]! < leftIdx {
			maxLength = max(maxLength, rightIdx - leftIdx + 1)
		} else {
			leftIdx = dict[letter]! + 1
		}
		dict[letter] = rightIdx
	}
	
	return maxLength
}
