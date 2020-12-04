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
   
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var rangeLabel: UILabel!
    
    var timer = Timer()
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counter = 30
        rangeLabel.text = "Time : \(counter)"
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
        
        boardView.stoneDelegate = self
        
        gameEngine.initilaze2Game()
       boardView.shadowStones = gameEngine.stones
        


    }
    
    
    
    @objc func timerFunction(){
        
        
        rangeLabel.text = "Time : \(counter)"
        counter -= 1
        
        if counter == 0 {
            timer.invalidate()
            rangeLabel.text = "Time's over"
            
            let alert = UIAlertController(title: "Oyun Bitti", message: "Oyun Bitti skorunuz :  \(gameEngine.scoree)", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(alert, animated: true)
        }
        
        
        
    }
    
    
    
    func leftRange(mainCol : Int , mainRow : Int , fromCol : Int , fromRow : Int){
        if let mainStone = stoneAt(col: mainCol, row: mainRow){
            if mainStone.isGreen == false {
                let rangeCol = fromCol - mainCol
                let rangeRow = fromRow - mainRow
                rangeLabel.text = "String(rangeCol)"
            }
        }
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
    
    @IBAction func level2Btn(_ sender: Any) {
        
//        gameEngine.initilaze2Game()
//       boardView.shadowStones = gameEngine.stones
//       boardView.setNeedsDisplay()
        
        
    }
}

