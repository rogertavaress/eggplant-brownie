//
//  RefeicaoDao.swift
//  eggplant-brownie
//
//  Created by Rogério Tavares on 17/12/21.
//

import Foundation

class RefeicaoDao {
    func save(_ refeicoes: [Refeicao]) {
        guard let caminho = recuperaDiretorio() else { return }
        
        do {
            let dados = try NSKeyedArchiver.archivedData(withRootObject: refeicoes, requiringSecureCoding: false)
            try dados.write(to: caminho)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func recupera() -> [Refeicao] {
        guard let caminho = recuperaDiretorio() else { return [] }
        
        do {
            let dados = try Data(contentsOf: caminho)
            guard let refeicoesSalvas = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as? Array<Refeicao> else { return [] }
            
            return refeicoesSalvas
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    func recuperaDiretorio() -> URL? {
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }
        
        let caminho = diretorio.appendingPathComponent("refeicoes")
        
        return caminho
    }
}
