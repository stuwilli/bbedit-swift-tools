//
// Created by Stu Williams on 30/06/23.
//

import Foundation


func urlUnescape(_ input: String) -> String {
    // Replace backslashes with slashes
    let unescapedString = input.replacingOccurrences(of: "\\/", with: "/")
    let finalString = unescapedString.trimmingCharacters(in: CharacterSet(charactersIn: "\"'"))

// Unescape the URL
    if let unescapedURLString = finalString.removingPercentEncoding,
       let unescapedURL = URL(string: unescapedURLString) {
        // Use the unescaped URL
        return unescapedURL.absoluteString
    } else {
        print("Invalid URL string")
    }
    return input
}



while let input = readLine() {
    print(urlUnescape(input), terminator: "")
}