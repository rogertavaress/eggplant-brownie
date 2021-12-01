import UIKit

class Refeicao {
    var nome: String?
    var felicidade: String?
}

let refeicao: Refeicao = Refeicao()



func exibeNome(){
    if let nome = refeicao.nome {
        print(nome)
    }
    
    guard let nome = refeicao.nome else {
        return
    }
    
    print(nome)
}

exibeNome()


