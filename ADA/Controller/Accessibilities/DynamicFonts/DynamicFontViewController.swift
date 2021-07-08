//
//  DynamicFontViewController.swift
//  ADA
//
//  Created by Majumdar, Amit on 08/07/21.
//

import UIKit

class DynamicFontViewController: UIViewController {
    
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Dynamic Font Sizing"
        descriptionLabel.font = OpenSans.regular.of(textStyle: .body)
        descriptionLabel.adjustsFontForContentSizeCategory = true
    }

}
