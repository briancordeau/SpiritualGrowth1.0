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
    var resourceText : String = ""

    
    
    @IBOutlet weak var displayResources: UILabel!
    @IBOutlet weak var resourceClickable: UITextView!
    
    
    
    override func viewDidLoad() {

        super.viewDidLoad()

        resourceClickable.backgroundColor = UIColor.black
        //resourceClickable.font = [.foregroundColor: UIColor.white]
        resourceClickable.text = self.resourceText
   
        resourceClickable.textColor = UIColor.gray
        resourceClickable.linkTextAttributes = [.foregroundColor: UIColor.systemGreen]

        resourceClickable.isSelectable = true
        resourceClickable.isEditable = false
        resourceClickable.isUserInteractionEnabled = true
        resourceClickable.dataDetectorTypes = .link
        
        
        
        //resourceClickable.sizeToFit()
        
        

        displayResources.attributedText = self.activityText
        
        
    }
    
    
   }
   


    
