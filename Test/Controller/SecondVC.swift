//
//  ViewController.swift
//  Test
//
//  Created by Kunal's MacBook on 09/11/21.
//

import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() {
        self.val = 0
        self.next = nil
    }
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    public init(_ val: Int, _ next: ListNode?){
        self.val = val;
        self.next = next
    }
}


protocol getDataDelegateProtocol{
    func getData(tempStr: String)
}

class SecondVC: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    static var delegate: getDataDelegateProtocol?

    let nums = [3,3]
    let target = 6
    var str = "abcabcbb"
    
    //var l1: ListNode = [2,4,3]
    //var l2: ListNode = [5,6,4]
    override func viewDidLoad() {
        super.viewDidLoad()
        // addTwoNumbers(l1, l2)
        //print(twoSum(nums, target))
        //print(longestPalindrome(str))
        print(lengthOfLongestSubstring(str))
        let alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
        
        //The number of letters in alphabet equals 26
        
        let password = alphabet.randomElement()! + alphabet.randomElement()! + alphabet.randomElement()! + alphabet.randomElement()! + alphabet.randomElement()! + alphabet.randomElement()!
        
        print(password)
    }
    
    
    @IBAction func buttonClick(_ sender: UIButton){
        SecondVC.delegate?.getData(tempStr: "Received data from SecondVC")
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - length of Longest substring
    func lengthOfLongestSubstring(_ s: String) -> Int {
        if s.count == 0{
            return 0
        }else if s.count == 1{
            return 1
        }
        var maxLength = 0
        var temp = [Character]()
        let charArray = Array(s)
        temp.append(charArray[0])
        
        for i in 1...charArray.count-1{
            if let index = temp.firstIndex(of: charArray[i]){
                temp.removeFirst(index+1)
            }
            temp.append(charArray[i])
            maxLength = max(maxLength, temp.count)

        }
        return maxLength
    }
    
    //MARK: - Longest Palindrome
        func longestPalindrome(_ s: String) -> String {
            guard s.count != 0 else{
                return ""
            }
            var myArray = Array(repeating: Array(repeating: false, count: s.count), count: s.count)
            let str = s.map{String($0)}
            var left = 0
            var right = 0
            var longest = (0,0)
            
            for i in 0..<str.count{
                for j in i..<str.count{
                    left = j - i
                    right = j
                    
                    if i == 0{
                        myArray[left][right] = true
                        continue
                    }
                    
                    if str[left] == str[right] && (myArray[left+1][right-1] || left == right-1){
                        myArray[left][right] = true
                        longest = (left,right)
                    }
                }
            }
            return str[longest.0 ... longest.1].joined(separator: "")
        }
    
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
       return l2
    }
    
    
    
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
       for i in 0..<nums.count{
           for j in i+1..<nums.count{
               if nums[i]+nums[j] == target{
                   return [i,j]
               }
           }
       }
        return []
    }


}





