//
//  RMCharacter.swift
//  RickAndMorty
//
//  Created by Joowon Jang on 5/9/24.
//

import Foundation

struct RMCharacter: Codable {
    let id: Int
    let name: String
    let status: RMCharacterStatus
    let species: String
    let type: String
    let gender: RMCharacterGender
    let origin: RMOrigin
    let location: RMSingleLocation
        //file type of object here, so created a new model(type) file for this
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

