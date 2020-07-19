//
//  GodAnimation.swift
//  GodAnimation
//
//  Created by Kostya Bershov on 17.07.2020.
//  Copyright © 2020 Daoinek. All rights reserved.
//

import UIKit

public final class GodAnimation {
    
    private static let shared = GodAnimation()
    let name = "GodAnimation"
    
    public static func animateView(type: AnimationType, animatedView: UIView, vc: UIViewController, complition: @escaping (_ animationDone: Bool)->Void) {
        switch type {
        case .fromLeft:
            shared.animationFromLeft(forView: animatedView, inVC: vc, complition: { _ in complition(true)})
        case .fromRight:
            shared.animationFromRight(forView: animatedView, inVC: vc, complition: { _ in complition(true)})
        case .fromTop:
            shared.animationFromTop(forView: animatedView, inVC: vc, complition: { _ in complition(true)})
        case .fromBottom:
            shared.animationFromBottom(forView: animatedView, inVC: vc, complition: { _ in complition(true)})
        case .popIn:
            shared.popInAnimation(forView: animatedView, complition: { _ in complition(true)})
        case .popOut:
            shared.popOutAnimation(forView: animatedView, complition: { _ in complition(true)})
        case .shake:
            shared.shake(view: animatedView)
            complition(true)
        case .buttonTap:
            shared.buttonTapAnimation(view: animatedView, complition: { _ in complition(true)})
        }
    }
    
    
    public static func cellAnimation(type: CellAnimationType, cell: UITableViewCell, indexPath: IndexPath, complition: @escaping (_ animationDone: Bool)->Void) {
        switch type {
        case .alpha:
            shared.cellAnimation(forCell: cell, indexPath: indexPath, animationType: .alpha, complition: { _ in complition(true)})
        case .bounce:
            shared.cellAnimation(forCell: cell, indexPath: indexPath, animationType: .bounce, complition: { _ in complition(true)})
        case .cardDrop:
            shared.cellAnimation(forCell: cell, indexPath: indexPath, animationType: .cardDrop, complition: { _ in complition(true)})
        case .dragFromRight:
            shared.cellAnimation(forCell: cell, indexPath: indexPath, animationType: .dragFromRight, complition: { _ in complition(true)})
        case .leftToRight:
            shared.cellAnimation(forCell: cell, indexPath: indexPath, animationType: .leftToRight, complition: { _ in complition(true)})
        case .linear:
            shared.cellAnimation(forCell: cell, indexPath: indexPath, animationType: .linear, complition: { _ in complition(true)})
        case .rightToLeft:
            shared.cellAnimation(forCell: cell, indexPath: indexPath, animationType: .rightToLeft, complition: { _ in complition(true)})
        case .rotate:
            shared.cellAnimation(forCell: cell, indexPath: indexPath, animationType: .rotate, complition: { _ in complition(true)})
        case .topToBottom:
            shared.cellAnimation(forCell: cell, indexPath: indexPath, animationType: .topToBottom, complition: { _ in complition(true)})
        case .wave:
            shared.cellAnimation(forCell: cell, indexPath: indexPath, animationType: .wave, complition: { _ in complition(true)})
        case .zoom:
            shared.cellAnimation(forCell: cell, indexPath: indexPath, animationType: .zoom, complition: { _ in complition(true)})
        }
    }
    
    
}

