//
//  GodAnimation.swift
//  GodAnimation
//
//  Created by Kostya Bershov on 17.07.2020.
//  Copyright © 2020 Daoinek. All rights reserved.
//

import UIKit

public final class GodAnimation {
    let name = "GodAnimation"
    
    public static func animateView(type: AnimationType, delay: CGFloat = 0.1, animatedView: UIView, vc: UIViewController, complition: @escaping ()->Void) {
        switch type {
        case .popIn:
            popInAnimation(forView: animatedView, delay: delay, complition: {  complition()})
        case .popOut:
            popOutAnimation(forView: animatedView, delay: delay, complition: {  complition()})
        case .fromLeft, .fromRight, .fromTop, .fromBottom:
            horizonAnimation(type: type, delay: delay, forView: animatedView, inVC: vc, complition: {  complition()})
        case .shake:
            shake(view: animatedView)
            complition()
        case .buttonTap:
            buttonTapAnimation(view: animatedView, complition: {  complition()})
        case .toLeft, .toRight, .toBottom, .toTop:
            hideAnimation(type: type, delay: delay, forView: animatedView, inVC: vc, complition: {  complition()})
        }
    }
    
    
    public static func cellAnimation(type: CellAnimationType, cell: UITableViewCell, indexPath: IndexPath, complition: @escaping ()->Void) {
        cellAnimation(forCell: cell, indexPath: indexPath, animationType: type, complition: {  complition()})
    }
    
    
}

