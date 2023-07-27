//
//  AnimationEnums.swift
//  AnimationEnums
//
//  Created by Kostya Bershov on 17.07.2020.
//  Copyright © 2020 Daoinek. All rights reserved.
//

import Foundation

public enum AnimationType {
    case fromLeft
    case fromRight
    case fromTop
    case fromBottom
    case popIn
    case popOut
    case shake
    case buttonTap
    case toLeft
    case toRight
    case toTop
    case toBottom
}

public enum CellAnimationType: String {
    case alpha
    case wave
    case leftToRight
    case topToBottom
    case bounce
    case rightToLeft
    case rotate
    case linear
    case zoom
    case cardDrop
    case dragFromRight
}
