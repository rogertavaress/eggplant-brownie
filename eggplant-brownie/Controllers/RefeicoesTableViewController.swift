//
//  RefeicoesTableViewController.swift
//  eggplant-brownie
//
//  Created by Rogério Tavares on 02/12/21.
//

import UIKit

class RefeicoesTableViewController: UITableViewController, AdicionaRefeicaoDelegate {
    var refeicoes = [
        Refeicao(nome: "Macarrão", felicidade: 4, itens: [Item(nome: "Tomate", calorias: 1.0),Item(nome: "Tomate2", calorias: 1.0)]),
        Refeicao(nome: "Pizza", felicidade: 4, itens: [Item(nome: "Tomate", calorias: 1.0),Item(nome: "Tomate2", calorias: 1.0)]),
        Refeicao(nome: "Sushi", felicidade: 5, itens: [Item(nome: "Tomate", calorias: 1.0),Item(nome: "Tomate2", calorias: 1.0)]),
        Refeicao(nome: "Temaki", felicidade: 4, itens: [Item(nome: "Tomate", calorias: 1.0),Item(nome: "Tomate2", calorias: 1.0)])
    ]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let refeicao = refeicoes[indexPath.row]
        celula.textLabel?.text = refeicao.nome
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(mostrarDetalhes))
        celula.addGestureRecognizer(longPress)
        
        return celula
    }
    
    func add(_ refeicao: Refeicao) {
        refeicoes.append(refeicao)
        tableView.reloadData()
    }
    
    @objc func mostrarDetalhes(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            let celula = gesture.view as! UITableViewCell
            guard let indexPath = tableView.indexPath(for: celula) else { return }
            let refeicao = refeicoes[indexPath.row]
            
            
            
            RemoveRefeicaoViewController(controller: self).exibe(refeicao) {_ in
                self.refeicoes.remove(at: indexPath.row)
                self.tableView.reloadData()
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "adicionar"{
            if let viewController = segue.destination as? ViewController {
                viewController.delegate = self
            }
        }
    }
}
