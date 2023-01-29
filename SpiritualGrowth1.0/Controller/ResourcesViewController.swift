//
//  ResourcesViewController.swift
//  SpiritualGrowth1.0
//
//  Created by Brian Cordeau on 1/28/23.
//

import Foundation
import UIKit


class ResourcesViewController: UIViewController {
    var activityText : NSAttributedString = NSMutableAttributedString("")
    
    
    
    @IBOutlet weak var displayResources: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        displayResources.attributedText = self.activityText
        
    }
    
    
    
   
}

    
