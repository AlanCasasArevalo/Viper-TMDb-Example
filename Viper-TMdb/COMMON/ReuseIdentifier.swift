//
//  ReuseIdentifier.swift
//  Viper-TMdb
//
//  Created by Alan Casas on 19/04/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation
import UIKit

public protocol ReuseIdentifierInterface : class{
    static var defaultReuseIdentifier : String { get }
}

public protocol ReuseIdentifierInterfaceViewController : class{
    static var defaultReuseIdentifierViewController : String {get}
}

public extension ReuseIdentifierInterface where Self : UIView{
    static var defaultReuseIdentifier : String{
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}

public extension ReuseIdentifierInterfaceViewController where Self : UIViewController{
    static var defaultReuseIdentifierViewController : String{
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
