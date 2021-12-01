//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Rogério Tavares on 18/05/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet var felicidadeTextField: UITextField?
    
    @IBAction func adicionar(_ sender: Any) {
        guard let nomeDaRefeicao = nomeTextField?.text else {
            print("Erro ao tentar criar a refeição")
            return
        }
        
        guard let felicidadeDaRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao) else {
            print("Erro ao tentar criar a refeição")
            return;
        }
        
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade)
        
        print("Comi \(refeicao.nome) e fiquei com felicidade: \(refeicao.felicidade)")
    }
}

