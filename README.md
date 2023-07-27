# GodAnimation
Simple animation for your views and cells

[![Generic badge](https://cocoapod-badges.herokuapp.com/v/GodAnimation/0.0.1/badge.png)](https://cocoapods.org/pods/GodAnimation)
[![swift-package-manager](https://img.shields.io/badge/package%20manager-compatible-brightgreen.svg?logo=data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPHN2ZyB3aWR0aD0iNjJweCIgaGVpZ2h0PSI0OXB4IiB2aWV3Qm94PSIwIDAgNjIgNDkiIHZlcnNpb249IjEuMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayI+CiAgICA8IS0tIEdlbmVyYXRvcjogU2tldGNoIDYzLjEgKDkyNDUyKSAtIGh0dHBzOi8vc2tldGNoLmNvbSAtLT4KICAgIDx0aXRsZT5Hcm91cDwvdGl0bGU+CiAgICA8ZGVzYz5DcmVhdGVkIHdpdGggU2tldGNoLjwvZGVzYz4KICAgIDxnIGlkPSJQYWdlLTEiIHN0cm9rZT0ibm9uZSIgc3Ryb2tlLXdpZHRoPSIxIiBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiPgogICAgICAgIDxnIGlkPSJHcm91cCIgZmlsbC1ydWxlPSJub256ZXJvIj4KICAgICAgICAgICAgPHBvbHlnb24gaWQ9IlBhdGgiIGZpbGw9IiNEQkI1NTEiIHBvaW50cz0iNTEuMzEwMzQ0OCAwIDEwLjY4OTY1NTIgMCAwIDEzLjUxNzI0MTQgMCA0OSA2MiA0OSA2MiAxMy41MTcyNDE0Ij48L3BvbHlnb24+CiAgICAgICAgICAgIDxwb2x5Z29uIGlkPSJQYXRoIiBmaWxsPSIjRjdFM0FGIiBwb2ludHM9IjI3IDI1IDMxIDI1IDM1IDI1IDM3IDI1IDM3IDE0IDI1IDE0IDI1IDI1Ij48L3BvbHlnb24+CiAgICAgICAgICAgIDxwb2x5Z29uIGlkPSJQYXRoIiBmaWxsPSIjRUZDNzVFIiBwb2ludHM9IjEwLjY4OTY1NTIgMCAwIDE0IDYyIDE0IDUxLjMxMDM0NDggMCI+PC9wb2x5Z29uPgogICAgICAgICAgICA8cG9seWdvbiBpZD0iUmVjdGFuZ2xlIiBmaWxsPSIjRjdFM0FGIiBwb2ludHM9IjI3IDAgMzUgMCAzNyAxNCAyNSAxNCI+PC9wb2x5Z29uPgogICAgICAgIDwvZz4KICAgIDwvZz4KPC9zdmc+)](https://github.com/daoinek/GodAnimation.git)
[![made-with-swift](https://img.shields.io/badge/Made%20with-Swift-1f425f.svg)](https://developer.apple.com/swift/)
[![GitHub license](https://img.shields.io/github/license/daoinek/GodAnimation.svg)](https://github.com/daoinek/GodAnimation/blob/master/LICENSE)

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
pod 'GodAnimation'
```
Upd. Swift Package Manager link:
```sh
https://github.com/daoinek/GodAnimation.git
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
GodAnimation.animateView(type: .fromLeft, animatedView: view, vc: self) { }
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
GodAnimation.cellAnimation(type: .cardDrop, cell: cell, indexPath: IndexPath) { }
```

Parameter  | Description
------------- | -------------
type  | animation type
cell  | cell to be animated
IndexPath  | cell indexPath


Real use example:
```sh
func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if !shownIndexes.contains(indexPath) {
            shownIndexes.append(indexPath)

            GodAnimation.cellAnimation(type: .zoom, cell: cell, indexPath: indexPath) { print("Animation done.") }
        }
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

| Animation name | Example | Animation name | Example |
| ------ | ------ | ------ | ------ |
| alpha | ![alpha](https://media.giphy.com/media/ZA5zxKxgVwztWQd912/giphy.gif) | wave | ![wave](https://media.giphy.com/media/UtErDpwAFxEOE2ewBN/giphy.gif) |
| leftToRight | ![leftToRight](https://media.giphy.com/media/hsUcoWEJY03FJMa9wy/giphy.gif) | topToBottom | ![topToBottom](https://media.giphy.com/media/RhSZo6S4cjTBYvMB4x/giphy.gif) |
| bounce | ![bounce](https://media.giphy.com/media/MdLwiotWzB2CpT0I2h/giphy.gif) | rightToLeft | ![rightToLeft](https://media.giphy.com/media/dwFFQ2kqxKLXvUFPRf/giphy.gif) |
| rotate | ![rotate](https://media.giphy.com/media/VIujYx2j6a9K1bHNRv/giphy.gif) | linear | ![linear](https://media.giphy.com/media/U1asbSaMcvoAEy5C1l/giphy.gif) |
| zoom | ![zoom](https://media.giphy.com/media/fXPhX15rj5s39aJdoJ/giphy.gif) | cardDrop | ![cardDrop](https://media.giphy.com/media/YQN9qDgHNCBiVELKMh/giphy.gif) |
| dragFromRight | ![dragFromRight](https://media.giphy.com/media/KdC0bZyEL8jPbnFbVM/giphy.gif) |
