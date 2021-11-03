
import UIKit

// Using Swift, complete the stripDuplicates() function in the box below to return an array containing only one instance of each unique value. The resulting array does not have to be ordered.

let stringArray = ["Alpha", "Beta", "Charlie", "Beta", "Charlie"]


// SOLUTION 1:
func stringDuplicatesOne(_ array: [String]) -> [String] {
    let set = NSOrderedSet(array: array)
    
    return Array(set) as! Array<String>
}

print(stringDuplicatesOne(stringArray))


// SOLUTION 2:
func stringDuplicatesTwo(_ array: [String]) -> [String] {
    let array = stringArray.map { String($0) }
    let set = NSOrderedSet(array: array)
    let strings = Array(set) as! Array<String>
    
    return strings
}

print(stringDuplicatesTwo(stringArray))


// SOLUTION 3:
func stringDuplicatesThree(_ array: [String]) -> [String] {
    var dictionary = [String:Bool]()
    let strings = array.filter {
        dictionary.updateValue(true, forKey: $0) == nil
    }
    
    return strings
}

print(stringDuplicatesThree(stringArray))


// SOLUTION 4:
func stringDuplicatesFour(_ array: [String]) -> [String] {
    var myArray = [String]()
    
    for string in array {
        if !myArray.contains(string) {
            myArray.append(string)
        }
    }
    
    return myArray
}

print(stringDuplicatesFour(stringArray))
