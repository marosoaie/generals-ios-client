//
//  ViewController.swift
//  Generals
//
//  Created by Mihai Arosoaie on 14/07/2017.
//  Copyright © 2017 Mihai Arosoaie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let newController = GameGridViewController(size: CGSize(width: 20, height: 20))
        
        self.present(newController, animated: false, completion: nil)
    }


}

