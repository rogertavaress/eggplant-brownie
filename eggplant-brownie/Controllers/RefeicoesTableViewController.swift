//
//  RefeicoesTableViewController.swift
//  eggplant-brownie
//
//  Created by Rogério Tavares on 02/12/21.
//

import UIKit

class RefeicoesTableViewController: UITableViewController {
    let refeicoes = [
        Refeicao(nome: "Macarrão", felicidade: 4),
        Refeicao(nome: "Pizza", felicidade: 4),
        Refeicao(nome: "Sushi", felicidade: 5),
        Refeicao(nome: "Temaki", felicidade: 4)
    ]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let refeicao = refeicoes[indexPath.row]
        
        cell.textLabel?.text = refeicao.nome
        
        return cell
    }
}
