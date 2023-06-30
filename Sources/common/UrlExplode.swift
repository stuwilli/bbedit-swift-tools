//
// Created by Stu Williams on 30/06/23.
//

import Foundation

public func explodeURL(_ urlString: String) {
    guard let url = URL(string: urlString) else {
        print("Invalid URL:", urlString)
        return
    }

    let scheme = url.scheme ?? ""
    let host = url.host ?? ""
    let path = url.path

    if scheme.isEmpty || host.isEmpty || path.isEmpty {
        print("Missing components in URL:", urlString)
        return
    }

    print("Scheme:", scheme)
    print("Host:", host)
    print("Path:", path)

    let queryItems = URLComponents(url: url, resolvingAgainstBaseURL: false)?.queryItems

    if let queryItems = queryItems {
        var queryParams: [String: [String]] = [:]
        var custParams: [String] = []

        for item in queryItems {
            if item.name == "cust_params" {
                if let decodedValue = item.value?.removingPercentEncoding {
                    let custParamsArray = decodedValue.components(separatedBy: "&")
                    custParams.append(contentsOf: custParamsArray)
                }
            } else {
                if let value = item.value {
                    queryParams[item.name, default: []].append(value)
                }
            }
        }

        print("Query:")
        for (key, values) in queryParams {
            for value in values {
                print("\t\(key) = \(value)")
            }
        }

        if !custParams.isEmpty {
            print("cust_params:")
            for param in custParams {
                print("\t\(param)")
            }
        }
    }

    print()
}