//
//  ViewController.swift
//  Carlist
//
//  Created by Jake Lin on 11/9/21.
//

import UIKit

class CarListViewController: NiblessViewController {

    let viewModel: CarListViewModel

    init(viewModel: CarListViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .red
    }
}

