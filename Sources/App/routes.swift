import Vapor
import WhooshingServer

func routes<T>(_ woo: Whooshing<T>, _ app: Application) throws where T: ServiceType {
    app.get { req async in
        "It works!"
    }

    app.get("hello") { req async -> String in
        "Hello, world!"
    }
}
