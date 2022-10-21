import XCTest
import MyLibrary


@testable import MyLibrary

final class WeatherModelTests: XCTestCase {


    func testGivenCorrectJsonData_whenWeatherStructIsMapped_thenShouldSuccessfullyAssertEqual() throws {
        let rawWeatherJson = "{\"main\":{\"temp\":293.76}}";
       
        let jsonData = Data(rawWeatherJson.utf8)
        let jsonDecoder = JSONDecoder()
        let resultWeather = try jsonDecoder.decode(Weather.self, from: jsonData);

        let expectedWeather = Weather(main : Weather.Main(temp: 293.76))

        XCTAssertEqual(resultWeather.main.temp, expectedWeather.main.temp)
    }

    func testGivenWeatherModel_whenWrongJsonDataIsGiven_thenShouldSuccessfullyAssertNotEqual() throws {
        let rawWeatherJson = "{\"main\":{\"temp\":1}}";
       
        let jsonData = Data(rawWeatherJson.utf8)
        let jsonDecoder = JSONDecoder()
        let resultWeather = try jsonDecoder.decode(Weather.self, from: jsonData);

        let expectedWeather = Weather(main : Weather.Main(temp: 293.76) )

        XCTAssertNotEqual(resultWeather.main.temp, expectedWeather.main.temp)
    }

}
