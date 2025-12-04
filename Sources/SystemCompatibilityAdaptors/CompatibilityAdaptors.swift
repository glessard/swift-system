#if canImport(System) && canImport(SystemPackage)
import System
import SystemPackage

@available(macOS 12, *)
extension SystemPackage.FilePath {

  public init(converting path: System.FilePath) {
    self = path.withPlatformString(Self.init(platformString:))
  }
}

@available(macOS 12, *)
extension System.FilePath {

  public init(converting path: SystemPackage.FilePath) {
    self = path.withPlatformString(Self.init(platformString:))
  }
}

@available(macOS 11, *)
extension SystemPackage.FileDescriptor {
  public init(converting descriptor: System.FileDescriptor) {
    self.init(rawValue: descriptor.rawValue)
  }
}

@available(macOS 11, *)
extension System.FileDescriptor {
  public init(converting descriptor: SystemPackage.FileDescriptor) {
    self.init(rawValue: descriptor.rawValue)
  }
}
#endif // canImport(System) && canImport(SystemPackage)
