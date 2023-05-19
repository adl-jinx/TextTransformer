//
//  ZalgoCharacter.swift
//  TextTransformer
//
//  Created by Antonio De Luca on 19/05/23.
//

import Foundation


struct ZalgoCharacter: Codable {
    let above: [String]
    let inline: [String]
    let below: [String]
    
    init () {
        let url = Bundle.main.url(forResource: "zalgo", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        
        let decoder = JSONDecoder()
        self = try! decoder.decode(ZalgoCharacter.self, from: data)
    }
    
}
