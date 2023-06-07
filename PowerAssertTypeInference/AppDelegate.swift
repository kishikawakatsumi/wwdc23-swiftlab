import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {
  func applicationDidFinishLaunching(_ notification: Notification) {
    let bar = Bar(foo: Foo(val: 2), val: 3)

    // case 1
    // OK
    // #assert(bar.val == bar.foo.val)
    PowerAssert.Assertion(
      "#assert(bar.val == bar.foo.val)",
      message: "",
      file: "PowerAssertTests/AssertTests.swift",
      line: 500,
      verbose: false,
      equalityExpressions: [(6, 1, 5)],
      identicalExpressions: [],
      comparisonOperands: [5: "bar.foo.val", 1: "bar.val"]
    ) {
      $0.captureSync($0.captureSync($0.captureSync(bar.self, column: 8, id: 0).val, column: 12, id: 1) == $0.captureSync($0.captureSync($0.captureSync(bar.self, column: 19, id: 3).foo, column: 23, id: 4).val, column: 27, id: 5), column: 16, id: 6)
    }
    .render()


    // case 2
    // Error
    // #assert(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1) == .blue && .blue == #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
    // https://github.com/apple/swift/issues/65061
//    PowerAssert.Assertion(
//      "#assert(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1) == .blue && .blue == #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))",
//      message: "",
//      file: "PowerAssertTests/AssertTests.swift",
//      line: 1409,
//      verbose: false,
//      equalityExpressions: [(7, 4, 6), (16, 9, 15)],
//      identicalExpressions: [],
//      comparisonOperands: [6: ".blue", 16: ".blue == #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)", 7: "#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1) == .blue", 4: "#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)", 9: ".blue", 15: "#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)"]
//    ) {
//      $0.captureSync($0.captureSync($0.captureSync(#colorLiteral(red: $0.captureSync(0.8078431487, column: 27, id: 0), green: $0.captureSync(0.02745098062, column: 48, id: 1), blue: $0.captureSync(0.3333333433, column: 69, id: 2), alpha: $0.captureSync(1, column: 90, id: 3)), column: 8, id: 4) == $0.captureSync(.blue, column: 97, id: 6), column: 93, id: 7) && $0.captureSync($0.captureSync(.blue, column: 106, id: 9) == $0.captureSync(#colorLiteral(red: $0.captureSync(0.8078431487, column: 133, id: 11), green: $0.captureSync(0.02745098062, column: 154, id: 12), blue: $0.captureSync(0.3333333433, column: 175, id: 13), alpha: $0.captureSync(1, column: 196, id: 14)), column: 114, id: 15), column: 111, id: 16), column: 102, id: 17)
//    }
//    .render()

    // case 3
    // OK
    // #assert(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1) != .blue && .blue != #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
    // https://github.com/apple/swift/issues/65061
    PowerAssert.Assertion(
      "#assert(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1) != .blue && .blue != #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))",
      message: "",
      file: "PowerAssertTests/AssertTests.swift",
      line: 1413,
      verbose: true,
      equalityExpressions: [],
      identicalExpressions: [],
      comparisonOperands: [6: ".blue", 9: ".blue", 4: "#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)", 16: ".blue != #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)", 7: "#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1) != .blue", 15: "#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)"]
    ) {
      $0.captureSync($0.captureSync($0.captureSync(#colorLiteral(red: $0.captureSync(0.8078431487, column: 27, id: 0), green: $0.captureSync(0.02745098062, column: 48, id: 1), blue: $0.captureSync(0.3333333433, column: 69, id: 2), alpha: $0.captureSync(1, column: 90, id: 3)), column: 8, id: 4) != $0.captureSync(.blue, column: 97, id: 6), column: 93, id: 7) && $0.captureSync($0.captureSync(.blue, column: 106, id: 9) != $0.captureSync(#colorLiteral(red: $0.captureSync(0.8078431487, column: 133, id: 11), green: $0.captureSync(0.02745098062, column: 154, id: 12), blue: $0.captureSync(0.3333333433, column: 175, id: 13), alpha: $0.captureSync(1, column: 196, id: 14)), column: 114, id: 15), column: 111, id: 16), column: 102, id: 17)
    }
    .render()


    let interestingNumbers = [
      "prime": [2, 3, 5, 7, 11, 13, 15],
      "triangular": [1, 3, 6, 10, 15, 21, 28],
      "hexagonal": [1, 6, 15, 28, 45, 66, 91]
    ]

    // case 4
    // OK
    // #assert(interestingNumbers[keyPath: \[String: [Int]].["prime"]![0]] == 2)
    PowerAssert.Assertion(
      #"#assert(interestingNumbers[keyPath: \[String: [Int]].["prime"]![0]] == 2)"#,
      message: "",
      file: "PowerAssertTests/AssertTests.swift",
      line: 2190,
      verbose: true,
      equalityExpressions: [(7, 4, 6)],
      identicalExpressions: [],
      comparisonOperands: [4: "interestingNumbers[keyPath: \\[String: [Int]].[\"prime\"]![0]]", 6: "2"]
    ) {
      $0.captureSync($0.captureSync($0.captureSync(interestingNumbers.self, column: 8, id: 0) [keyPath: $0.captureSync(\[String: [Int]].[$0.captureSync("prime", column: 54, id: 1)]! [$0.captureSync(0, column: 64, id: 2)], column: 36, id: 3)], column: 66, id: 4) == $0.captureSync(2, column: 71, id: 6), column: 68, id: 7)
    }
    .render()

    // case 5
    // Error
    // #assert(interestingNumbers[keyPath: \[String: [Int]].["prime"]]! == [2, 3, 5, 7, 11, 13, 15])
//    PowerAssert.Assertion(
//      #"#assert(interestingNumbers[keyPath: \[String: [Int]].["prime"]]! == [2, 3, 5, 7, 11, 13, 15])"#,
//      message: "",
//      file: "PowerAssertTests/AssertTests.swift",
//      line: 1963,
//      verbose: true,
//      equalityExpressions: [(14, 4, 13)],
//      identicalExpressions: [],
//      comparisonOperands: [13: "[2, 3, 5, 7, 11, 13, 15]", 4: "interestingNumbers[keyPath: \\[String: [Int]].[\"prime\"]]!"]
//    ) {
//      $0.captureSync($0.captureSync($0.captureSync($0.captureSync(interestingNumbers.self, column: 8, id: 0) [keyPath: $0.captureSync(\[String: [Int]].[$0.captureSync("prime", column: 54, id: 1)], column: 36, id: 2)], column: 62, id: 3)!, column: 8, id: 4) == $0.captureSync([$0.captureSync(2, column: 69, id: 6), $0.captureSync(3, column: 72, id: 7), $0.captureSync(5, column: 75, id: 8), $0.captureSync(7, column: 78, id: 9), $0.captureSync(11, column: 81, id: 10), $0.captureSync(13, column: 85, id: 11), $0.captureSync(15, column: 89, id: 12)], column: 68, id: 13), column: 65, id: 14)
//    }
//    .render()


    // case 6
    // Error
    // #assert([10, 3, 20, 15, 4] .sorted() .filter { $0 > 5 } .map { $0 * 100 } == arr)
    let arr = [1000, 1500, 2000]
//    PowerAssert.Assertion(
//      "#assert([10, 3, 20, 15, 4] .sorted() .filter { $0 > 5 } .map { $0 * 100 } == arr)",
//      message: "",
//      file: "PowerAssertTests/AssertTests.swift",
//      line: 3846,
//      verbose: true,
//      equalityExpressions: [(16, 13, 15)],
//      identicalExpressions: [],
//      comparisonOperands: [15: "arr", 13: "[10, 3, 20, 15, 4] .sorted() .filter { $0 > 5 } .map { $0 * 100 }"]
//    ) {
//      $0.captureSync($0.captureSync($0.captureSync($0.captureSync($0.captureSync([$0.captureSync(10, column: 9, id: 0), $0.captureSync(3, column: 13, id: 1), $0.captureSync(20, column: 16, id: 2), $0.captureSync(15, column: 20, id: 3), $0.captureSync(4, column: 24, id: 4)], column: 8, id: 5) .sorted(), column: 28, id: 7) .filter {
//        $0 > 5
//      }, column: 38, id: 10) .map {
//        $0 * 100
//      }, column: 57, id: 13) == $0.captureSync(arr.self, column: 77, id: 15), column: 74, id: 16)
//    }
//    .render()
  }
}

struct Bar {
  let foo: Foo
  var val: Int
}

struct Foo {
  var val: Int
}
