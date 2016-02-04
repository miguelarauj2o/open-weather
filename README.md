# open-weather

Swift app that displays weather information from nearby cities in a particular
location provided by [Open Weather API]

## About

This app features stuff like HTTP request, JSON manipulation, map view and table views.
open-weather was a remote test for a internship selection process at [In Loco Media].

## Build

Please, open your favorite console application and navigate to the project folder.
Next, install [Carthage] dependencies:

`$ carthage update --platform iOS`

If you don't have Carthage, you can get it with [Homebrew] using the following command:

```
brew update
brew install carthage
```

#### Dependencies

This app uses [Alamofire] for HTTP networking in Swift and [SwiftJSON] to deal
with JSON data.

## License

See LICENSE file

[Carthage]: https://github.com/Carthage/Carthage
[Alamofire]: https://github.com/Alamofire/Alamofire
[SwiftJSON]: https://github.com/SwiftyJSON/SwiftyJSON
[In Loco Media]: https://github.com/In-Loco-Media
[Homebrew]: http://brew.sh/
[Open Weather API]: http://openweathermap.org/api