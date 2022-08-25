//
//  TicTacButton.swift
//  ApprenTic Tac Toe
//
//  Created by Alivia Fairchild on 8/9/22.
//

import UIKit

enum TicTacButtonState {
    case turnX
    case turnO
    case clear
}


class TicTacButton: UIButton {
    
    // Hsoi Start
    
    private var _buttonState: TicTacButtonState = .clear // this is the actual stored state
    var buttonState: TicTacButtonState {
        set {
            updateButtonImage(for: newValue)
            _buttonState = newValue
        }
        get {
            _buttonState
        }
    }
    
    // Hsoi End
    
    // Hsoi made this private - still a useful function, that does one thing (Single Responsibility)
    private func updateButtonImage(for state: TicTacButtonState) {
        
        let baseConfig = UIImage.SymbolConfiguration(pointSize: 100, weight: .bold, scale: .large)
        
        switch state {
            
        case .turnX:
            let baseImageX = UIImage(systemName: "xmark")?.applyingSymbolConfiguration(baseConfig)

            let colorConfig = UIImage.SymbolConfiguration(paletteColors: [.red])

            let colorizedImage = baseImageX?.applyingSymbolConfiguration(colorConfig)
            
            setImage(colorizedImage, for: .normal)

//            setImage(baseImageX, for: .normal)
        case .turnO:
            
            let baseImageO = UIImage(systemName: "circle")?.applyingSymbolConfiguration(baseConfig)
            setImage(baseImageO, for: .normal)

//            setImage(baseImageO, for: .normal)
        case .clear: setImage(nil, for: .normal)
            
        }
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // MARK: Button size
        
        self.frame.size.height = 50
        self.frame.size.width = 50
        self.backgroundColor = .systemGray3

        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) had not been implemented")
    }
    
    private func configure() {
        
    }
    
//    func endGame() {
//        
//    }
}
