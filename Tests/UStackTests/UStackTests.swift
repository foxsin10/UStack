    import XCTest
    @testable import UStack

    final class UStackTests: XCTestCase {

        private let tags: [Int] = [114, 321, 323, 244, 1122]
        override func measure(_ block: () -> Void) {
            #if canImport(UIKit)
            testVStackBuilder()
            testHStackBuilder()
            testVStack()
            testHStack()
            #endif
        }
        #if canImport(UIKit)
        func testHStackBuilder() {
            let label = UILabel()
            let button = UIButton()
            let simpleView = UIView()

            @HStackBuilder
            func builder() -> UIStackView {
                label
                button
                simpleView
            }

            let stack = builder()
            XCTAssertEqual(stack.axis, .horizontal)

            for (idx, view) in stack.arrangedSubviews.enumerated() {
                switch idx {
                case 0: XCTAssertEqual(view, label)
                case 1: XCTAssertEqual(view, button)
                case 2: XCTAssertEqual(view, simpleView)
                default: break
                }
            }
        }

        func testVStackBuilder() {
            let label = UILabel()
            let button = UIButton()
            let simpleView = UIView()

            @VStackBuilder
            func builder() -> UIStackView {
                label
                button
                simpleView
            }

            let stack = builder()
            XCTAssertEqual(stack.axis, .vertical)

            for (idx, view) in stack.arrangedSubviews.enumerated() {
                switch idx {
                case 0: XCTAssertEqual(view, label)
                case 1: XCTAssertEqual(view, button)
                case 2: XCTAssertEqual(view, simpleView)
                default: break
                }
            }
        }

        func testHStack() {
            let label = UILabel()
            let button = UIButton()
            let simpleView = UIView()

            let hstack = HStackView {
                label
                button
                simpleView
            }
            XCTAssertEqual(hstack.axis, .horizontal)
            for (idx, view) in hstack.arrangedSubviews.enumerated() {
                switch idx {
                case 0: XCTAssertEqual(view, label)
                case 1: XCTAssertEqual(view, button)
                case 2: XCTAssertEqual(view, simpleView)
                default: break
                }
            }
        }

        func testVStack() {
            let label = UILabel()
            let button = UIButton()
            let simpleView = UIView()

            let vstack = VStackView {
                label
                button
                simpleView
            }
            XCTAssertEqual(vstack.axis, LayoutConstraint.Axis.vertical)
            for (idx, view) in vstack.arrangedSubviews.enumerated() {
                switch idx {
                case 0: XCTAssertEqual(view, label)
                case 1: XCTAssertEqual(view, button)
                case 2: XCTAssertEqual(view, simpleView)
                default: break
                }
            }
        }

        func testNestedStackCount() {
            let nestedStack = HStackView {
                VStackView {
                    UILabel()
                    UIView()
                }
                UIView().withSubViews {
                    UILabel()
                    UIView()
                }
            }
            let count = nestedStack.arrangedSubviews.reduce(into: 0) {
                switch $1 {
                case let view as UIStackView: $0 += view.arrangedSubviews.count + 1
                default: $0 += $1.subviews.count + 1
                }
            }
            XCTAssertEqual(count, 6)
        }

        func testConrolFlow() {
            let randomIdx = Int.random(in: 12 ..< 29)
            let refresh = Bool.random()
            let button = UIButton()
            let label = UILabel()
            let refreshLabel = UILabel()
            let unRefreshLabel = UILabel()
            let emptyView = UIView()
            for (idx, view) in  [button, label, refreshLabel, unRefreshLabel, emptyView].enumerated() {
                view.tag = tags[idx]
            }

            @ViewStackBuilder
            func build() -> UIView? {
                button
                label
                if refresh {
                    refreshLabel
                } else {
                    unRefreshLabel
                }
                switch randomIdx {
                case 12: emptyView
                default: UIView()
                }
            }

            let view = build() ?? View()

            for (idx, subview) in view.subviews.enumerated() {
                let tag = tags[idx]
                switch idx {
                case 2:
                    if refresh {
                        XCTAssertEqual(subview.tag, tag)
                    } else {
                        XCTAssertEqual(subview.tag, tags[idx + 1])
                    }

                case 3:
                    if randomIdx == 12 {
                        XCTAssertEqual(subview.tag, tags.last)
                    } else {
                        XCTAssertEqual(subview.tag, 0)
                    }

                default:
                    XCTAssertEqual(subview.tag, tag)
                }
            }
            XCTAssertEqual(view.subviews.count, 4)
        }
        #endif
    }
