# UStack

A tool for StackView in UIKit.

## Requirements

- iOS 11.0+
- Xcode 12.5+

### Use cases

HStackView use-case:

```swift
let label = UILabel()
let button = UIButton()
let simpleView = UIView()

let hstack = HStackView {
    label
    button
    simpleView
}
```

VStackView use-case:

```swift
let label = UILabel()
let button = UIButton()
let simpleView = UIView()

let vstack = VStackView {
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
HStackView {
  VStackView {
    UILabel()
    UIButton()
  }
  if refresh {
    VStackView {
      UIImageView()
      UIView()
    }
  }
  if refreshAnother {
    VStackView {
      UIImageView()
      UIView()
    }
  } else {
      UIView()
  }
  UIView().withSubViews {
    HStackView {
      UILabel()
      UIButton()
    }
  }
}
```

ps: every control flow will be treated as a block, give the simplest VStack for example:

- `buildExpression(_:)` -> UILabel
- `buildExpression(_:)` -> UIButton
- `buildBlock(_:)` -> VStackView
- `buildExpression(_:)` -> VStackView

### Sample

<p align="center">
<img src="https://raw.githubusercontent.com/foxsin10/UStack/master/images/UStackSample.png" alt="UStack" title="UStack" width="377"/>
</p>

As the example image above, the implement code:

```swift
private lazy var registerActionStack = VStackView(spacing: minorSpacing, alignment: .fill) {
  registerButton
  UIView.spacer()
  loginButton
}

private lazy var registerPolicyStack = HStackView(spacing: mediumSpacing) {
  UIView.spacer()
  policyCircleButton
  tipLabel
  policyInfoButton
  UIView.spacer()
}

private lazy var contentStack = VStackView(spacing: mainMargin, alignment: .center) {
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
  $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(topPadding)
  $0.leading.trailing.equalToSuperview().inset(horizontalPadding)
  $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
}

registerButton.snp.makeConstraints {
  $0.width.equalTo(view).inset(horizontalPadding)
}
```

### Installation

#### Swift Package Manager

- File > Swift Packages > Add Package Dependency
- Add `https://github.com/foxsin10/UStack.git`
- Select "Up to Next Major" with "2.0.0"

#### CocoaPods

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '11.0'
use_frameworks!

target 'MyApp' do
  pod 'UStack', '~> 2.3.0'
end
```

### License

UStack is released under the MIT license. See LICENSE for details.
