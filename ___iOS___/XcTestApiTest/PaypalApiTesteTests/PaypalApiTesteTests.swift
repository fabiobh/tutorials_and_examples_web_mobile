//
//  PaypalApiTesteTests.swift
//  PaypalApiTesteTests
//
//  Created by Fabio Cunha on 19/04/24.
//

import XCTest
@testable import PaypalApiTeste

final class PaypalApiTesteTests: XCTestCase {

    let url = URL(string: "https://jsonplaceholder.typicode.com/posts")

    func testEndpointIsWorking() throws {
        
        let timeInSeconds = 30.0
        let expectation = XCTestExpectation(description: "Wait to get response from server")

        print("test testEndpointIsWorking started")
        let urlRequest = URLRequest(url: url!)
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                // Handle the error
                print("Error: \(error.localizedDescription)")
                XCTFail("Test Fail, wrong data or timeout")
            } else if let data = data {
                // Process the data
                print("Data received: \(data)")
                expectation.fulfill()
            }
        }
        task.resume()
        
        wait(for: [expectation], timeout: timeInSeconds)
        XCTAssertTrue(true)
    }
    
    func testEndpointDataToLog() throws {
        
        var dataString = ""
        let timeInSeconds = 30.0
        let expectation = XCTestExpectation(description: "Wait to get response from server")

        print("test testEndpointIsWorking started")
        let urlRequest = URLRequest(url: url!)
        let task = URLSession.shared.dataTask(with: urlRequest) { [weak self] data, response, error in
            if let error = error {
                XCTFail("Test Fail - Error: \(error.localizedDescription)")
            } else if let data = data {                
                //print("Data received: \(data)") // Process the data
                do {
                    let allData = try JSONDecoder().decode([JsonPlaceHolderModel].self, from: data)
                    //print("valueData v0: \(allData)")
                    for item in allData {
                        print("item v0: \(item)")
                        dataString = dataString + ("\(item.id) - \(item.title) - \(item.body)\n")
                    }
                    self?.writeToFile(dataString)
                    expectation.fulfill()
                } catch {
                    XCTFail("decode error for valueData: \(error)")
                }
                
            } else {
                XCTFail("unknonw error")
            }
        }
        task.resume()
        
        wait(for: [expectation], timeout: timeInSeconds)
        XCTAssertTrue(true)
    }
        
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print("document path: \(paths[0])")
        return paths[0]
    }
    
    func writeToFile(_ str: String) {
        let filename: URL = getDocumentsDirectory().appendingPathComponent("log.txt")
        do {
            try str.write(to: filename, atomically: false, encoding: String.Encoding.utf8)
        } catch {
            XCTFail("test failed to write to disk")
        }
    }
}

struct JsonPlaceHolderModel : Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
