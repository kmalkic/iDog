//
//  APIRequest.swift
//  iDog
//
//  Created by Kevin Malkic on 03/09/2024.
//

import Foundation

protocol APIRequest {
    
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var body: Data? { get }
    var customHeaderFields: [String: String]? { get }
    var urlRequest: URLRequest? { get }
}

extension APIRequest {
    
    var urlRequest: URLRequest? {
        let url = baseURL.appendingPathComponent(path)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = customHeaderFields
        urlRequest.httpBody = body
        return urlRequest
    }
    
    var body: Data? {
        nil
    }
    
    var customHeaderFields: [String : String]? {
        nil
    }
}
