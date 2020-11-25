//
//  StoneDelegate.swift
//  StonePicking
//
//  Created by Ali Atakan AKMAN on 25.11.2020.
//

import Foundation


protocol StoneDelegate {
    
    func moveStone (fromCol : Int , fromRow: Int , toCol : Int , toRow: Int)
    func stoneAt(col : Int , row : Int) -> Stone?
    
}
