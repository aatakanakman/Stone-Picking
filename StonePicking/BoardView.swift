//
//  BoardView.swift
//  StonePicking
//
//  Created by Ali Atakan AKMAN on 25.11.2020.
//

import UIKit

class BoardView: UIView {
    
    
    
    

    let ratio : CGFloat = 0.8
    var originX: CGFloat = -10
    var originY: CGFloat = -10
    var cellSide: CGFloat = -10
    
    var shadowStones : Set<Stone> = Set<Stone>()
    var stoneDelegate : StoneDelegate? = nil
    
    var fromCol : Int? = nil
    var fromRow : Int? = nil
    
    var movingImage : UIImage? = nil
    var movingStoneX : CGFloat = -1
    var movingStoneY : CGFloat = -1
    
    
    override func draw(_ rect: CGRect) {
        
        cellSide = bounds.width * ratio / 8
        originX = bounds.width * (1-ratio) / 2
        originY = bounds.height * (1-ratio) / 2
        
        drawBoard()
        drawStone()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let first = touches.first!
        let fingerLocation = first.location(in: self)
        //print(fingerLocation)
        
        
        
        fromCol = Int((fingerLocation.x - originX) / cellSide)
        fromRow = Int((fingerLocation.y - originY) / cellSide)
        
        if let fromCol = fromCol , let fromRow = fromRow, let movingStone = stoneDelegate?.stoneAt(col: fromCol, row: fromRow){
            movingImage = UIImage(named: movingStone.imageName)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let first = touches.first!
        let fingerLocation = first.location(in: self)
        movingStoneX = fingerLocation.x
        movingStoneY = fingerLocation.y
        //print(movingStoneX,movingStoneY)
        setNeedsDisplay()
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let first = touches.first!
        let fingerLocation = first.location(in: self)
        //print(fingerLocation)
        
        
        let toCol: Int = Int((fingerLocation.x - originX) / cellSide)
        let toRow: Int = Int((fingerLocation.y - originY) / cellSide)
        
        if (abs(toCol - fromCol!) > abs(-1) || abs(toRow - fromRow!) > abs(-1) )||(toCol - fromCol! != 0  && toRow - fromRow! != 0 ) {
            fromCol = nil
            fromRow = nil
        }
        
        print(toCol,toRow)
        
        if let  fromCol = fromCol , let fromRow = fromRow, fromCol != toCol || fromRow != toRow {
            stoneDelegate?.moveStone(fromCol: fromCol , fromRow: fromRow, toCol: toCol, toRow: toRow)
        }
        movingImage = nil
        fromRow = nil
        fromCol = nil
        setNeedsDisplay()
    }
    
    func drawStone(){
        
        for stone in shadowStones { //where fromCol != stone.col || fromRow != stone.col  {
            
            if fromCol == stone.col && fromRow == stone.row {
                continue
            }
            
            let stoneImage = UIImage(named: stone.imageName)
            stoneImage?.draw(in: CGRect(x: originX + CGFloat(stone.col) * cellSide, y: originY + CGFloat(stone.row) * cellSide, width: cellSide, height: cellSide))
        }
        movingImage?.draw(in: CGRect(x: movingStoneX - cellSide/2, y: movingStoneY - cellSide/2, width: cellSide, height: cellSide))
        
        
    }
    
    // Tahta üzerine kader çizmek için.
    func drawBoard(){
        
        for row in 0..<4 {
            for col in 0..<4 {
                drawSquare(col: col*2, row: row * 2, color: UIColor.white)
                drawSquare(col: 1 + col * 2, row: row * 2 , color: UIColor.lightGray)
                drawSquare(col: col*2, row: 1 + row * 2, color: UIColor.lightGray)
                drawSquare(col: 1 + col * 2, row : 1 + row * 2 , color: UIColor.white)
            
            }
        }
    }
    
    func drawSquare(col: Int , row : Int, color : UIColor) {
        let path = UIBezierPath(rect: CGRect(x: originX + CGFloat(col) * cellSide, y: originY + CGFloat(row) * cellSide, width: cellSide, height: cellSide))
        color.setFill()
            path.fill()
    }
    


}
