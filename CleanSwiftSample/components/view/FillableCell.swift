//
//  FillableCell.swift
//  CleanSwiftSample
//
//  Created by Edu Rodriguez on 12/1/22.
//

import Foundation

protocol FillableCell {
    
    associatedtype DataType: EntityProtocol
    
    func fill(with data: DataType)
}
