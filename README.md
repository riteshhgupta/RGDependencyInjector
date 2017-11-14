# RGDependencyInjector

## Depedency Injection

`Dependency Injection` is a style of object configuration in which an object's properties are set by an external entity. In other words objects are configured by an external entity, which is an alternative to having the object configure itself. You can read more about it in one of [Martin Fowler's articles](https://www.martinfowler.com/articles/injection.html)!

## About

`RGDependencyInjector` lets you inject dependencies in a `class` which is otherwise difficult to initialize due to framework limitations. It uses a protocol based approach which makes it easy to **adopt** and **extend**. There's no magic happening of any sort anywhere, it's a very lightweight µ-framework which you can browse easily!

## Example

Let's say we have a class `ViewController` which is expecting an outside entity to set it's `items` property. To achieve this, we need to make `ViewController` implement `InjectableController` protocol. `InjectableController` is a generic protocol which expects a `Dependency` type, in this case it's `ViewControllerDependency` which has all the properties required by `ViewController`.

```swift
final class ViewController: UIViewController {

	// dependent property, which needs to be configured from outside
	var items: [String]!
	...
}

extension ViewController: InjectableController {

	// it lets you define a model which represents the dependency
	typealias Dependency = ViewControllerDependency

	// this is where you can hookup all the dependencies/bindings
	func inject(_ dependency: ViewControllerDependency) {
		items = dependency.items
	}

	// these two properties are required to get a controller's instance from a storyboard
	static var storyboardName: String { return "Main" }
	static var storyboardId: String { return "ViewController" }
}

// model which represents ViewController's dependency
struct ViewControllerDependency {

	let items: [String]
}
```
 
Once we are done with the implementation, we get a simple api to get an instance which has all the injected properties,

```swift
// create the dependency
let fruits = ["apple", "banana", "orange"]
let dependency = ViewControllerDependency(items: fruits)

// inject the above dependency into `injectableInstance(:)`
let controller = ViewController.injectableInstance(dependency: dependency)

```

`ViewController.injectableInstance(dependency: dependency)` is the final api which will return the required controller with injected properties.

## Custom Injectors

If you are interested in making custom injectors to suit your needs then you simply need to make a new protocol which should inherit `Injectable`, e.g.

```
protocol InjectableViewModel: Injectable {
	...
}
```

## Installation

### Cocoapods

To integrate RGDependencyInjector into your Xcode project using CocoaPods, specify it in your Podfile,

```
  pod 'RGDependencyInjector', :git => 'https://github.com/riteshhgupta/RGDependencyInjector.git'
```

## Contributing

Contributions are welcome and encouraged! Open an [issue](https://github.com/riteshhgupta/RGDependencyInjector/issues/new) or submit a [pull request](https://github.com/riteshhgupta/RGDependencyInjector/compare) 🚀

## Licence

RGDependencyInjector is available under the MIT license. See the LICENSE file for more info.
