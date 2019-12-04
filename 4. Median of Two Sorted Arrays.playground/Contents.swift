import UIKit

class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let len = nums1.count + nums2.count
        var right = 0
        var left = 0
        var index1 = 0
        var index2 = 0

        for _ in 0 ... len/2 {
            left = right
            if firstAHead(nums1, nums2, index1, index2) {
                right = nums1[index1]
                index1 += 1
            } else {
                right = nums2[index2]
                index2 += 1
            }

            print("(index1:index2)=(",index1,",",index2,")")
            print("(left:right)=(",left,",",right,")")
        }
        return len % 2 == 0 ? Double(left+right)/2.0 : Double(right)
    }
    
    func firstAHead( _ nums1: [Int], _ nums2: [Int], _ index1: Int, _ index2: Int) -> Bool {
        guard index1 < nums1.count else {
            return false
        }
        
        guard index2 < nums2.count else {
            return true
        }
        
        if (nums1[index1] < nums2[index2]) {
            return true
        }
        
        return false
    }
}

print(Solution().findMedianSortedArrays([1,3], [2]))
print(Solution().findMedianSortedArrays([1,3], [2,4]))
