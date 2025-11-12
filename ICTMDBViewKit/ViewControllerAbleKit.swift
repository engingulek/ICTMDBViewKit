//
//  ViewControllerAbleKit.swift
//  ICTMDBViewKit
//
//  Created by Engin Gülek on 11.11.2025.
//

import UIKit

public protocol UIViewAble {
    func setBackColorAble(color:String)
}

public extension UIViewAble where Self : UIViewController  {
    @MainActor public func setBackColorAble(color:String){
        view.backgroundColor = UIColor(name: color)
    }
}


//MARK: - SegueAble
// Adjusting navigation between View Controllers
public protocol SegueAble {
    func pushViewControllerAble (_ vc:UIViewController,animated:Bool)

}

extension SegueAble  where Self : UIViewController{
    /// Pushviewcontroller between ViewControllers
    public func pushViewControllerAble (_ vc:UIViewController,animated:Bool) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            navigationController?.pushViewController(vc, animated: animated)
        }
    }
}


//MARK: - NavConUIAble
/// Setting navigation controller contents
public protocol NavConUIAble {
    /// Set navigation title
    func setNavigationTitle(title:String)
}

extension NavConUIAble where Self : UIViewController  {
   public func setNavigationTitle(title:String) {
        navigationItem.title = title
    }
}

