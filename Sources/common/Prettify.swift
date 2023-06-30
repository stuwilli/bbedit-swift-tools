//
// Created by Stu Williams on 30/06/23.
//

import Foundation

public func prettifyXML(_ xml: String) -> String {
    let data = xml.data(using: .utf8)!
    let options: XMLNode.Options = [.nodePrettyPrint, .documentTidyHTML]

    do {
        let xmlDoc = try XMLDocument(data: data, options: options)
        return xmlDoc.xmlString
    } catch {
        print("Error prettifying XML:", error)
    }

    return xml
}

public func prettifyJavaScript(_ js: String) -> String {
    guard let jsData = js.data(using: .utf8) else {
        return js
    }

    guard let jsAST = try? JSONSerialization.jsonObject(with: jsData, options: []) as? [String: Any] else {
        return js
    }

//    let prettyOptions: [String: Any] = [
//        "indent_size": 2,
//        "indent_char": " ",
//        "preserve_newlines": false,
//        "brace_style": "collapse",
//        "wrap_line_length": 0,
//        "end_with_newline": true
//    ]

    guard let prettyData = try? JSONSerialization.data(withJSONObject: jsAST, options: [.prettyPrinted]),
          let prettyString = String(data: prettyData, encoding: .utf8)
    else {
        return js
    }

    return prettyString
}


public func prettifyJSON(_ json: String) -> String {
    guard let jsonData = json.data(using: .utf8) else {
        return json
    }

    do {
        let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: [])
        let prettyData = try JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted])
        if let prettyString = String(data: prettyData, encoding: .utf8) {
            return prettyString
        }
    } catch {
        print("Error prettifying JSON:", error)
    }

    return json
}

public func prettifyInput(_ input: String) -> String {
    if let trimmedInput = Optional(input.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()) {
        if trimmedInput.hasPrefix("<?xml") || trimmedInput.hasPrefix("<!doctype") {
            return prettifyXML(input)
        } else if trimmedInput.hasSuffix(";") || trimmedInput.hasPrefix("function") {
            return prettifyJavaScript(input)
        } else if trimmedInput.hasPrefix("{") || trimmedInput.hasPrefix("[") {
            return prettifyJSON(input)
        }
    }

    return input
}