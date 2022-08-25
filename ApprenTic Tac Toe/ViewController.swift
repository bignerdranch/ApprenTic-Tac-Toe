//
//  ViewController.swift
//  ApprenTic Tac Toe
//
//  Created by Alivia Fairchild on 8/5/22.
//

import UIKit

enum TTTLocation: Int {
    case topLeft = 0
    case topMiddle = 1
    case topRight = 2
    
    case middleLeft = 3
    case middleMiddle = 4
    case middleRight = 5
    
    case bottomLeft = 6
    case bottomMiddle = 7
    case bottomRight = 8
}

class ViewController: UIViewController {
    
    var containerStackView: UIStackView =  {

        var stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
 //       stackView.backgroundColor = .systemBlue
        
        return stackView
    }()
    
    // MARK: Rows
    
    var rowOne: UIStackView =  {

        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.distribution = .fillEqually
            
        return stackView
    }()
    
    var rowTwo: UIStackView =  {

        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.distribution = .fillEqually

        return stackView
    }()
    
    var rowThree: UIStackView =  {

        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.distribution = .fillEqually

        return stackView
    }()
    
    // MARK: Button Game State
    
    var gameState: TicTacButtonState = .turnX
    
    // MARK: Number of Turns
    
    var numberOfTurns = 0
    var maxNumberOfTurns = 9

    // MARK: Buttons
    
