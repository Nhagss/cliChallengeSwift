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
    
    static var configuration = CommandConfiguration(subcommands: [Add.self, AddMultiple.self])
    
    mutating func run() throws {
        
    }
    
    struct hobby {
        let nomeHobby: String
        let freqHobby: Int
    }
    struct day {
        var nome: String
        var hobQuant: Int
        
    }
    
    struct week {
        var hobbies: [String]
        let dias = [
            day(nome: "domingo", hobQuant: 0),
            day(nome: "segunda", hobQuant: 0),
            day(nome: "terca", hobQuant: 0),
            day(nome: "quarta", hobQuant: 0),
            day(nome: "quinta", hobQuant: 0),
            day(nome: "sexta", hobQuant: 0),
            day(nome: "sabado", hobQuant: 0)
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
        @Option(name: [.customLong("hobbies"), .customShort("h")], help: "Lista de hobbies e quantidade de vezes que esse hobby vai aparecer, separados por vircula u.e. <hobby1>,<quant1>,<hobby2>,<quant2>")
        var hobbiesString: String = ""
        
        //função responsável por separar uma string com inteiros e textos e transformar em um array de inteiros e um de Strings
        func separateItems(data: String) -> (strings: [String], numbers: [Int]) {
            var hobbies: [String] = []
            var quants: [Int] = []
            //"correr,1,andar,2"
            let termArray = data.split(separator: ",") //"correr","1","andar",2"
                        
            for (i, term) in termArray.enumerated() {
                if i%2 == 0 {
                    hobbies.append(String(term))
                } else {
                    if let quantity = Int(term) {
                        quants.append(quantity)
                    } else {
                        print("Invalido, use <hobby>,<quant>,<hobby>,<quant> ...")
                    }
                }
            }
            
            return(strings: hobbies, numbers: quants)
        }
        
        func run() {
            let (hobbieList, quants) = separateItems(data: hobbiesString)
            let week1 = week(hobbies: hobbieList)
            
        }
        
    }
}
