import Vapor
import Whooshing

struct Configuration {
    /// 对 Https 模块进行配置，如果设置了 HTTPS 环境变量
    /// 取决于 Package.swift 的 swiftSettings 中的环境变量设置
    static func https(_ app: Application) async throws {
//        app.http.server.configuration.hostname = "0.0.0.0"        // 设置 HTTPS 模块的监听地址，默认值为 "0.0.0.0"
        try routes(app)
    }
    
    /// 对 API 模块进行配置，如果设置了 API 环境变量
    /// 取决于 Package.swift 的 swiftSettings 中的环境变量设置
    static func api(_ app: Application) async throws {
//        app.http.server.configuration.hostname = "127.0.0.1"      // 设置 API 模块的监听地址，默认值为 "127.0.0.1"
        try routes(app)
    }
    
    /// 对 Inline 模块进行配置
    static func inline(_ app: Application) async throws {
        // 设置该模块的监听地址，默认值为 "127.0.0.1"
//        app.http.server.configuration.hostname = "127.0.0.1"      // 设置 INLINE 模块的监听地址，默认值为 "127.0.0.1"
        try routes(app)
    }
}
