
import UIKit

//Consider the following code in a ViewController:
private weak var textLabel: UILabel!

var amount: Double? {
    didSet {
        //reload()
        newReload()
    }
}

//func reload() {
//    if amount! > 0 {
//        textLabel.text = "Earned £ \(amount)"
//    } else {
//        textLabel.text = "Did not earn"
//    }
//}

//Under what condition(s) could the reload() function crash your application? Show us how you would modify the code (in the box on the next page) to avoid this and explain your answer.


// ANSWER AND SOLUTION: reload() function will crash if "amount" value will be found nil because of his force unwrapping instance "amount!". Instead we can use a guard statement as following:

func newReload() {
    guard let amount = amount else {
        return
    }
    if amount > 0 {
        textLabel.text = "Earned £ \(amount)"
    } else {
        textLabel.text = "Did not earn"
    }
}

