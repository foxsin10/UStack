    import XCTest
    @testable import UStack

    final class UStackTests: XCTestCase {
        override func measure(_ block: () -> Void) {
            testVStackBuilder()
            testHStackBuilder()
            testVStack()
            testHStack()
        }

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

            let hstack = HStack {
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

            let vstack = VStack {
                label
                button
                simpleView
            }
            XCTAssertEqual(vstack.axis, .vertical)
            for (idx, view) in vstack.arrangedSubviews.enumerated() {
                switch idx {
                case 0: XCTAssertEqual(view, label)
                case 1: XCTAssertEqual(view, button)
                case 2: XCTAssertEqual(view, simpleView)
                default: break
                }
            }
        }
    }
