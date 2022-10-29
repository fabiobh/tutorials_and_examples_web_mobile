//
//  Apollo.swift
//  GraphQlTutorial
//
//  Created by fabiocunha on 04/09/22.
//

import Foundation
import Apollo

class Network {
    static let shared = Network()
    lazy var apollo = ApolloClient(url: URL(string: "https://countries.trevorblades.com")!)
}
