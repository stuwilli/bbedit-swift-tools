//
//  main.swift
//  bbedit-tidy
//
//  Created by Stu Williams on 29/06/23.
//

import Foundation
import bbedit_swift_tools



while let input = readLine() {
    let prettifiedInput = prettifyInput(input)
    print(prettifiedInput, terminator: "")
}


