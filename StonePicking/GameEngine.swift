//
//  GameEngine.swift
//  StonePicking
//
//  Created by Ali Atakan AKMAN on 25.11.2020.
//

import Foundation


struct GameEngine  {
    
    var randCol = Int.random(in: 0..<8)
    var randRow = Int.random(in: 0..<8)
    
    var randCol1 = Int.random(in: 0..<8)
    var randRow1 = Int.random(in: 0..<8)
    
    var randCol2 = Int.random(in: 0..<8)
    var randRow2 = Int.random(in: 0..<8)
    
    var randCol3 = Int.random(in: 0..<8)
    var randRow3 = Int.random(in: 0..<8)
    
    var randCol4 = Int.random(in: 0..<8)
    var randRow4 = Int.random(in: 0..<8)
    
    var randCol5 = Int.random(in: 0..<8)
    var randRow5 = Int.random(in: 0..<8)
    
    var randCol6 = Int.random(in: 0..<8)
    var randRow6 = Int.random(in: 0..<8)
    

    
    
    
    var stones:  Set<Stone> = Set<Stone>()
    
    mutating func moveStone(fromCol : Int , fromRow : Int , toCol : Int , toRow : Int) {
    
        if !canMoveStone(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow){
            return
        }
     
        guard let candidate = stoneAt(col: fromCol, row: fromRow) else {
            return
            
        }
        
        if let target = stoneAt(col: toCol, row: toRow){
            if target.isGreen == candidate.isGreen {
                return
            }
            stones.remove(candidate)
        }
        
        stones.remove(candidate)
        stones.insert(Stone(col: toCol, row: toRow, imageName: candidate.imageName, isGreen: candidate.isGreen))
        
    }
    
    func canMoveStone(fromCol : Int , fromRow : Int , toCol : Int , toRow : Int) -> Bool {
        if fromCol == toCol && fromRow == toRow {
            return false
        }
        return true
    }
    
    
    
    func stoneAt(col : Int , row : Int) -> Stone? {
        for stone  in stones {
            if  col == stone.col && row == stone.row {
                return stone
            }
        }
        return nil
    }
    
    
    mutating func initializeGame() {
        stones.removeAll()
        
        if randCol == randCol && randCol == randCol1 &&  randCol == randCol3 &&  randCol == randCol4
            &&  randCol == randCol5 &&  randCol == randCol6 && randRow == randRow1 && randRow == randRow2 && randRow == randRow3 && randRow == randRow4 && randRow == randRow5 && randRow == randRow6 {
            
            randCol = Int.random(in: 0..<8)
            randRow = Int.random(in: 0..<8)
        
            randCol1 = Int.random(in: 0..<8)
            randRow1 = Int.random(in: 0..<8)
            
            randCol2 = Int.random(in: 0..<8)
            randRow2 = Int.random(in: 0..<8)
            
            randCol3 = Int.random(in: 0..<8)
            randRow3 = Int.random(in: 0..<8)
            
            randCol4 = Int.random(in: 0..<8)
            randRow4 = Int.random(in: 0..<8)
            
            randCol5 = Int.random(in: 0..<8)
            randRow5 = Int.random(in: 0..<8)
            
            randCol6 = Int.random(in: 0..<8)
            randRow6 = Int.random(in: 0..<8)
            
        }else {
        
            stones.insert(Stone(col: randCol, row: randRow, imageName: "mainStone", isGreen: false))
            stones.insert(Stone(col: randCol1, row: randRow1, imageName: "stone", isGreen: true))
            stones.insert(Stone(col: randCol2, row: randRow2, imageName: "stone", isGreen: true))
            stones.insert(Stone(col: randCol3, row: randRow3, imageName: "stone", isGreen: true))
            stones.insert(Stone(col: randCol4, row: randRow4, imageName: "stone", isGreen: true))
            stones.insert(Stone(col: randCol5, row: randRow5, imageName: "stone", isGreen: true))
            stones.insert(Stone(col: randCol6, row: randRow6, imageName: "stone", isGreen: true))
        }
    }
}
