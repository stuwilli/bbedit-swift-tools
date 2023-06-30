//
//  main.swift
//  bbedit-url-encode
//
//  Created by Stu Williams on 29/06/23.
//

import Foundation
import bbedit_swift_tools
while let input = readLine(strippingNewline: true) {

    print(base64EncodeString(input: input), terminator: "")
}
