//
//  Presenter.swift
//  MvpSimple
//
//  Created by fabiocunha on 03/09/22.
//

import Foundation

protocol PresenterView: AnyObject {
    func updateLabel()
}

class Presenter {
    weak var view: PresenterView?
    // Pass something that conforms to PresenterView
    init(with view: PresenterView) {
        self.view = view
    }
    
    var timesTapped = 0
    
    func buttonTapped() {
        timesTapped += 1
        if timesTapped >= 5 {
            self.view?.updateLabel()
        }
    }
    
}
