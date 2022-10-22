import XCTest
import MyLibrary

@testable import MyLibrary

final class WeatherServiceIntegrationTests: XCTestCase {
    
    func testGivenMockWeatherServiceIsRunning_WhenWeatherServiceImplIsCalled_thenReturnWeatherShouldNotBeNil() async throws {
        
        let weatherService = WeatherServiceImpl()
        let result = try await weatherService.getTemperature()
        XCTAssertNotNil(result)
    }

    func testGivenMockWeatherServiceIsRunning_WhenWeatherServiceImplIsCalled_thenReturnWeatherStaticTempValue() async throws {
        let weatherService = WeatherServiceImpl()
        let result = try await weatherService.getTemperature()
        let expected = 293
        XCTAssertEqual(result, expected)
    }

}
