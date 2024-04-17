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
    
    private var cancellableV2: AnyCancellable?
    
    //private var publisher: AnyPublisher<Any, Error>?
    
    private var cancels: Set<AnyCancellable> = []
    
    private var posts: [Post] = [] {
        didSet {
            print("posts V1 --> \(self.posts.count)")
            for postV1 in self.posts {
                print("postV1 title: \(postV1.title)")
            }
        }
    }
    
    private var postsV2: [Post] = [] {
        didSet {
            print("posts V2 --> \(self.postsV2.count)")
            for postV2 in self.postsV2 {
                print("postV2 id: \(postV2.id)")
            }
            print()
        }
    }
            
    override func viewDidLoad() {
        super.viewDidLoad()
                
        // function 1
        fetchDataWithDecoder()

        // function 2
        fetchDataWithDecoderAndDidSet()
        
        // function 3
        fetchDataInStringFormat()
    }
    
    // 1
    func fetchDataWithDecoder() {
        // url used to get information
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        
        // dataTask function used to read url
        self.cancellable = URLSession.shared.dataTaskPublisher(for: url)
        .map { $0.data } // parse data
        .decode(type: [Post].self, decoder: JSONDecoder()) // decode data to Post array class
        .replaceError(with: []) // ro map error, not used
        //.eraseToAnyPublisher() // not neccessary now
        .sink(receiveValue: { posts in // the result can be used here
            print("x: \(posts.count)")
            self.posts = posts
        })
    }
    
    // 2
    // equal the function below, except for assignment
    func fetchDataWithDecoderAndDidSet() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        
        self.cancellableV2 = URLSession.shared.dataTaskPublisher(for: url)
        .map { $0.data }
        .decode(type: [Post].self, decoder: JSONDecoder())
        .replaceError(with: [])
        .eraseToAnyPublisher()
        .assign(to: \.postsV2, on: self) // the same code as - self.postsV2 = postsV2, see example above
    }
    
    // 3
    // the difference in this code is that does not decode the result, it jus show the html bodry as a result
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
