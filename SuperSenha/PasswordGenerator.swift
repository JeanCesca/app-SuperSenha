//
//  PasswordGenerator.swift
//  SuperSenha
//
//  Created by Jean Ricardo Cesca on 13/06/22.
//

import Foundation

class PasswordGenerator {
    
    var numberOfCharacters: Int = 1
    var useLetters: Bool!
    var useNumbers: Bool!
    var useCapitalLetters: Bool!
    var useSpecialCharacters: Bool!
    
    private let letters = "abcdefghijklmnopqrstuvwxyz"
    private let specialCharacters = "!@#$%ˆ&*()_-+=~`|[]{}':;?/<>.,"
    private let numbers = "0123456789"
    
    init(numberOfCharacters: Int, useLetters: Bool, useNumbers: Bool, useCapitalLetters: Bool, useSpecialCharacters: Bool) {
        
        //limitando o numero de caracteres entre 1 e 16
        var numChars = min(numberOfCharacters, 16)
        numChars = max(numChars, 1)
        
        self.numberOfCharacters = numChars
        self.useLetters = useLetters
        self.useNumbers = useNumbers
        self.useCapitalLetters = useCapitalLetters
        self.useSpecialCharacters = useSpecialCharacters
    }
    
    var passwords: [String] = []
    
    func generate(total: Int) -> [String] {
        passwords.removeAll()
        
        var universe: String = ""
        
        if useLetters {
            universe += letters
        }
        
        if useNumbers {
            universe += numbers
        }
        
        if useSpecialCharacters {
            universe += specialCharacters
        }
        
        if useCapitalLetters {
            universe += letters.uppercased()
        }
        
        let universeArray = Array(universe) //tenho um array de Character
        //enquanto meu total de senhas (password.count) for menor que o total que o usuário passou:
        while passwords.count < total {
            var password = ""
            for _ in 1...numberOfCharacters {
                let index = Int(arc4random_uniform(UInt32(universeArray.count))) //aqui retorna um numero inteiro aleatorio (tamanho da array)
                //montando cada item da array, até atingir o numero máximo de numberOfCharacters
                password += String(universeArray[index])
            }
            //juntando as strings para completar a array total de senhas
            passwords.append(password)
        }
        return passwords
    }
}
