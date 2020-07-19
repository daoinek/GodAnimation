# GodAnimation
Simple animation for your views and cells

[![Generic badge](https://cocoapod-badges.herokuapp.com/v/GodAnimation/0.0.1/badge.png)](https://cocoapods.org/pods/GodAnimation)
[![made-with-swift](https://img.shields.io/badge/Made%20with-Swift-1f425f.svg)](https://developer.apple.com/swift/)
[![GitHub license](https://img.shields.io/github/license/daoinek/GodAnimation.svg)](https://github.com/daoinek/GodAnimation/blob/master/LICENSE)

!!!! It's a new pod. Description will be later

**Table of Contents**

+ [ Installation ](#install)
+ [ Usage ](#usage)
    + [ View animation ](#view)
        + [ Animation type ](#view-type)
    + [ Cell animation ](#cell)
        + [ Animation type ](#cell-type)
        

<a name="install"></a>
# Installation

GodAnimation is available through CocoaPods. To install it, simply add the following line to your Podfile:
```sh
pod "GodAnimation"
```
<a name="usage"></a>
# Usage

At first, import GodAnimation in your swift file.
```sh
import "GodAnimation"
```

<a name="view"></a>
## View animation

Show sample code:
```sh
GodAnimation.animateView(type: .fromLeft, animatedView: view, vc: self) { (status) in
            print("Animation done.")
        }
```

Parameter  | Description
------------- | -------------
type  | animation type
animatedView  | view to be animated
vc  | ViewController where the animated view is located


<a name="view-type"></a>
### Animation type

- fromLeft
- fromRight
- fromTop
- fromBottom
- popIn
- popOut
- shake
- buttonTap

| Animation name | Example | Animation name | Example |
| ------ | ------ | ------ | ------ |
| fromLeft | ![fromLeft](https://media.giphy.com/media/TJODNeZLP8PFjuaeQB/giphy.gif) | fromTop | ![fromTop](https://media.giphy.com/media/cJBZO1hyKj9q3ILP2E/giphy.gif) |
| fromRight | ![fromRight](https://media.giphy.com/media/cJ9uWwwjxWNNv5K1Sd/giphy.gif) | fromBottom | ![fromBottom](https://media.giphy.com/media/XZxuxIg3uxmIr7kxU5/giphy.gif) |
| popIn | ![popIn](https://media.giphy.com/media/kHsM8FowBQ0M0vVqAh/giphy.gif) | popOut | ![popOut](https://media.giphy.com/media/l4qBkbmFv80EcEuKrR/giphy.gif) |
| shake | ![shake](https://media.giphy.com/media/j03konJGTCv8QKniea/giphy.gif) | buttonTap | ![buttonTap](https://media.giphy.com/media/l4qBkbmFv80EcEuKrR/giphy.gf) |

<a name="cell"></a>
## Cells animation

Show sample code:
```sh
GodAnimation.cellAnimation(type: .cardDrop, cell: cell, indexPath: IndexPath) { (status) in
            print("Animation done.")
        }
```

<a name="cell-type"></a>
### Animation type

- alpha
- wave
- leftToRight
- topToBottom
- bounce
- rightToLeft
- rotate
- linear
- zoom
- cardDrop
- dragFromRight
