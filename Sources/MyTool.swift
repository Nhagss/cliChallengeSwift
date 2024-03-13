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
struct Calculator: ParsableCommand {
    
    static var configuration = CommandConfiguration(subcommands: [Add.self, AddMultiple.self])
    
    mutating func run() throws {
        
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
            print(week.map { $0 + "\t" }.joined())
            print(hobbiesArrayShuffled.map { $0 + "\t" }.joined())
        }
    }
    
    struct AddMultiple: ParsableCommand {
        @Option(name: [.customLong("hobbies"), .customShort("h")], help: "Lista de Hobbies separados por virgula ','")
        var hobbiesString: String = ""
        
    }
}
