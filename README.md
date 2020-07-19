# GodAnimation
Simple animation for your views and cells

[![Generic badge](https://cocoapod-badges.herokuapp.com/v/GodAnimation/0.0.1/badge.png)](https://cocoapods.org/pods/GodAnimation)
[![made-with-swift](https://img.shields.io/badge/Made%20with-Swift-1f425f.svg)](https://developer.apple.com/swift/)
[![GitHub license](https://img.shields.io/github/license/daoinek/GodAnimation.svg)](https://github.com/daoinek/GodAnimation/blob/master/LICENSE)

!!!! It's a new pod. Description will be later

[TOC]

# Installation

GodAnimation is available through CocoaPods. To install it, simply add the following line to your Podfile:
```sh
pod "GodAnimation"
```

# Usage

At first, import GodAnimation in your swift file.
```sh
import "GodAnimation"
```

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


### Animation type

- fromLeft
- fromRight
- fromTop
- fromBottom
- popIn
- popOut
- shake
- buttonTap

## Cells animation

Show sample code:
```sh
GodAnimation.cellAnimation(type: .cardDrop, cell: cell, indexPath: IndexPath) { (status) in
            print("Animation done.")
        }
```

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
