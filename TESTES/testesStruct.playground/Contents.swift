import UIKit

//definição de estruturas
struct day {
    let nome: String
    var hobQuant: Int
    
}

struct hobby {
    let nomeHobby: String
    let frequenciaHobby: Int
}

struct week {
    var hobbies: [String]
    var hobbiesQuant: [Int]
    var dias = [
        day(nome: "domingo", hobQuant: 0),
        day(nome: "segunda", hobQuant: 0),
        day(nome: "terca",   hobQuant: 0),
        day(nome: "quarta",  hobQuant: 0),
        day(nome: "quinta",  hobQuant: 0),
        day(nome: "sexta",   hobQuant: 0),
        day(nome: "sabado",  hobQuant: 0)
    ]
    
}

//preencher structs tipo hobby definidas
var listaHobbies : [hobby] = [ ]

func adicionarHobby(nome: String, frequencia: Int) {
    let novoHobby = hobby(nomeHobby: nome, frequenciaHobby: frequencia)
    listaHobbies.append(novoHobby)
}


adicionarHobby(nome: "Correr", frequencia:2)
adicionarHobby(nome: "Andar", frequencia: 3)

//fixar o número de hoobies dispostos em cada dia
var numeroDeHobbiesPorDia = [2,3,2,2,2,3,2]
print("Numero de hobbies:        \(numeroDeHobbiesPorDia)")

//se dia estiver entre dias com menos hobbies, preenche a posicao do dia com 1
var preenche : [Int] = []
var numeroDeHobbiesPreenchidos = 0
for i in 0..<numeroDeHobbiesPorDia.count{
    // Atribui o valor dos dias com menos hobbies a uma variável
    var numMenor = numeroDeHobbiesPorDia.min()
    
    if(numeroDeHobbiesPorDia[i] == numMenor){
        preenche.append(i)
        numeroDeHobbiesPreenchidos += 1
        
    }
}


print("preenche no dia:          \(preenche)")
print("quantidade a preencher:   \(numeroDeHobbiesPreenchidos)")

