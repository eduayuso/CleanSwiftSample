//
//  AppViewController.swift
//  CleanSwiftSample
//
//  Created by Edu Rodriguez on 11/1/22.
//

import UIKit

protocol PresentableView {
    
    associatedtype PresenterType
    
    var presenter: PresenterType { get set }
}

