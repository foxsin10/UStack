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
let refresh = Bool.random()
let refreshAnother = Bool.random()
let idx = Int.random(in: 1 ... 12)
HStack {
  VStack {
    UILabel()
    UIButton()
  }
  if refresh {
    VStack {
      UIImageView()
      UIView()
    }
  }
  if refreshAnother {
    VStack {
      UIImageView()
      UIView()
    }
  } else {
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

ps: every control flow will be treated as a block, give the simplest VStack for example:

- `buildExpression(_:)` -> UILabel
- `buildExpression(_:)` -> UIButton
- `buildBlock(_:)` -> VStack
- `buildExpression(_:)` -> VStack

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

### Sample

<p align="center">
<img src="https://raw.githubusercontent.com/foxsion10/UStack/master/images/UStackSample.jpeg" alt="UStack" title="UStack" width="377"/>
</p>

As the example image above, the implement code:

```swift
private lazy var registerActionStack = VStack(spacing: minorSpacing, alignment: .fill) {
  registerButton
  UIView.spacer()
  loginButton
}

private lazy var registerPolicyStack = HStack(spacing: mediumSpacing) {
  UIView.spacer()
  policyCircleButton
  tipLabel
  policyInfoButton
  UIView.spacer()
}

private lazy var contentStack = VStack(spacing: mainMargin, alignment: .center) {
  sloganImageView
  loginLogoImageView
  registerActionStack
  UIView.spacer()
  registerPolicyStack
}
```

and the layout code:

```swift
view.withSubViews {
  contentStack
}

contentStack.snp.makeConstraints {
  $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        .offset(topPadding)
  $0.leading.trailing.equalToSuperview()
        .inset(horizontalPadding)
  $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
}

registerButton.snp.makeConstraints {
  $0.width.equalTo(view)
          .inset(horizontalPadding)
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
  pod 'UStack', '~> 0.6.0'
end
```

### License

UStack is released under the MIT license. See LICENSE for details.
