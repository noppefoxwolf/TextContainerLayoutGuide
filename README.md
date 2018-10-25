# 📝 TextContainerLayoutGuide

[![CI Status](https://img.shields.io/travis/noppefoxwolf/TextContainerLayoutGuide.svg?style=flat)](https://travis-ci.org/noppefoxwolf/TextContainerLayoutGuide)
[![Version](https://img.shields.io/cocoapods/v/TextContainerLayoutGuide.svg?style=flat)](https://cocoapods.org/pods/TextContainerLayoutGuide)
[![License](https://img.shields.io/cocoapods/l/TextContainerLayoutGuide.svg?style=flat)](https://cocoapods.org/pods/TextContainerLayoutGuide)
[![Platform](https://img.shields.io/cocoapods/p/TextContainerLayoutGuide.svg?style=flat)](https://cocoapods.org/pods/TextContainerLayoutGuide)

# How to use it

Simply constrain your views to the TextContainerLayoutGuide's anchors.

```swift
footerView.topAnchor.constraint(equalTo: textView.textContainerLayoutGuide.bottomAnchor).isActive = true
```
Place view in footer of UITextView

## Installation

### Cococapods

TextContainerLayoutGuide is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'TextContainerLayoutGuide'
```

### Carthage

```
github "noppefoxwolf/TextContainerLayoutGuide"
```

## Author

noppefoxwolf, noppelabs@gmail.com

## License

TextContainerLayoutGuide is available under the MIT license. See the LICENSE file for more info.
