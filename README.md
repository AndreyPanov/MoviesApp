# MoviesApp
Example application shows production architecture approach.
Navigation logic driven by the `Coordinator` [My explanation](https://medium.com/blacklane-engineering/coordinators-essential-tutorial-part-i-376c836e9ba7). Coordinator uses `Factory` for modules' building and `Router` for 'push' action.
In this example we have 2 modules for search and and for MovieList. Every module consists of `Presenter`(orchestrate business logic), `Repository` (responsible for storage and communication with server) and `ViewController` (responsible for user interaction, passive, just notify presenter what's going on).
`Presenters` cover by unit test.
`ViewModel` use for prepare data for cell's representation and load images.

##Update: Added Mock classes for functions' order check and parameters' check

##Pods
- [TableKit](https://github.com/maxsokolov/TableKit) TableKit is a super lightweight yet powerful generic library that allows you to build complex table views in a declarative type-safe manner.
- [Alamofire](https://github.com/Alamofire/Alamofire) HTTP networking library written in Swift.
- [SwiftyUserDefaults](https://github.com/radex/SwiftyUserDefaults) SwiftyUserDefaults makes user defaults enjoyable to use by combining expressive Swifty API with the benefits of static typing. Define your keys in one place, use value types easily, and get extra safety and convenient compile-time checks for free.
- [Unbox](https://github.com/JohnSundell/Unbox) Unbox is an easy to use Swift JSON decoder.
- [MBProgressHUD](https://github.com/jdg/MBProgressHUD) iOS drop-in class that displays a translucent HUD with an indicator and/or labels while work is being done in a background thread. The HUD is meant as a replacement for the undocumented, private UIKit UIProgressHUD with some additional features.
