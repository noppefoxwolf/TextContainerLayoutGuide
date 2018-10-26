//
//  TextContainerLayoutGuide.swift
//  Pods-TextContainerLayoutGuide_Example
//
//  Created by Tomoya Hirano on 2018/10/26.
//

import UIKit

public extension UITextView {
  private struct AssociatedKeys {
    static var textContainerLayoutGuide = "textContainerLayoutGuide"
  }
  
  public var textContainerLayoutGuide: TextContainerLayoutGuide {
    get {
      if let obj = objc_getAssociatedObject(self, &AssociatedKeys.textContainerLayoutGuide) as? TextContainerLayoutGuide {
        return obj
      }
      let new = TextContainerLayoutGuide()
      addLayoutGuide(new)
      new.setUp()
      objc_setAssociatedObject(self, &AssociatedKeys.textContainerLayoutGuide, new as Any, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
      return new
    }
  }
}

public class TextContainerLayoutGuide: UILayoutGuide {
  private func setupObserver() {
    guard let textView = owningView as? UITextView else { return }
    textView.addObserver(self,
                         forKeyPath: #keyPath(UITextView.contentOffset),
                         options: [.initial, .new],
                         context: nil)
    let nc = NotificationCenter.default
    nc.addObserver(self, selector: #selector(textViewDidChange), name: UITextView.textDidChangeNotification, object: textView)
  }
  
  public override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
    guard let keyPath = keyPath else { return }
    if keyPath == #keyPath(UITextView.contentOffset) {
      scrollDidChange()
    }
  }
  
  public override init() {
    super.init()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  deinit {
    NotificationCenter.default.removeObserver(self)
  }
  
  @objc private func textViewDidChange() {
    update()
  }
  
  @objc private func scrollDidChange() {
    update()
  }
  
  fileprivate func setUp() {
    guard let textView = owningView as? UITextView else { return }
    NSLayoutConstraint.activate([
      leftAnchor.constraint(equalTo: textView.leftAnchor),
      topAnchor.constraint(equalTo: textView.topAnchor),
      widthAnchor.constraint(equalToConstant: 0),
      heightAnchor.constraint(equalToConstant: 0),
      ])
    setupObserver()
  }
  
  private func update() {
    guard let textView = owningView as? UITextView else { return }
    let caretRect = textView.caretRect(for: textView.endOfDocument)
    guard caretRect.origin.x.isFinite else { return }
    guard caretRect.origin.y.isFinite else { return }
    
    heightConstraint?.constant = caretRect.minY + caretRect.height - textView.textContainerInset.top
    widthConstraint?.constant = textView.bounds.width - textView.textContainerInset.right - textView.textContainerInset.left
    topConstraint?.constant = -textView.contentOffset.y * 2 + textView.textContainerInset.top
    leftConstraint?.constant = -textView.contentOffset.x * 2 + textView.textContainerInset.left
    
    owningView?.layoutIfNeeded()
  }
}

// helper

extension UILayoutGuide {
  internal var heightConstraint: NSLayoutConstraint? {
    return constraint(of: .height)
  }
  
  internal var widthConstraint: NSLayoutConstraint? {
    return constraint(of: .width)
  }
  
  internal var topConstraint: NSLayoutConstraint? {
    return constraint(of: .top)
  }
  
  internal var leftConstraint: NSLayoutConstraint? {
    return constraint(of: .left)
  }
  
  private func constraint(of attribute: NSLayoutConstraint.Attribute) -> NSLayoutConstraint? {
    guard let target = owningView else { return nil }
    for c in target.constraints {
      if let fi = c.firstItem as? UILayoutGuide, fi == self && c.firstAttribute == attribute {
        return c
      }
    }
    return nil
  }
}
