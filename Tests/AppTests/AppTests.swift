@testable import App
import VaporTesting
import Testing
import Fluent
import WhooshingServer

@Suite("App Tests")
struct AppTests {
    private func withApp(_ test: (Whooshing<Https>, Application) async throws -> ()) async throws {
        let logger = Logger(label: "testing")
        let bootstrap = try await Whooshing<Https>.bootstrap(.testing(DebuggingParameters.httpsDebuggingData()), logger: logger).get()
        let woo = try await Whooshing.make(bootstrap).get()
        do {
            try await Configuration.https(woo, app: woo.app)
            try await test(woo, woo.app)
        } catch {
            try await woo.asyncShutdown().get()
            throw error
        }
        try await woo.asyncShutdown().get()
    }
    
    @Test("Test Hello World Route")
    func helloWorld() async throws {
        try await withApp { woo, app in
            try await app.testing().test(.GET, "hello", afterResponse: { res async in
                #expect(res.status == .ok)
                #expect(res.body.string == "Hello, world!")
            })
        }
    }
}
