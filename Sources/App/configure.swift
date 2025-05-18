import Vapor
import WhooshingServer

struct Configuration {
    /// 对 Https 模块进行配置，如果设置了 HTTPS 环境变量
    /// 取决于 Package.swift 的 swiftSettings 中的环境变量设置
    static func https(_ woo: Whooshing<Https>, app: Application) async throws {
        try routes(woo, app)
    }
    
    /// 对 API 模块进行配置，如果设置了 API 环境变量
    /// 取决于 Package.swift 的 swiftSettings 中的环境变量设置
    static func api(_ woo: Whooshing<Api>, app: Application) async throws {
        try routes(woo, app)
    }
    
    /// 对 Inline 模块进行配置
    /// Inline 模块为每个服务模块的必须，因此不支持在 swiftSettings 中设置
    static func inline(_ woo: Whooshing<Inline>, app: Application) async throws {
        try routes(woo, app)
    }
}
