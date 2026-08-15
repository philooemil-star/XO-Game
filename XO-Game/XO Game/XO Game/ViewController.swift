//
//  ViewController.swift
//  XO Game
//
//  Created by Muhamed Alkhatib on 20/08/2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Position0: UIButton!
    @IBOutlet weak var Position1: UIButton!
    @IBOutlet weak var Position2: UIButton!
    @IBOutlet weak var Position3: UIButton!
    @IBOutlet weak var Position4: UIButton!
    @IBOutlet weak var Position5: UIButton!
    @IBOutlet weak var Position6: UIButton!
    @IBOutlet weak var Position7: UIButton!
    @IBOutlet weak var Position8: UIButton!
    
    @IBOutlet weak var resultLabel: UILabel!
    var player : Int = 1
    var gameState = [0 , 0 , 0 ,
                     0 , 0 , 0 ,
                     0 , 0 , 0 ]
    var winningindexes = [ [0, 1, 2] , [3, 4, 5] , [6, 7, 8] , [0, 3, 6] , [1, 4, 7] , [2, 5, 8] , [0, 4, 8] ,[2, 4, 6] ]
    var gameIsActive : Bool = true
    
    func determineWinner () {
        
        for index in winningindexes {
            
            if gameState[index[0]] == gameState[index[1]]
          &&   gameState[index[1]] == gameState[index[2]]
          &&   gameState[index[2]] != 0 {
                
                print ("There is a winner")
                resultLabel.text = "player \(player) wins"
                gameIsActive=false
                break
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // This will now work because resetGame() is at the class level
        resetGame()
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
       selectPosition(button: sender)
    }
    
    @IBAction func playAgainPressed(_ sender: UIButton) {
        // Call the function when the button is pressed
        resetGame()
    }
    
    // Define the function at the class level
    func resetGame() {
        // Note: You can use the shorthand .normal instead of UIControl.State.normal
        Position0.setImage(nil, for: .normal)
        Position1.setImage(nil, for: .normal)
        Position2.setImage(nil, for: .normal)
        Position3.setImage(nil, for: .normal)
        Position4.setImage(nil, for: .normal)
        Position5.setImage(nil, for: .normal)
        Position6.setImage(nil, for: .normal)
        Position7.setImage(nil, for: .normal)
        Position8.setImage(nil, for: .normal)
        resultLabel.text = ""
        for i in 0...8 {
            gameState[i]=0
            gameIsActive = true
        }
    }
    
    
    func selectPosition(button : UIButton) {
        
        if gameIsActive {
            if button.image(for: .normal) == nil  {
                if player == 1 { //player X
                    
                    button.setImage(UIImage(named: "x3"), for: .normal)
                } else {
                    button.setImage(UIImage(named: "o2"), for: .normal)
                }
                gameState[button.tag]=player
                determineWinner()
                if player == 1 {
                    player = 2
                } else {
                    player = 1
                }
            }
            print (gameState)
        }
    }
   
}
