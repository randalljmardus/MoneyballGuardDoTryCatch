//
//  ViewController.swift
//  MoneyballGuardDoTryCatch
//
//  Created by Randall Mardus on 2/11/16.
//  Copyright © 2016 Randall Mardus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        struct Player {
            var goodFace: Bool
            var highOBP: Double
            var oddball: Bool
        }
        
        enum ValidationErrors: ErrorType {
            case InvalidFace, InvalidOBP, InvalidOddballness
        }
        
        struct PlayerValidator {
            var goodFace: Bool?
            var highOBP: Double?
            var oddball: Bool?
            
            func isMoneyballMaterial() throws -> Player {
                guard let validFace = goodFace where goodFace != true else {
                    print("Good looks can't hit")
                    throw ValidationErrors.InvalidFace
                }
                guard let validOBP = highOBP where highOBP > 0.400 else {
                    print("Dude's weak")
                    throw ValidationErrors.InvalidOBP
                }
                guard let validOddball = oddball where oddball != false else {
                    print("Must at least be scruffy")
                    throw ValidationErrors.InvalidOddballness
                }
                return Player(goodFace: validFace, highOBP: validOBP, oddball: validOddball)
            }
        }
        
        let aPlayer = PlayerValidator(goodFace: true, highOBP: 0.297, oddball: false)
        do {
            try aPlayer.isMoneyballMaterial()
        } catch ValidationErrors.InvalidFace {
            //tell GM to find someone with a face for radio
        } catch ValidationErrors.InvalidOBP {
            //tell GM to find someone who likes the beanball
        } catch ValidationErrors.InvalidOddballness {
            //tell GM to find someone slightly deformed
        } catch {
            // catch any unforseen biases such as GM's relatives.
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

