//
//  AdicionarItensViewController.swift
//  eggplant-brownie
//
//  Created by Rogério Tavares on 05/12/21.
//

import UIKit

protocol AdicionaItensDelegate {
    func add(_ item: Item)
}

class AdicionarItensViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var caloriasTextField: UITextField!
    
    // MARK: - Atributos
    
    var delegate: AdicionaItensDelegate?
    
    // MARK: - Constructor
    
    init(delegate: AdicionaItensDelegate) {
        super.init(nibName: "AdicionarItensViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - IBActions
    
    @IBAction func adicionarItem(_ sender: Any) {
        guard let nome = nomeTextField.text,
              let caloriasText = caloriasTextField.text,
              let calorias = Double(caloriasText) else {
                  return
              }
        
        let item = Item(nome: nome, calorias: calorias)
        delegate?.add(item)
        navigationController?.popViewController(animated: true)
    }
    
}
