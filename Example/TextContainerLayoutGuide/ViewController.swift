//
//  ViewController.swift
//  TextContainerLayoutGuide
//
//  Created by noppefoxwolf on 10/26/2018.
//  Copyright (c) 2018 noppefoxwolf. All rights reserved.
//

import UIKit
import TextContainerLayoutGuide

class ViewController: UIViewController {
  @IBOutlet private weak var textView: UITextView!
  @IBOutlet private weak var footerView: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    footerView.topAnchor.constraint(equalTo: textView.textContainerLayoutGuide.bottomAnchor).isActive = true
  }
}