private extension GodAnimation {
    private static func horizonAnimation(type: AnimationType, delay: CGFloat, forView animatedView: UIView, inVC vc: UIViewController, complition: @escaping ()->Void) {
        var offset: CGPoint!
        switch type {
        case .fromLeft:
            offset = CGPoint(x: -vc.view.frame.maxX, y: 0)
        case .fromRight:
            offset = CGPoint(x: vc.view.frame.maxX, y: 0)
        case .fromTop:
            offset = CGPoint(x: 0, y: -vc.view.frame.maxY)
        case .fromBottom:
            offset = CGPoint(x: 0, y: vc.view.frame.maxY)
        default: break
        }
        let x: CGFloat = 0, y: CGFloat = 0
        animatedView.transform = CGAffineTransform(translationX: offset.x + x, y: offset.y + y)
        animatedView.alpha = 0
        UIView.animate(
            withDuration: 1, delay: delay, usingSpringWithDamping: 0.75, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                animatedView.transform = .identity
                animatedView.alpha = 1
        }) { _ in
            complition()
        }
    }
    
    private static func hideAnimation(type: AnimationType, delay: CGFloat, forView animatedView: UIView, inVC vc: UIViewController, complition: @escaping ()->Void) {
        var offset: CGPoint!
        switch type {
        case .toLeft:
            offset = CGPoint(x: -vc.view.frame.maxX, y: 0)
        case .toRight:
            offset = CGPoint(x: vc.view.frame.maxX, y: 0)
        case .toTop:
            offset = CGPoint(x: 0, y: -vc.view.frame.maxY)
        case .toBottom:
            offset = CGPoint(x: 0, y: vc.view.frame.maxY)
        default: break
        }
        let x: CGFloat = 0, y: CGFloat = 0
        UIView.animate(
            withDuration: 1, delay: delay, usingSpringWithDamping: 0.75, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                animatedView.transform = CGAffineTransform(translationX: offset.x + x, y: offset.y + y)
                animatedView.alpha = 0
        }) { _ in
            complition()
        }
    }
    
    private static func popInAnimation(forView animatedView: UIView, delay: CGFloat, complition: @escaping ()->Void) {
        animatedView.alpha = 0
        animatedView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        UIView.animate(
            withDuration: 0.5, delay: delay, usingSpringWithDamping: 0.75, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                animatedView.transform = .identity
                animatedView.alpha = 1
        })  { _ in
                   complition()
               }
    }
    
    private static func startLogoAnimation(forView animatedView: UIView, complition: @escaping ()->Void) {
        animatedView.alpha = 0
        animatedView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        UIView.animate(
            withDuration: 1.8, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                animatedView.transform = .identity
                animatedView.alpha = 1
        }) { _ in
                   complition()
               }
    }
    
    private static func popOutAnimation(forView animatedView: UIView, delay: CGFloat, complition: @escaping ()->Void) {
        animatedView.alpha = 1
        UIView.animate(
            withDuration: 0.5, delay: delay, usingSpringWithDamping: 0.75, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                animatedView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                animatedView.alpha = 0
        }, completion: {_ in
            animatedView.transform = .identity
            complition()
        })
    }
    
    private static func shake(view: UIView) {
      let midX = view.center.x
      let midY = view.center.y

      let animation = CABasicAnimation(keyPath: "position")
      animation.duration = 0.06
      animation.repeatCount = 4
      animation.autoreverses = true
      animation.fromValue = CGPoint(x: midX - 10, y: midY)
      animation.toValue = CGPoint(x: midX + 10, y: midY)
      view.layer.add(animation, forKey: "position")
    }
    
    private static func buttonTapAnimation(view: UIView, complition: @escaping ()->Void) {
        UIView.animate(withDuration: 0.1,
        animations: {
            view.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        },
        completion: { _ in
            UIView.animate(withDuration: 0.1) {
                view.transform = CGAffineTransform.identity
            }
            complition()
        })
    }

    private  static func cellAnimation(forCell cell: UITableViewCell, indexPath: IndexPath, animationType: CellAnimationType, complition: @escaping ()->Void) {
        switch animationType {
        case .alpha:
            cell.alpha = 0
            UIView.animate(withDuration: 0.5, delay: 0.05 * Double(indexPath.row), animations: {
                cell.alpha = 1
            }) { _ in complition()}
        case .wave:
            cell.transform = CGAffineTransform(translationX: cell.contentView.frame.width, y: 0)
            UIView.animate(withDuration: 4, delay: 0.05 * Double(indexPath.row), usingSpringWithDamping: 0.4, initialSpringVelocity: 0.1,
                           options: .curveEaseIn, animations: {
                            cell.transform = CGAffineTransform(translationX: cell.contentView.frame.width, y: cell.contentView.frame.height)
            }) { _ in complition()}
        case .leftToRight:
            cell.transform = CGAffineTransform(translationX: 0, y: cell.contentView.frame.height)
            UIView.animate(withDuration: 0.5, delay: 0.05 * Double(indexPath.row), animations: {
                cell.transform = CGAffineTransform(translationX: cell.contentView.frame.width, y: cell.contentView.frame.height)
            }) { _ in complition()}
        case .topToBottom:
            cell.transform = CGAffineTransform(translationX: cell.contentView.frame.width, y: 0)
            UIView.animate(withDuration: 0.5, delay: 0.05 * Double(indexPath.row), animations: {
                cell.transform = CGAffineTransform(translationX: cell.contentView.frame.width, y: cell.contentView.frame.height)
            }) { _ in complition()}
        case .bounce:
            cell.transform = CGAffineTransform(translationX: cell.contentView.frame.width, y: 0)
            UIView.animate(withDuration: 0.5, delay: 0.05 * Double(indexPath.row), usingSpringWithDamping: 0.4, initialSpringVelocity: 0.1,
                           options: .curveEaseIn, animations: {
                            cell.transform = CGAffineTransform(translationX: cell.contentView.frame.width, y: cell.contentView.frame.height)
            }) { _ in complition()}
        case .rightToLeft:
            cell.transform = CGAffineTransform(translationX: cell.contentView.frame.width, y: 0)
            UIView.animate(
                withDuration: 0.5,
                delay: 0.05 * Double(indexPath.row),
                options: [.curveEaseInOut],
                animations: {
                    cell.transform = CGAffineTransform(translationX: 0, y: 0)
            }) { _ in complition()}
        case .rotate:
            cell.transform = CGAffineTransform(rotationAngle: 360)
            UIView.animate(withDuration: 0.5, delay: 0.05 * Double(indexPath.row), animations: {
                    cell.transform = CGAffineTransform(rotationAngle: 0.0)
            }) { _ in complition()}
        case .linear:
            cell.transform = CGAffineTransform(translationX: cell.contentView.frame.width, y: cell.contentView.frame.height)
            UIView.animate(
                withDuration: 0.5,
                delay: 0.05 * Double(indexPath.row),
                options: [.curveLinear],
                animations: {
                    cell.transform = CGAffineTransform(translationX: 0, y: 0)
            }) { _ in complition()}
        case .zoom:
            cell.transform = CGAffineTransform(scaleX: 0, y : 0)
            UIView.animate(withDuration: 0.5, animations: {
                cell.transform = CGAffineTransform(scaleX: 1, y : 1)
            }) { _ in complition()}
        case .dragFromRight:
            cell.center.x += 200
            UIView.animate(withDuration: 0.5, delay: 0.05 * Double(indexPath.row), animations: {
                cell.center.x -= 200
            }) { _ in complition()}
        case .cardDrop:
            let view = cell.contentView
            view.layer.transform = GodAnimation.TipInCellAnimatorStartTransform
            view.layer.opacity = 0.8
            UIView.animate(withDuration: 0.5, animations: {
                view.layer.transform = CATransform3DIdentity
                view.layer.opacity = 1
            }) { _ in complition()}
        }
    }
    
    private static let TipInCellAnimatorStartTransform: CATransform3D = {
        let rotationDegrees: CGFloat = -15.0
        let rotationRadians: CGFloat = rotationDegrees * (CGFloat(Double.pi)/180.0)
        let offset = CGPoint(x: -20, y: -20)
        var startTransform = CATransform3DIdentity
        startTransform = CATransform3DRotate(CATransform3DIdentity,
                                             rotationRadians, 0.0, 0.0, 1.0)
        startTransform = CATransform3DTranslate(startTransform, offset.x, offset.y, 0.0)
        
        return startTransform
    }()
}
