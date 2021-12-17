//
//  ItemDao.swift
//  eggplant-brownie
//
//  Created by Rogério Tavares on 17/12/21.
//

import Foundation

class ItemDao {
    func save(_ listaDeItens: [Item]) {
        do {
            let dados = try NSKeyedArchiver.archivedData(withRootObject: listaDeItens, requiringSecureCoding: false)
            guard let caminho = recuperaDiretorio() else { return }
            try dados.write(to: caminho)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func recupera() -> [Item] {
        do {
            guard let diretorio = recuperaDiretorio() else { return [] }
            let dados = try Data(contentsOf: diretorio)
            let itensSalvos = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as! Array<Item>
            
            return itensSalvos
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    func recuperaDiretorio() -> URL? {
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }
        
        let caminho = diretorio.appendingPathComponent("itens")
        
        return caminho
    }
}
