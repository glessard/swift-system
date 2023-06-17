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
    var kr = KERN_SUCCESS
    let _name = withUnsafeTemporaryAllocation(of: mach_port_name_t.self, capacity: 1) {
      kr = mach_port_allocate(mach_task_self_, MACH_PORT_RIGHT_RECEIVE, $0.baseAddress)
      precondition(kr == KERN_SUCCESS)
      return $0.baseAddress.unsafelyUnwrapped.pointee
    }

    let secret = mach_port_context_t(arc4random())
    kr = mach_port_guard(mach_task_self_, _name, secret, 0)
    precondition(kr == KERN_SUCCESS)
    let _context = secret

    precondition(_name != 0xFFFFFFFF)
    kr = mach_port_destruct(mach_task_self_, _name, -1, _context)
    precondition(kr == KERN_SUCCESS)
  }
}

#endif
