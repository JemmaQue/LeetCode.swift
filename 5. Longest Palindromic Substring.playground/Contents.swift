/*
 5. Longest Palindromic Substring
 Medium
 
 Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.
 
 Example 1:
 
 Input: "babad"
 Output: "bab"
 Note: "aba" is also a valid answer.
 
 Example 2:
 
 Input: "cbbd"
 Output: "bb"

 */

class Solution {
    var center = 0
    var rightMax = 0
    var dict = [Int:Int]()
    var shashtag = [Character]()
    
    private func initialize() {
        center = 0
        rightMax = 0
        dict = [Int:Int]()
        shashtag = [Character]()
    }
    
    private func getRadius(_ i: Int) -> Int {
        var radius = rightMax > i ? min(dict[2*center-i] ?? 1,rightMax-i): 1
        while(shashtag[i+radius] == shashtag[i-radius]){
            radius += 1
        }
        return radius
    }
    
    private func buildHashtagString(_ s: String) -> [Character] {
        var hashtag = [Character]()
        hashtag.append("$")
        hashtag.append("#")
        for c in Array(s) {
            hashtag.append(c)
            hashtag.append("#")
        }
        hashtag.append("%")
        return hashtag
    }
    
    func Manacher(_ s: String) -> String {
        shashtag = buildHashtagString(s)
        for i in 2 ..< shashtag.count-1 {
            let radius = getRadius(i)
            dict[i] = radius
            if (radius > rightMax - center) {
                rightMax = radius+i
                center = i
                //print(i,": rightMax= ",rightMax," center= ",center,": radius= ",radius)
            }
        }
        return String(String(s.prefix(rightMax/2-1)).suffix(dict[center]!-1))
    }
    
    func longestPalindrome(_ s: String) -> String {
        guard s.count > 1 else {
            return s
        }
        initialize()
        return Manacher(s)
    }
}

print("abccba: ",Solution().longestPalindrome("abccba"))
print("abbad: ",Solution().longestPalindrome("abbad"))
print("babad: ",Solution().longestPalindrome("babad"))
print("cbbd: ",Solution().longestPalindrome("cbbd"))
print(" : ",Solution().longestPalindrome(""))
