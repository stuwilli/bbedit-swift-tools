//
//  main.swift
//  bbedit-url-encode
//
//  Created by Stu Williams on 29/06/23.
//

import Foundation

let allowedCharacters = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-._~")


public func urlEnc(input: String) -> String {
    return input.addingPercentEncoding(withAllowedCharacters: allowedCharacters) ?? input
}

public func urlDec(input: String) -> String {
    return input.removingPercentEncoding ?? input
}

public func base64EncodeString(input: String) -> String {
    guard let data = input.data(using: .utf8) else {
        return input
    }
    
    let base64String = data.base64EncodedString()
    return base64String
}

public func base64DecodeString(input: String) -> String {
    guard let data = Data(base64Encoded: input) else {
        return input
    }
    
    return String(data: data, encoding: .utf8) ?? input
}

//while let input = readLine(strippingNewline: true) {
//    print(base64EncodeString(input: input))
//}

