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
    
    var randCol7 = 1//Int.random(in: 0..<8)
    var randRow7 = 8//Int.random(in: 0..<8)
    
    var randCol8 = 2//Int.random(in: 0..<8)
    var randRow8 = 8//Int.random(in: 0..<8)
    
    var randCol9 = 3//Int.random(in: 0..<8)
    var randRow9 = 8//Int.random(in: 0..<8)
    
    var randCol10 = 4//Int.random(in: 0..<8)
    var randRow10 = 8//Int.random(in: 0..<8)
    
    var randCol11 = 5//Int.random(in: 0..<8)
    var randRow11 = 8//Int.random(in: 0..<8)
    
    var randCol12 = 6//Int.random(in: 0..<8)
    var randRow12 = 8//Int.random(in: 0..<8)
    
    var randCol13 = 7//Int.random(in: 0..<8)
    var randRow13 = 8//Int.random(in: 0..<8)
    
    var randCol14 = 0//Int.random(in: 0..<8)
    var randRow14 = 8//Int.random(in: 0..<8)
    

    
    
    
    var stones:  Set<Stone> = Set<Stone>()
    
    mutating func moveStone(fromCol : Int , fromRow : Int , toCol : Int , toRow : Int) {
        
        
    
        if !canMoveStone(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow){
            return
        }
        if  fromCol == toCol && fromRow == toRow { //Engellemek için kullanılabilr.
            return
        }
     
        guard let candidate = stoneAt(col: fromCol, row: fromRow)else {
            return
            
        }
        
        if let barrier = stoneAt(col: fromRow, row: fromCol){
            if barrier.isBarrier == true{
               
            }
        }
        if let target = stoneAt(col: toCol, row: toRow){
            if target.isGreen == candidate.isGreen {
                return
            }
            stones.remove(candidate)
        }
        
        stones.remove(candidate)
        stones.insert(Stone(col: toCol, row: toRow, imageName: candidate.imageName, isGreen: candidate.isGreen, isBarrier: candidate.isBarrier))
        
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
            
//            randCol7 = Int.random(in: 0..<8)
//            randRow7 = Int.random(in: 0..<8)
//
//            randCol8 = Int.random(in: 0..<8)
//            randRow8 = Int.random(in: 0..<8)
//
//            randCol9 = Int.random(in: 0..<8)
//            randRow9 = Int.random(in: 0..<8)
//
//            randCol10 = Int.random(in: 0..<8)
//            randRow10 = Int.random(in: 0..<8)
//
//            randCol11 = Int.random(in: 0..<8)
//            randRow11 = Int.random(in: 0..<8)
//
//            randCol12 = Int.random(in: 0..<8)
//            randRow12 = Int.random(in: 0..<8)
//
//            randCol13 = Int.random(in: 0..<8)
//            randRow13 = Int.random(in: 0..<8)
            

            
        }else {
        
            stones.insert(Stone(col: randCol, row: randRow, imageName: "mainStone", isGreen: false, isBarrier: false))
            stones.insert(Stone(col: randCol1, row: randRow1, imageName: "stone", isGreen: true, isBarrier: false))
            stones.insert(Stone(col: randCol2, row: randRow2, imageName: "stone", isGreen: true, isBarrier: false))
            stones.insert(Stone(col: randCol3, row: randRow3, imageName: "stone", isGreen: true, isBarrier: false))
            stones.insert(Stone(col: randCol4, row: randRow4, imageName: "stone", isGreen: true, isBarrier: false))
            stones.insert(Stone(col: randCol5, row: randRow5, imageName: "stone", isGreen: true, isBarrier: false))
            stones.insert(Stone(col: randCol6, row: randRow6, imageName: "stone", isGreen: true, isBarrier: false))
            
            stones.insert(Stone(col: randCol7, row: randRow7, imageName: "stone2", isGreen: true, isBarrier: true))
            stones.insert(Stone(col: randCol8, row: randRow8, imageName: "stone2", isGreen: true, isBarrier: true))
            stones.insert(Stone(col: randCol9, row: randRow9, imageName: "stone2", isGreen: true, isBarrier: true))
            stones.insert(Stone(col: randCol10, row: randRow10, imageName: "stone2", isGreen: true, isBarrier: true))
            stones.insert(Stone(col: randCol11, row: randRow11, imageName: "stone2", isGreen: true, isBarrier: true))
            stones.insert(Stone(col: randCol12, row: randRow12, imageName: "stone2", isGreen: true, isBarrier: true))
            stones.insert(Stone(col: randCol13, row: randRow13, imageName: "stone2", isGreen: true, isBarrier: true))
            stones.insert(Stone(col: randCol14, row: randRow14, imageName: "stone2", isGreen: true, isBarrier: true))
        }
    }
}
