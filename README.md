
# UStack

A tool for StackView in UIKit.


## Requirements

- iOS 11.0+ 
- Xcode 12.5+
- Swift 5.4+


### Use cases 

HStack use-case:

```swift
let label = UILabel()
let button = UIButton()
let simpleView = UIView()

let hstack = HStack {
    label
    button
    simpleView
}
```

VStack use-case:

```swift
let label = UILabel()
let button = UIButton()
let simpleView = UIView()

let vstack = VStack {
    label
    button
    simpleView
}
```

Nested use-case:

```swift
HStack {
  VStack {
    UILabel()
    UIButton()
  }
  VStack {
    UIImageView()
    UIView()
  }
  UIView().withSubViews {
    HStack {
      UILabel()
      UIButton()
    }
  }
}
```

StackBuilder use-case:

```swift
@HStackBuilder
func hstack() -> UIStackView {
  UILabel()
  UIButton()
}

@VStackBuilder
func vstack() -> UIStackView {
  UILabel()
  UIButton()
}
```


### Installation

#### Swift Package Manager

- File > Swift Packages > Add Package Dependency
- Add `https://github.com/foxsin10/UStack.git`
- Select "Up to Next Major" with "1.0.0"


#### CocoaPods

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '11.0'
use_frameworks!

target 'MyApp' do
  pod 'UStack', '~> 0.4.0'
end
```


### License

UStack is released under the MIT license. See LICENSE for details.
