//
//  ViewController.swift
//  StonePicking
//
//  Created by Ali Atakan AKMAN on 25.11.2020.
//

import UIKit

class ViewController: UIViewController , StoneDelegate{
    
    
    var gameEngine : GameEngine = GameEngine()

    @IBOutlet weak var boardView: BoardView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        boardView.stoneDelegate = self
       
        
        
        
        

    }

    func moveStone(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) {
        gameEngine.moveStone(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        boardView.shadowStones = gameEngine.stones
        boardView.setNeedsDisplay()
    }
    
    func stoneAt(col: Int, row: Int) -> Stone? {
        return gameEngine.stoneAt(col: col, row: row)
    }
    
    
    @IBAction func resetBtn(_ sender: Any) {
        gameEngine.initializeGame()
        boardView.shadowStones = gameEngine.stones
        boardView.setNeedsDisplay()
    }
    
}

