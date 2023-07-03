//
// Created by Stu Williams on 3/07/23.
//

import Foundation
import TabularData
import SwiftCSV


func createDataFrame(from csvString: String) {
    do {
        let csv = try CSV<Named>(string: csvString, delimiter: "\n")

        let data = csv.dataUsingEncoding(.utf8)
        if let csvData = data {
            let df = try DataFrame(csvData: csvData)
            print(df.description(options: .init(maximumLineWidth: 200, maximumRowCount: 10000)))
        } else {
            print("Failed to convert CSV string to data")
        }
    } catch {
        // Catch errors from trying to load files
        print(csvString, terminator: "")
    }
}


//while let input = readLine(strippingNewline: false) {
//
//    createDataFrame(from: input)
//}
// Read all input from stdin
if let inputString = String(data: FileHandle.standardInput.availableData, encoding: .utf8) {
    createDataFrame(from: inputString)
} else {
    print("Failed to read input from stdin")
}
