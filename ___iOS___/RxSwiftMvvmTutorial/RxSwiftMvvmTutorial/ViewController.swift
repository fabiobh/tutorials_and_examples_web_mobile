//
//  ViewController.swift
//  RxSwiftMvvmTutorial
//
//  Created by fabiocunha on 09/08/22.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    let disposeBag = DisposeBag()
        
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: RestaurantsListViewModel!
    
    static func instantiate(viewModel: RestaurantsListViewModel) -> ViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateInitialViewController() as! ViewController
        viewController.viewModel = viewModel
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .red
        
//        let service = RestaurantService()
//        service.fetchRestaurants().subscribe(onNext: { restaurants in
//            print(restaurants)
//        }).disposed(by: disposeBag)
        
        tableView.tableFooterView = UIView()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = viewModel.title
        
        viewModel.fetchRestaurantViewModel().observe(on: MainScheduler.instance).bind(to:                                                    tableView.rx.items(cellIdentifier: "cell")) { index, viewModel, cell in
            cell.textLabel?.text = viewModel.displayText
        }.disposed(by: disposeBag)
                                                    
    }


}

