//
//  add2Number.swift
//  Leetcode
//
//  Created by Tomonao Hashiguchi on 2022-10-29.
//

import Foundation

//You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.
//
//You may assume the two numbers do not contain any leading zero, except the number 0 itself.

//Input: l1 = [2,4,3], l2 = [5,6,4]
//Output: [7,0,8]
//Explanation: 342 + 465 = 807.

func add2Number (_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {

	guard var l1 = l1 else { return l2 }
	guard var l2 = l2 else { return l1 }
	
	var arrL1 = [l1.val]
	var arrL2 = [l2.val]
	
	while let next = l1.next {
		arrL1.append(next.val)
		l1 = next
	}
	
	while let next = l2.next {
		arrL2.append(next.val)
		l2 = next
	}
	
	let longerLength = arrL1.count > arrL2.count ? arrL1.count : arrL2.count
	var answer: [Int] = []
	var over10 = 0

	for i in 0..<longerLength {
		let temp: Int = (arrL1.indices.contains(i) ? arrL1[i] : 0) + (arrL2.indices.contains(i) ? arrL2[i] : 0) + over10
		over10 = temp > 9 ? 1 : 0
		answer.append(over10 != 0 ? temp - 10 : temp)
	}
	if (over10 != 0){
		answer.append(1)
	}
	
	var max = answer.count - 1
	var list = ListNode(answer[max])
	max -= 1
	
	while max >= 0 {
		let next = ListNode(answer[max], list)
		max -= 1
		list = next
	}
	
	return list
}