private extension GodAnimation {
    private func animationFromLeft(forView animatedView: UIView, inVC vc: UIViewController, complition: @escaping (_ animationDone: Bool)->Void) {
        let offset = CGPoint(x: -vc.view.frame.maxX, y: 0)
        let x: CGFloat = 0, y: CGFloat = 0
        animatedView.transform = CGAffineTransform(translationX: offset.x + x, y: offset.y + y)
    //    animatedView.isHidden = false
        animatedView.alpha = 0
        UIView.animate(
            withDuration: 1, delay: 0.1, usingSpringWithDamping: 0.75, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                animatedView.transform = .identity
                animatedView.alpha = 1
        }) { _ in
            complition(true)
        }
    }
    
    private func animationFromRight(forView animatedView: UIView, inVC vc: UIViewController, complition: @escaping (_ animationDone: Bool)->Void) {
        let offset = CGPoint(x: vc.view.frame.maxX, y: 0)
        let x: CGFloat = 0, y: CGFloat = 0
        animatedView.transform = CGAffineTransform(translationX: offset.x + x, y: offset.y + y)
    //    animatedView.isHidden = false
        animatedView.alpha = 0
        UIView.animate(
            withDuration: 1, delay: 0.1, usingSpringWithDamping: 0.75, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                animatedView.transform = .identity
                animatedView.alpha = 1
        }) { _ in
            complition(true)
        }
    }

    
    
    private  func animationFromTop(forView animatedView: UIView, inVC vc: UIViewController, complition: @escaping (_ animationDone: Bool)->Void) {
        let offset = CGPoint(x: 0, y: -vc.view.frame.maxY)
        let x: CGFloat = 0, y: CGFloat = 0
        animatedView.transform = CGAffineTransform(translationX: offset.x + x, y: offset.y + y)
        animatedView.isHidden = false
        UIView.animate(
            withDuration: 1, delay: 0.7, usingSpringWithDamping: 0.75, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                animatedView.transform = .identity
                animatedView.alpha = 1
        }) { _ in
                   complition(true)
            }
    }
    
    private func animationFromBottom(forView animatedView: UIView, inVC vc: UIViewController, complition: @escaping (_ animationDone: Bool)->Void) {
        let offset = CGPoint(x: 0, y: vc.view.frame.maxY)
        let x: CGFloat = 0, y: CGFloat = 0
        animatedView.transform = CGAffineTransform(translationX: offset.x + x, y: offset.y + y)
        animatedView.isHidden = false
        UIView.animate(
            withDuration: 1, delay: 0.7, usingSpringWithDamping: 0.75, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                animatedView.transform = .identity
                animatedView.alpha = 1
        }) { _ in
                   complition(true)
               }
    }
    
    private func popInAnimation(forView animatedView: UIView, complition: @escaping (_ animationDone: Bool)->Void) {
        animatedView.alpha = 0
        animatedView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        UIView.animate(
            withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                animatedView.transform = .identity
                animatedView.alpha = 1
        })  { _ in
                   complition(true)
               }
    }
    
    private func startLogoAnimation(forView animatedView: UIView, complition: @escaping (_ animationDone: Bool)->Void) {
        animatedView.alpha = 0
        animatedView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        UIView.animate(
            withDuration: 1.8, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                animatedView.transform = .identity
                animatedView.alpha = 1
        }) { _ in
                   complition(true)
               }
    }
    
    private func popOutAnimation(forView animatedView: UIView, complition: @escaping (_ animationDone: Bool)->Void) {
        animatedView.alpha = 1
     //   animatedView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        UIView.animate(
            withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                animatedView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
             //   animatedView.transform = .identity
                animatedView.alpha = 0
        }, completion: {_ in
            animatedView.transform = .identity
            complition(true)
        })
    }
    
    private func shake(view: UIView) {
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
    
    private func buttonTapAnimation(view: UIView, complition: @escaping (_ animationDone: Bool)->Void) {
        UIView.animate(withDuration: 0.1,
        animations: {
            view.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        },
        completion: { _ in
            UIView.animate(withDuration: 0.1) {
                view.transform = CGAffineTransform.identity
            }
            complition(true)
        })
    }

    private func cellAnimation(forCell cell: UITableViewCell, indexPath: IndexPath, animationType: CellAnimationType, complition: @escaping (_ animationDone: Bool)->Void) {
        switch animationType {
        case .alpha:
            cell.alpha = 0
            UIView.animate(withDuration: 0.5, delay: 0.05 * Double(indexPath.row), animations: {
                cell.alpha = 1
            }) { _ in complition(true)}
        case .wave:
            cell.transform = CGAffineTransform(translationX: cell.contentView.frame.width, y: 0)
            UIView.animate(withDuration: 4, delay: 0.05 * Double(indexPath.row), usingSpringWithDamping: 0.4, initialSpringVelocity: 0.1,
                           options: .curveEaseIn, animations: {
                            cell.transform = CGAffineTransform(translationX: cell.contentView.frame.width, y: cell.contentView.frame.height)
            }) { _ in complition(true)}
        case .leftToRight:
            cell.transform = CGAffineTransform(translationX: 0, y: cell.contentView.frame.height)
            UIView.animate(withDuration: 0.5, delay: 0.05 * Double(indexPath.row), animations: {
                cell.transform = CGAffineTransform(translationX: cell.contentView.frame.width, y: cell.contentView.frame.height)
            }) { _ in complition(true)}
        case .topToBottom:
            cell.transform = CGAffineTransform(translationX: cell.contentView.frame.width, y: 0)
            UIView.animate(withDuration: 0.5, delay: 0.05 * Double(indexPath.row), animations: {
                cell.transform = CGAffineTransform(translationX: cell.contentView.frame.width, y: cell.contentView.frame.height)
            }) { _ in complition(true)}
        case .bounce:
            cell.transform = CGAffineTransform(translationX: cell.contentView.frame.width, y: 0)
            UIView.animate(withDuration: 0.5, delay: 0.05 * Double(indexPath.row), usingSpringWithDamping: 0.4, initialSpringVelocity: 0.1,
                           options: .curveEaseIn, animations: {
                            cell.transform = CGAffineTransform(translationX: cell.contentView.frame.width, y: cell.contentView.frame.height)
            }) { _ in complition(true)}
        case .rightToLeft:
            cell.transform = CGAffineTransform(translationX: cell.contentView.frame.width, y: 0)
            UIView.animate(
                withDuration: 0.5,
                delay: 0.05 * Double(indexPath.row),
                options: [.curveEaseInOut],
                animations: {
                    cell.transform = CGAffineTransform(translationX: 0, y: 0)
            }) { _ in complition(true)}
        case .rotate:
            cell.transform = CGAffineTransform(rotationAngle: 360)
            UIView.animate(withDuration: 0.5, delay: 0.05 * Double(indexPath.row), animations: {
                    cell.transform = CGAffineTransform(rotationAngle: 0.0)
            }) { _ in complition(true)}
        case .linear:
            cell.transform = CGAffineTransform(translationX: cell.contentView.frame.width, y: cell.contentView.frame.height)
            UIView.animate(
                withDuration: 0.5,
                delay: 0.05 * Double(indexPath.row),
                options: [.curveLinear],
                animations: {
                    cell.transform = CGAffineTransform(translationX: 0, y: 0)
            }) { _ in complition(true)}
        case .zoom:
            cell.transform = CGAffineTransform(scaleX: 0, y : 0)
            UIView.animate(withDuration: 0.5, animations: {
                cell.transform = CGAffineTransform(scaleX: 1, y : 1)
            }) { _ in complition(true)}
        case .dragFromRight:
            cell.center.x += 200
            UIView.animate(withDuration: 0.5, delay: 0.05 * Double(indexPath.row), animations: {
                cell.center.x -= 200
            }) { _ in complition(true)}
        case .cardDrop:
            let view = cell.contentView
            view.layer.transform = GodAnimation.TipInCellAnimatorStartTransform
            view.layer.opacity = 0.8
            UIView.animate(withDuration: 0.5, animations: {
                view.layer.transform = CATransform3DIdentity
                view.layer.opacity = 1
            }) { _ in complition(true)}
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
