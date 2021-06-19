# UITapableLabelView

A Pod That helps IOS Developers to tap on words in UILabel.


## Requirements
- [x] Xcode 11.
- [x] Swift 4.2.
- [x] iOS 11 or higher.


## Installation
### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate UITapableLabelView into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
platform :ios, '11.0'
use_frameworks!

pod 'UITapableLabelView'

```

## Usage

```swift
import UITapableLabelView

label.tap("Hello"){
  //Write your Action Here
}
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)
