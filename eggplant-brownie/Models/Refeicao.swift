//
//  Refeicao.swift
//  eggplant-brownie
//
//  Created by Rogério Tavares on 01/12/21.
//

import UIKit

class Refeicao: NSObject {
    let nome: String
    let felicidade: Int
    var itens: Array<Item> = []
    
    init(nome: String, felicidade: Int, itens: [Item] = []) {
        self.nome = nome
        self.felicidade = felicidade
        self.itens = itens
    }
    
    func totalDeCalorias() -> Double {
        var total = 0.0
        
        for item in itens {
            total += item.calorias
        }
        
        return total
    }
}
