//
//  AccountModelFactory.swift
//  DataTests
//
//  Created by fabiocunha on 07/10/22.
//

import Foundation
import Domain

func makeAccountModel() -> AccountModel {
    return AccountModel(id: "1", name: "any_name", email: "any_email", password: "any_password")
}
