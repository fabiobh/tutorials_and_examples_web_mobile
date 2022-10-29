//
//  Restaurant.swift
//  RxSwiftMvvmTutorial
//
//  Created by fabiocunha on 09/08/22.
//

struct Restaurant: Decodable {
    let name:String
    let cuisine:Cuisine
}

enum Cuisine: String, Decodable {
    case european
    case english
    case mexican
    case french
    case indian
}
