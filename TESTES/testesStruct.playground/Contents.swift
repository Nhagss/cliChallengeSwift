import Foundation

// Estrutura de Hobby
struct Hobby {
  var nome: String
  var freq: Int
}

// Estrutura de Dia
struct day {
  var nome: String
  var hobbies: [String] = []
}

// Estrutura de Semana
struct week {
  var hobQuantArray = [0,0,0,0,0,0,0]
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

// Criar uma lista do tipo Hobby
var listaHobbies: [Hobby] = []
var semana = week()

// Criar função para adicionar um hobby à lista
func adicionarHobby(nome: String, frequencia: Int) {
  let novoHobby = Hobby(nome: nome, freq: frequencia)
  listaHobbies.append(novoHobby)
}

// Valores lidos do usuário
adicionarHobby(nome: "Correr", frequencia:2)
adicionarHobby(nome: "Andar", frequencia: 3)
adicionarHobby(nome: "Nadar", frequencia: 2)
adicionarHobby(nome: "ler", frequencia: 4)
adicionarHobby(nome: "desenhar", frequencia: 5)
adicionarHobby(nome: "matar", frequencia: 2)

// Criar variável para receber valor de eventos
var numEventos = 0

// Olhar a quantidade de eventos no total
for i in 0..<listaHobbies.count {
  print(listaHobbies[i])
  numEventos += listaHobbies[i].freq
}

//()checagem de mesa
print("Quantidade de eventos: \(numEventos)")

// Criar uma lista de strings que coloca n vezes determinado hobby
// Correr correr andar andar andar nadar
var listaEventos: [String] = []

//preencher lista de eventos
for Hobby in listaHobbies {
  for _ in 0..<Hobby.freq {
    listaEventos.append(Hobby.nome)
  }
}

listaEventos.shuffle()

//()checagem de mesa
print(listaEventos)

//vamos dispor [Correr correr andar andar andar nadar] em uma struct semana]
var randInds = [0,1,2,3,4,5,6]
randInds.shuffle()
for i in 0..<listaEventos.count{
    for j in 0..<randInds.count{
    if semana.hobQuantArray[j] == semana.hobQuantArray.min(){
      if semana.dias[j].hobbies.contains(listaEventos[i]){
        continue
      }
      else{
        semana.dias[j].hobbies.append(listaEventos[i])
        semana.hobQuantArray[j] += 1
          break
      }
      
      //colocar esse hobby no array de cada dia
      
      //append hobquants
    }
  }
}
print()
print()
print()
for i in 0..<semana.hobQuantArray.count {
    print("\(semana.dias[i].nome): \(semana.dias[i].hobbies)")
}
