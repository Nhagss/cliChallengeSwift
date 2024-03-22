// The Swift Programming Language
// https://docs.swift.org/swift-book
// 
// Swift Argument Parser
// https://swiftpackageindex.com/apple/swift-argument-parser/documentation

import ArgumentParser
import Foundation

//@main
//struct MyTool: ParsableCommand {
//    
//    @Flag(help: "Include a count whith each repetition")
//    var includeCounter = false
//    
//    @Argument(help: "the phrase to repeat")
//    var phrase:String
//    
//    @Option(help:"the number of times to repeat")
//    var count: Int
//    
//    
//    mutating func run() throws {
//        echo (phrase, count:count)
//            }
//    
//    func echo (_ phrase:String, count:Int){
//        if includeCounter{
//            for i in 1...count{
//                print("\(i):\(phrase)")
//            }
//        }else{
//            for _ in 1...count{
//                print("\(phrase)")
//            }
//        }
//        
//    }
//}

@main
struct Hobgen: ParsableCommand {
    static var configuration = CommandConfiguration(
        commandName: "Hobgen",
        abstract: """

██   ██  ██████  ██████  ██████  ██    ██  ██████  ███████ ███    ██
██   ██ ██    ██ ██   ██ ██   ██  ██  ██  ██       ██      ████   ██
███████ ██    ██ ██████  ██████    ████   ██   ███ █████   ██ ██  ██
██   ██ ██    ██ ██   ██ ██   ██    ██    ██    ██ ██      ██  ██ ██
██   ██  ██████  ██████  ██████     ██     ██████  ███████ ██   ████
                                                                                                                                        
This tool is designed to sort a list of hobbies and generate a weekly schedule in a random order each time. We planned this project to be accessible for terminal and no-terminal users. When running the program. First time, the userwill enter a list of hobbies and the amount of times each hobby will be able to be executed in a week. After the first time, the user has to select between adding a new list entirely or sorting the current list
""",
    subcommands: [Add.self, AddMultiple.self]
    )
    
    mutating func run() throws {
        
    }
    
    struct hobby {
        let nomeHobby: String
        let freqHobby: Int
    }
    struct day {
        var nome: String
        var hobbies: [String] = []
    }
    
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
    
    struct Add: ParsableCommand {
        @Option(name: [.customLong("hobbies"), .customShort("h")], help: "Lista de Hobbies separados por virgula ','")
        var hobbiesString: String = ""
        
        func run() {
            
            //Separando a String em um Array de Strings
            let hobbiesArray = hobbiesString.components(separatedBy: ",")
            
            //Criando semana
            let week = ["Domingo", "Segunda", "Terça", "Quarta", "Quinta", "Sexta", "Sábado"]
            
            //Fazendo a randomização do Array
            var hobbiesArrayShuffled = hobbiesArray
            hobbiesArrayShuffled.shuffle()
            for i in 0..<week.count {
                print("\(week[i]): \(hobbiesArrayShuffled[i])")
            }
        }
    }
    
    struct AddMultiple: ParsableCommand {
        @Option(name: [.customLong("add"), .customShort("a")], help: "Lista de hobbies e quantidade de vezes que esse hobby vai aparecer, separados por vircula u.e. '<hobby1>,<quant1>,<hobby2>,<quant2>'")
        var hobbiesString: String = ""
        
        //Le oq for digitado no terminal até que seja digitado um número inteiro
        func readInt() -> Int{
            while true {
                print("Digite a quantidade de semanas que voce quer gerar: ")
                if var input = readLine(){
                    if var number = Int(input){
                        return number
                    } else {
                        continue
                    }
                }
            }
        }
        
        //função responsável por separar uma string com inteiros e textos e transformar em um array de inteiros e um de Strings
        func separateItems(data: String) -> (strings: [String], numbers: [Int]) {
            var hobbies: [String] = []
            var quants: [Int] = []
            //"correr,1,andar,2"
            let termArray = data.split(separator: ",") //"correr","1","andar",2"
                        
            for (i, term) in termArray.enumerated() {
                //Se for par, quer dizer que a quantidade de argumentos está ok
                if termArray.count%2 == 0{
                    
                    //Se o argumento for par, será um hobby, se for impar é uma frequencia
                    if i%2 == 0 {
                        hobbies.append(String(term))
                    } else {
                        if let quantity = Int(term) {
                            
                            //Impede a execução se a frequencia exceder 7
                            if quantity <= 7 {
                                quants.append(quantity)
                            } else {
                                print("Frequencia de cada hobby não pode exceder 7")
                                Self.exit(withError: nil)
                            }
                            
                        } else {
                            print("Invalido, use <hobby>,<quant>,<hobby>,<quant> ...")
                            Self.exit(withError: nil)
                        }
                    }
                } else {
                    print("Invalido, use <hobby>,<quant>,<hobby>,<quant> ...")
                    Self.exit(withError: nil)
                }
            }
            
            return(strings: hobbies, numbers: quants)
        }
        
        
        // recebendo uma listade hobbies e uma lista das frequencias, retorna uma semana com os hobbies de cada dia preenchidos
        func randomizeDays (hobbieList: [String], quants: [Int]) -> (week) {
            
            // Cria array de hobbies temporario
            var tempHobbies: [hobby] = []
            
            // Preenche o Array com os dados enviados
            for i in 0..<hobbieList.count {
                let novoHobby = hobby(nomeHobby: hobbieList[i], freqHobby: quants[i])
                tempHobbies.append(novoHobby)
            }
            
            // Cria um array temporario apenas com os nomes dos hobbies, repetindo o nome na frequencia do hobby
            var tempHobbiesNames: [String] = []
            for hobby in tempHobbies {
                for _ in 0..<hobby.freqHobby {
                    tempHobbiesNames.append(hobby.nomeHobby)
                }
            }
            
            //Embaralha o array de nomes
            tempHobbiesNames.shuffle()
            
            //Cria e randomiza um array com os indices de 0 a 6
            var randInds = [0, 1, 2, 3, 4, 5, 6]
            randInds.shuffle()
            
            //Cria uma semana que será o retorno
            var returnWeek = week()
            
            //vai preenchendo sempre nos espaços com menos hobbies já preenchidos na semana, e aumenta a quantidade de hobbies de cada dia
            for i in 0..<tempHobbiesNames.count {
                for j in 0..<randInds.count
                    where (returnWeek.hobQuantArray[j] == returnWeek.hobQuantArray.min()) {
                    if returnWeek.dias[j].hobbies.contains(tempHobbiesNames[i]) {
                        continue
                    } else {
                        returnWeek.dias[j].hobbies.append(tempHobbiesNames[i])
                        returnWeek.hobQuantArray[j] += 1
                        break
                    }
                }
            }
            return returnWeek
        }
            
        func run() {
            let (hobbieList, quants) = separateItems(data: hobbiesString)
            let week1 = randomizeDays(hobbieList: hobbieList, quants: quants)
            var weekArray: [week] = []
            
            var numeroDeSemanas = readInt()
            
            for i in 0..<numeroDeSemanas {
                print("----------- Semana \(i+1) -----------")
                
                weekArray.append(randomizeDays(hobbieList: hobbieList, quants: quants))
                for j in 0..<weekArray[i].hobQuantArray.count {
                    print("\(weekArray[i].dias[j].nome): \(weekArray[i].dias[j].hobbies)")
                }
                print()
                
            }
            
                
                
            
            
        }
        
    }
}
