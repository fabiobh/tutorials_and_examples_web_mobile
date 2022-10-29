//
//  HttpPostClient.swift
//  Data
//
//  Created by fabiocunha on 25/09/22.
//

import Foundation

public protocol HttpPostClient {
    func post(to url: URL, with data: Data?, completion: @escaping (Result<Data?, HttpError>) -> Void)
}
