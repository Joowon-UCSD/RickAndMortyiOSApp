//
//  RMEndpoint.swift
//  RickAndMorty
//
//  Created by Joowon Jang on 5/10/24.
//

import Foundation

/// Represents unique API endpoint
@frozen enum RMEndpoint: String {
    /// Endpoint to get character info
    case character // will spit out "character" as a string
    /// Endpoint to get location info
    case location
    /// Endpoint to get episode info
    case episode
}
