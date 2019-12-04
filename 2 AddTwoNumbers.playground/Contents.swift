import UIKit

var str = "Hello, playground"

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func getVal(_ theNode: ListNode?) -> Int {
        guard let node = theNode else {
            return 0
        }
        return node.val
    }
    
    func getNext(_ theNode: ListNode?) -> ListNode? {
        guard let node = theNode else {
            return nil
        }
        return node.next
    }
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if (l1 == nil && l2 == nil) {
            return nil
        }
        var node1 = l1
        var node2 = l2
        
        let head = ListNode(0)
        var point = head
        var carry = 0
        
        while (node1 != nil || node2 != nil || carry != 0) {
            let sum = getVal(node1) + getVal(node2) + carry
            point.next = ListNode(sum%10)
            carry = sum/10
            node1 = getNext(node1)
            node2 = getNext(node2)
            point = point.next!
        }
        
        return head
    }
}

let l1 = ListNode(2)
l1.next = ListNode(4)
l1.next!.next = ListNode(3)
let l2 = ListNode(5)
l2.next = ListNode(6)
l2.next!.next = ListNode(4)
Solution().addTwoNumbers(l1, l2)
Solution().addTwoNumbers(nil, nil)
