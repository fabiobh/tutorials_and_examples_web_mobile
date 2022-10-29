//
//  ViewController.swift
//  CombineDataTask
//
//  Created by fabiocunha on 21/08/22.
//

import UIKit
import Combine

class ViewController: UIViewController {

    private var cancellable: AnyCancellable?
    
    private var publisher: AnyPublisher<Any, Error>?
    
    private var cancels: Set<AnyCancellable> = []
    
    private var posts: [Post] = [] {
        didSet {
            print("posts --> \(self.posts.count)")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
        
//        fetchDataWithDecoder()
//
//        fetchDataWithDecoderAndDidSet()
        
        fetchDataInStringFormat()
    }
    
    func fetchDataWithDecoder() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        
        self.cancellable = URLSession.shared.dataTaskPublisher(for: url)
        .map { $0.data }
        .decode(type: [Post].self, decoder: JSONDecoder())
        .replaceError(with: [])
        .eraseToAnyPublisher()
        .sink(receiveValue: { posts in
            print("x: \(posts.count)")
        })
    }
        
    func fetchDataWithDecoderAndDidSet() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        
        self.cancellable = URLSession.shared.dataTaskPublisher(for: url)
        .map { $0.data }
        .decode(type: [Post].self, decoder: JSONDecoder())
        .replaceError(with: [])
        .eraseToAnyPublisher()
        .assign(to: \.posts, on: self)
    }
    
    func fetchDataInStringFormat() {
        let url = URL(string: "https://example.com/")!
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .compactMap { String(data: $0, encoding:. utf8) }
            .receive(on: DispatchQueue.main)
            .sink (
                receiveCompletion: {
                    print("Completion: \($0)")
                },
                receiveValue: { result in
                    print("String: \(result)")
                })
            .store(in: &cancels)
    }


}


enum HTTPError: LocalizedError {
    case statusCode
    case post
}

struct Post: Codable {

    let id: Int
    let title: String
    let body: String
    let userId: Int
}

struct Todo: Codable {

    let id: Int
    let title: String
    let completed: Bool
    let userId: Int
}
