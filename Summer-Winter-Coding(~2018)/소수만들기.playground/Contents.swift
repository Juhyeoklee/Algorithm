import Foundation

func solution(_ nums:[Int]) -> Int {
    var count = 0
    for i in 0..<nums.count {
        for j in (i+1)..<nums.count {
            for k in (j+1)..<nums.count {
                print(i, j, k)
                if isPrime(num: nums[i] + nums[j] + nums[k]){
                    count += 1
                }
            }
        }
    }
    
    
    return count
}

func isPrime(num: Int) -> Bool {
    print(num)
    if (num < 2) {
        return false
    }
        
    if (num == 2) {
        return true
    }

    var i = 2
    
    while (i < num){
        if (num % i == 0)
        {
            return false;
        }
        i += 1;
    }

    return true
}
[1,2,3,4]

solution([1,2,3,4])

isPrime(num: 18)
