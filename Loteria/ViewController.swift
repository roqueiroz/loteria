//
//  ViewController.swift
//  Loteria
//
//  Created by Rodrigo Queiroz on 16/09/19.
//  Copyright © 2019 Rodrigo Queiroz. All rights reserved.
//

import UIKit

enum GameType: String {
    case megaSena = "Mega-Sena"
    case quina = "Quina"
}

//CUSTOM OPERATOR - Gera uma quantidade determinada(totalElements) numeros inteiros de baseada em um range (range)
infix operator |-|
func |-| (totalElements: Int, range: Int) -> [Int] {
    
    var result: [Int] = []
    
    while result.count < totalElements {
        
        let randomNumber = Int(arc4random_uniform(UInt32(range))+1)
     
        if !result.contains(randomNumber) {
            result.append(randomNumber)
        }
    }
    
    return result.sorted()
}


class ViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var sctrlGameType: UISegmentedControl!
    @IBOutlet var gameNumbers: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showGameNumber(for: .megaSena)
        
    }

    @IBAction func generateGame() {
        
        switch sctrlGameType.selectedSegmentIndex {
            case 0:
                showGameNumber(for: .megaSena)
            default:
                showGameNumber(for: .quina)
        }
        
    }
    
    func showGameNumber(for type: GameType){
        
        lblTitle.text = type.rawValue
        
        var game: [Int] = []
        
        switch type {
        
            case .megaSena:
                game = 6|-|60
                gameNumbers.last!.isHidden =  false
            
            case .quina:
                game = 5|-|80
            gameNumbers.last!.isHidden =  true
            
        }
        
        for (index, value) in game.enumerated() {
            
            gameNumbers[index].setTitle("\(value)", for: .normal)
            
        }
        
    }
    
}

