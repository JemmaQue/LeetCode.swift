import UIKit

class Solution {
    func lengthWithoutRepeat(_ s: String) -> Int {
        var a = String()
        var b = 0
        for c in Array(s) {
            if a.contains(c) {
                b = max(b, a.count)
                a = stringWithoutRepeat(a,c)
            } else {
                a = a + String(c)
            }
        }
        return max(b, a.count)
    }
    
    func substringsWithoutRepeat(_ s: String) -> [String] {
        var a = String()
        var b = [String]()
        for c in Array(s) {
            if a.contains(c) {
                b.append(a)
                a = stringWithoutRepeat(a,c)
            } else {
                a = a + String(c)
            }
        }
        b.append(a)
        return Array(b).sorted(by: {$0.count > $1.count})
    }
    
    func stringWithoutRepeat(_ s:String,_ c: Character) -> String {
        for (i,a) in Array(s).enumerated() {
            if (a == c) {
                return i < s.count ? String(s.suffix(s.count-i-1))+String(c) : String(c)
            }
        }
        return String()
    }
    
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var dict = [Character:Int]()
        var repeatIndex = -1
        var maxLen = 0
        for (i,c) in Array(s).enumerated() {
            if let index = dict[c], index > repeatIndex {
                repeatIndex = index
            }
            dict[c] = i
            maxLen = max(maxLen,i-repeatIndex)
        }
        return maxLen
        
    }
}

//Solution().substringsWithoutRepeat("pwwkew")
//Solution().substringsWithoutRepeat("abcabcbb")
//Solution().substringsWithoutRepeat("au")
//Solution().substringsWithoutRepeat("bbbbb")
//Solution().substringsWithoutRepeat("aab")
//Solution().substringsWithoutRepeat("abcdefg")
//Solution().substringsWithoutRepeat("ohvhjdml")
//Solution().substringsWithoutRepeat("vqblqcb")

//Solution().lengthOfLongestSubstring("pwwkew")
//Solution().lengthOfLongestSubstring("abcabcbb")
//Solution().lengthOfLongestSubstring("au")
//Solution().lengthOfLongestSubstring("bbbbb")
//Solution().lengthOfLongestSubstring("aab")
//Solution().lengthOfLongestSubstring("abcdefg")
//Solution().lengthOfLongestSubstring("ohvhjdml")
Solution().lengthOfLongestSubstring("")
Solution().lengthOfLongestSubstring("vqblqcb")
Solution().lengthOfLongestSubstring("abba")
