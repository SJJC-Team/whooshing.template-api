import NIOSSL
import Fluent
import FluentPostgresDriver
import Vapor

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.databases.use(DatabaseConfigurationFactory.postgres(configuration: .init(
        hostname: "localhost",
        port: Environment.get("DATABASE_PORT"),
        username: Environment.get("DATABASE_USERNAME"),
        password: Environment.get("DATABASE_PASSWORD"),
        database: Environment.get("DATABASE_NAME")
        tls: .disable)
    ), as: .psql)

    app.migrations.add(CreateTodo())
    // register routes
    try routes(app)
}

extension DatabaseID {
    public static whooshingDB(_ name: String) -> DatabaseID {
        .init(string: name)
    }
}