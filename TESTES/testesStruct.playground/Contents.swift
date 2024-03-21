import UIKit

//definição de estruturas
struct day {
    let nome: String
    var hobList: [String] = []
    
}

struct hobby {
    let nomeHobby: String
    let frequenciaHobby: Int
}

struct week {
    let hobbies: [hobby]
    var hobbiesQuantArray = [0,0,0,0,0,0,0]
    var dias = [
        day(nome: "domingo"),
        day(nome: "segunda"),
        day(nome: "terca"),
        day(nome: "quarta"),
        day(nome: "quinta"),
        day(nome: "sexta"),
        day(nome: "sabado")
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

//se dia estiver entre dias com menos hobbies, preenche a posicao do dia com 1

var week1 = week(hobbies: listaHobbies)


//a ideia é distribuir um hobby quantas vezes freq

//preciso acessar lista hobbies, hobbies por dia, semana


for i in 0..<week1.hobbies.count{
    for j in 0..<week1.hobbies[i].frequenciaHobby{
        var numMenor = week1.hobbiesQuantArray.min()
        for k in 0..<week1.hobbiesQuantArray.count{
            if(week1.hobbiesQuantArray[k] == numMenor){
                week1.hobbiesQuantArray[k] += 1
                week1.dias[j].hobList.append(week1.hobbies[i].nomeHobby)
            }
        }
    }
    
}



//for i in 0..<week1.hobbies.count{
//    for j in 0..<week1.hobbies[i].frequenciaHobby{
//        // Atribui o valor dos dias com menos hobbies a uma variável
//        var numMenor = week1.hobbiesQuantArray.min()
//
//        if(week1.hobbiesQuantArray[i] == numMenor){
//            week1.hobbiesQuantArray[j] += 1
//            week1.dias[j].hobList.append(week1.hobbies[i].nomeHobby)
//        }
//    }
//}



print(week1)
var preenche : [Int] = []
var numeroDeHobbiesPreenchidos = 0



print("(indices) a preencher :   \(preenche)")
print("quantidade a preencher:   \(numeroDeHobbiesPreenchidos)")




//VERSÃO "LEGADO"

//var numeroDeHobbiesPorDia = [2,3,2,2,2,3,2]
//print("Numero de hobbies:        \(numeroDeHobbiesPorDia)")
//
//se dia estiver entre dias com menos hobbies, preenche a posicao do dia com 1
//var preenche : [Int] = []
//var numeroDeHobbiesPreenchidos = 0
//for i in 0..<numeroDeHobbiesPorDia.count{
//    // Atribui o valor dos dias com menos hobbies a uma variável
//    var numMenor = numeroDeHobbiesPorDia.min()
//
//    if(numeroDeHobbiesPorDia[i] == numMenor){
//        preenche.append(i)
//        numeroDeHobbiesPreenchidos += 1
//
//    }
//}
//
//
//print("preenche no dia:          \(preenche)")
//print("quantidade a preencher:   \(numeroDeHobbiesPreenchidos)")