    var buttonTL: TicTacButton = {
        
        var button = TicTacButton()
        button.tag = TTTLocation.topLeft.rawValue
        button.addTarget(self, action: #selector(ttButtonTapped(button:)), for: .touchUpInside)

        return button
    }()
    
    var buttonTM: TicTacButton = {
        
        var button = TicTacButton()
        button.tag = TTTLocation.topMiddle.rawValue
        button.addTarget(self, action: #selector(ttButtonTapped(button:)), for: .touchUpInside)

        return button
    }()
    
    var buttonTR: TicTacButton = {
        
        var button = TicTacButton()
        button.tag = TTTLocation.topRight.rawValue
        button.addTarget(self, action: #selector(ttButtonTapped(button:)), for: .touchUpInside)

        return button
    }()
    
    var buttonML: TicTacButton = {
        
        var button = TicTacButton()
        button.tag = TTTLocation.middleLeft.rawValue
        button.addTarget(self, action: #selector(ttButtonTapped(button:)), for: .touchUpInside)

        return button
    }()
    
    var buttonMM: TicTacButton = {
        
        var button = TicTacButton()
        button.tag = TTTLocation.middleMiddle.rawValue
        button.addTarget(self, action: #selector(ttButtonTapped(button:)), for: .touchUpInside)
    
        return button
    }()
    
    var buttonMR: TicTacButton = {
        
        var button = TicTacButton()
        button.tag = TTTLocation.middleRight.rawValue
        button.addTarget(self, action: #selector(ttButtonTapped(button:)), for: .touchUpInside)

        return button
    }()
    
    var buttonBL: TicTacButton = {
        
        var button = TicTacButton()
        button.tag = TTTLocation.bottomLeft.rawValue
        button.addTarget(self, action: #selector(ttButtonTapped(button:)), for: .touchUpInside)

        return button
    }()
    
    var buttonBM: TicTacButton = {
        
        var button = TicTacButton()
        button.tag = TTTLocation.bottomMiddle.rawValue
        button.addTarget(self, action: #selector(ttButtonTapped(button:)), for: .touchUpInside)

        return button
    }()
    
    var buttonBR: TicTacButton = {
        
        var button = TicTacButton()
        button.tag = TTTLocation.bottomRight.rawValue
        button.addTarget(self, action: #selector(ttButtonTapped(button:)), for: .touchUpInside)

        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: stack view
        
        rowOne.addArrangedSubview(buttonTL)
        rowOne.addArrangedSubview(buttonTM)
        rowOne.addArrangedSubview(buttonTR)
        
        rowTwo.addArrangedSubview(buttonML)
        rowTwo.addArrangedSubview(buttonMM)
        rowTwo.addArrangedSubview(buttonMR)

        rowThree.addArrangedSubview(buttonBL)
        rowThree.addArrangedSubview(buttonBM)
        rowThree.addArrangedSubview(buttonBR)
        
        containerStackView.addArrangedSubview(rowOne)
        containerStackView.addArrangedSubview(rowTwo)
        containerStackView.addArrangedSubview(rowThree)
        
        view.addSubview(containerStackView)
        
        // Can constrain to a fixed number for portrait mode: (equalToConstant: 300 ) possibly use a multiplier 50% of the screen : (equalTo: view.widthAnchor)
        
        NSLayoutConstraint.activate([
            containerStackView.heightAnchor.constraint(equalToConstant: 300 ),
            containerStackView.widthAnchor.constraint(equalToConstant: 300 ),
            containerStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)

        ])
    }
    
    @objc func ttButtonTapped(button: TicTacButton) {
        
        //button.updateButtonImage(for: gameState)
        button.buttonState = gameState
        updateGameState()
        button.isEnabled = false
    }
    
    func updateGameState() {
        // if game state is O switch to X if X switch to O
        
        numberOfTurns += 1
        
        // update if we have a winner before we turn over the next turn
        
        winnerWinnerChickenDinner()
        
        //   a ? b : c <ternary operator>
        
        gameState = gameState == .turnO ? .turnX : .turnO
        
    }
    
    func winnerWinnerChickenDinner(){
        
        var didYouWin = false
        
        let tictacBoard = [buttonTL.buttonState, buttonTM.buttonState, buttonTR.buttonState,
                           buttonML.buttonState, buttonMM.buttonState, buttonMR.buttonState,
                           buttonBL.buttonState, buttonBM.buttonState, buttonBR.buttonState]
        // Horizontal possible wins
        
        let firstRowH = [tictacBoard[0], tictacBoard[1], tictacBoard[2]]
        
        let secondRowH = [tictacBoard[3], tictacBoard[4], tictacBoard[5]]
        
        let thirdRowH = [tictacBoard[6], tictacBoard[7], tictacBoard[8]]
        
        // Vertical possible wins
        
        let firstRowV = [tictacBoard[0], tictacBoard[3], tictacBoard[6]]
        let secondRowV = [tictacBoard[1], tictacBoard[4], tictacBoard[7]]
        let thirdRowV = [tictacBoard[2], tictacBoard[5], tictacBoard[8]]
        
        // Diagonal possible wins
        
        let firstRowD = [tictacBoard[0], tictacBoard[4], tictacBoard[8]]
        let secondRowD = [tictacBoard[2], tictacBoard[4], tictacBoard[6]]
        
        let boardCombinations = [firstRowH, secondRowH, thirdRowH, firstRowV, secondRowV, thirdRowV, firstRowD, secondRowD]
        
        
        for combination in boardCombinations {
            // Check if all items are equal
            
            //   if numberOfTurns = maxNumberOfTurns != allItems run catsGameAlert()
            
            let allItemsEqual = combination.dropFirst().allSatisfy({ $0 == combination.first })
            
            // Make sure row isn’t clear
            
            if allItemsEqual && combination.first != .clear {
                
                // Call function to handle a winning game and pass it the winning state
                
                winner(state: combination.first ?? .clear)
                didYouWin = true
                break
                
            }
        }
        
        if numberOfTurns >= maxNumberOfTurns && !didYouWin {
            winner(state: .clear)
        }
        
    }
    
    
    func winner(state: TicTacButtonState){
        
        switch state {
        case .turnX:
            winnerXAlert()
        case .turnO:
            winnerOAlert()
        case .clear:
            catsGameAlert()
            
        }

    }
    
    func clearGame(){
        let buttons = [buttonTL, buttonTM, buttonTR,
                       buttonML, buttonMM, buttonMR,
                       buttonBL, buttonBM, buttonBR]
        for button in buttons {
            button.buttonState = .clear
            
            button.isEnabled = true
        }

        gameState = .turnX
        numberOfTurns = 0

    }
    
    
    func winnerXAlert(){
        let alert = UIAlertController(title: "Winner", message: "Player X won!", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "You did it!", style: .default, handler: { (_) in
            self.clearGame()
        }))

        self.present(alert, animated: true)
    }
    
    func winnerOAlert(){
        let alert = UIAlertController(title: "Winner", message: "Player O won!", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "You did it!", style: .default, handler: { (_) in
            self.clearGame()
        }))

        self.present(alert, animated: true)
    }
    
    func catsGameAlert(){
        let alert = UIAlertController(title: "Cat's Game", message: "You tied!", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Let's try again", style: .default, handler: { (_) in
            self.clearGame()
        }))

        self.present(alert, animated: true)
    }
    
    
    
}
