# swizzleMethod
swizzle method include instance method and class method

[![Version](https://img.shields.io/cocoapods/v/swizzleMethod.svg?style=flat)](http://cocoapods.org/pods/swizzleMethod)
[![License](https://img.shields.io/cocoapods/l/swizzleMethod.svg?style=flat)](http://cocoapods.org/pods/swizzleMethod)
[![Platform](https://img.shields.io/cocoapods/p/swizzleMethod.svg?style=flat)](http://cocoapods.org/pods/swizzleMethod)

## Example
```Objective-C
//
// swizzle two class method
[[self class] sm_swizzleClassMethod:classSel1 withMethod:classSel2];
//
// swizzle two instance method
[[self class] sm_swizzleMethod:instanceSel1 withMethod:instanceSel2];
```

## Requirements

## Installation

swizzleMethod is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'swizzleMethod'
```

## Author

Oborn Jung, obornjung@gmail.com

## License

NilSafety is available under the MIT license. See the LICENSE file for more info.
