import Vapor
import Whooshing

struct Configuration {
    /// 对 Https 模块进行配置，如果设置了 HTTPS 环境变量
    static func https(_ app: Application) async throws {
        try routes(app)
    }
    
    /// 对 API 模块进行配置，如果设置了 API 环境变量
    static func api(_ app: Application) async throws {
        try routes(app)
    }
    
    /// 对 Inline 模块进行配置
    static func inline(_ app: Application) async throws {
        try routes(app)
    }
}
