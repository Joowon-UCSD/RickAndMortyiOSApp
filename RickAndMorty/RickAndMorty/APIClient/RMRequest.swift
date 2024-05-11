//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Joowon Jang on 5/10/24.
//

import Foundation

/// Object that represents a singlet API call
final class RMRequest {
    /// API constants
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    /// Desired endpoint
    private let endpoint: RMEndpoint
    
    /// Path components for API, if any
    private let pathComponenets: Set<String>
    
    /// Query arguments for API, if any
    private let queryParameters: [URLQueryItem]
    
    /// Constructive url for the api request in string format
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponenets.isEmpty {
            pathComponenets.forEach({
                string += "/\($0)"
            })
        }
        
        if !queryParameters.isEmpty {
            string += "?"
            // name=value&name=value
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else {return nil}
                return "/\($0.name)=\(value)"
                // $0 represents the current item in the iteration
            }).joined(separator: "&")
            
            string += argumentString
        }
        
        return string
    }
    
    /// Computed & constructed API url
    public var url: URL? {
        return URL(string: urlString)
    }
    
    /// Desired http method
    public let httpMethod = "GET"
    
    // MARK: - Public
    
    /// Construct request
    /// - Parameters:
    ///   - endpoint: Target endpoint
    ///   - pathComponents: Collection of Path componenets
    ///   - queryParameters: Collection of query parameters
    public init(endpoint: RMEndpoint,
         pathComponents: Set<String> = [],
         queryParameters: [URLQueryItem] = []
    ) {
        self.endpoint = endpoint
        self.pathComponenets = pathComponents
        self.queryParameters = queryParameters
    }
}
