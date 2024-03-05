//
//  ValidateProtocol.swift
//  4hw7
//
//  Created by Telegey Nurbekova on 05/03/24.
//

import Foundation

protocol TransferValidationProtocol {
    func isValidCardNumber(cardNumber: String) -> Bool
    func isValidTransferAmount(amount: Float, balance: Float) -> Bool
}

extension TransferValidationProtocol {
    
    func isValidCardNumber(cardNumber: String) -> Bool {
        if cardNumber.count == 16 && cardNumber.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil{
            return true
        } else {
            return false
        }
    }
    
    func isValidTransferAmount(amount: Float, balance: Float) -> Bool {
        if amount >= 20 && amount <= balance{
            return true
        } else {
            return false
        }
    }
}
