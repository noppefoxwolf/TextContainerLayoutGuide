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
  @IBOutlet private weak var footerView: UILabel!
  private let overlayView: UIView = .init(frame: .zero)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    overlayView.translatesAutoresizingMaskIntoConstraints = false
    overlayView.backgroundColor = UIColor.red.withAlphaComponent(0.5)
    overlayView.isUserInteractionEnabled = false
    view.addSubview(overlayView)
    NSLayoutConstraint.activate([
      overlayView.topAnchor.constraint(equalTo: textView.textContainerLayoutGuide.topAnchor),
      overlayView.leftAnchor.constraint(equalTo: textView.textContainerLayoutGuide.leftAnchor),
      overlayView.bottomAnchor.constraint(equalTo: textView.textContainerLayoutGuide.bottomAnchor),
      overlayView.rightAnchor.constraint(equalTo: textView.textContainerLayoutGuide.rightAnchor),
    ])
    textView.textContainerInset = .init(top: 30, left: 20, bottom: 10, right: 5)
    
    footerView.topAnchor.constraint(equalTo: textView.textContainerLayoutGuide.bottomAnchor).isActive = true
  }
}
