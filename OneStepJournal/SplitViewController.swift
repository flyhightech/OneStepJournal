//
//  SplitViewController.swift
//  OneStepJournal
//
//  Created by Bernard Huff on 3/24/19.
//  Copyright © 2019 Flyhightech.LLC. All rights reserved.
//

import UIKit

class SplitViewController: UISplitViewController, UISplitViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        self.preferredDisplayMode = .allVisible

    }
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true 
    }
   
}
