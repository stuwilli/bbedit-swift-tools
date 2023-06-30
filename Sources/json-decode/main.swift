//
// Created by Stu Williams on 30/06/23.
//

import Foundation

func decodeJson(_ input: String) -> String {
    // Convert the JSON string to Data
    guard let jsonData = jsonString.data(using: .utf8) else {
        print("Invalid JSON string")
        return
    }

    do {
        // Decode the JSON data using JSONSerialization
        let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: [])

        if let urlStr = jsonObject as? String,
           let url = URL(string: urlStr) {
            // Use the decoded URL
            return url
        }
    } catch {
        print("JSON decoding error: \(error.localizedDescription)")
    }
}