//
//  HttpError.swift
//  Data
//
//  Created by fabiocunha on 25/09/22.
//

import Foundation


public enum HttpError: Error {
    case noConnectivity
    case badRequest
    case serverError
    case unathorized
    case forbidden
}
