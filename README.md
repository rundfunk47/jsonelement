# jsonelement

The world of JSON is very flexible when it comes to types. The world of Swift is usually not. `JSONElement` intends to bridge the gap between untyped and typed when dealing with JSON data. 

## What is JSONElement?

Let's say you want to fetch some data from an API using Swift. The recommended way to do that is of course to create an object that conforms to `Decodable`. But let's say the data you want to process doesn't fit the type-safe rigid box that objects need to follow in Swift. For instance, it might have keys that vary, values that differ in type for the same key, or maybe you need to do some preprocessing before creating an object. The solution then would be to decode it to a `Dictionary<String, Any>`. Unfortunately, doing that, you'll manually have to type-check that the types returned from the `Any` are the ones you are expecting or can handle. 

Isn't there a better solution? Of course there is: JSONElement!

JSONElement is an enum with a typed associated value representing a single JSON element. It can contain a String, Int, Bool, Double, Null, Array or a Dictionary. For example, suppose you have the following JSON:

```javascript
{ "id": 123, "firstName": "John", "lastName": "User"}
```

Decoded to a `JSONElement` will give us the following enum:

```swift
JSONElement.dictionary(["id": JSONElement.int(123), "firstName": JSONElement.string("John"), "lastName": JSONElement.string("User")])
```

This structure can then be safely traversed, manipulated, printed or converted into an object if you so choose.

## Features and usage 

A `JSONElement` can be created a number of different ways:

```swift
// Initialize using enum
let json = JSONElement.null
```

```swift
// Initialize using json string
let json = try JSONElement(stringRepresentation: "\"null\"")
```

```swift
// Initialize using value
let json = try JSONElement(NSNull())
```

You can also turn encodable objects to JSONElement:

```swift
let car = Car(
    name: "Lada Niva",
    manufactureDate: Date(timeIntervalSince1970: 331215172),
    manualTransmission: true
)
        
let encoder = JSONEncoder()
        
let json = try JSONElement(encodable: car, usingEncoder: encoder)
```

or turn JSONElements into a decodable object:

```swift
let dict = JSONElement.dictionary(
    [
        "manualTransmission": .bool(true),
        "manufactureDate": .int(-647092028),
        "name": .string("Lada Niva")
    ]
)

let decoder = JSONDecoder()

let decodedCar: Car = try dict.decoded(usingDecoder: decoder)
```

The most useful feature of JSONElement is as previously mentioned that it is Codable as well, so you can create JSONElement from JSON data you've received from a server:

```swift
let jsonDecoder = JSONDecoder()

let decodedString = try jsonDecoder.decode(JSONElement.self, from: "\"hel\\\"lo\"".data(using: .utf8)!)
```

JSONElement is both Equatable and Hashable, so you can compare chunks of JSON - for instance you can use it for dictionaries, where keys can come in different order but still represent the same object.

## Installation using SPM

Open Xcode and your project, click File / Swift Packages / Add package dependency... . In the textfield "Enter package repository URL", write https://github.com/rundfunk47/jsonelement and press Next twice

## Inspiration

JSONElement is modelled closely after https://kotlin.github.io/kotlinx.serialization/kotlinx-serialization-json/kotlinx-serialization-json/kotlinx.serialization.json/-json-element/index.html

## License

JSONElement is released under an MIT license. See LICENCE for more information.
