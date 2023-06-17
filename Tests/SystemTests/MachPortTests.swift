/*
 This source file is part of the Swift System open source project

 Copyright (c) 2022 Apple Inc. and the Swift System project authors
 Licensed under Apache License v2.0 with Runtime Library Exception

 See https://swift.org/LICENSE.txt for license information
*/

#if swift(>=5.9) && $MoveOnly && (os(macOS) || os(iOS) || os(watchOS) || os(tvOS))

import XCTest
import Darwin.Mach

#if SYSTEM_PACKAGE
import SystemPackage
#else
import System
#endif

final class MachPortTests: XCTestCase {

  func testCreateAndDoNothing() throws {
    _ = Mach.Port<Mach.ReceiveRight>()
  }
}

#endif
