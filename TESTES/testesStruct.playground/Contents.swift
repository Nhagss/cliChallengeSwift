import UIKit

var greeting = "Hello, playground"

struct day {
    let nome: String
    let numero: Int
    var hobQuant: Int
    
}

//Estrutura de dados de uma semana
struct week {
    var hobbies: [String]
    var hobbiesQuant: [Int]
    var dias = [
        day(nome: "domingo", numero: 0, hobQuant: 0),
        day(nome: "segunda", numero: 1, hobQuant: 0),
        day(nome: "terca", numero: 2, hobQuant: 0),
        day(nome: "quarta", numero: 3, hobQuant: 0),
        day(nome: "quinta", numero: 4, hobQuant: 0),
        day(nome: "sexta", numero: 5, hobQuant: 0),
        day(nome: "sabado", numero: 6, hobQuant: 0)
    ]
    
}

var hobbieList = ["correr", "andar"]
var quants = [2,3]
var week1 = week(hobbies: hobbieList, hobbiesQuant: quants)

var sorted = [2,3,2,2,2,3]
var nums = sorted
sorted.sort()
print(nums)
print(sorted)

var inds : [Int] = []
for i in 0..<nums.count{
    if(nums[i] == sorted[0]){
        inds.append(1)
    }else{
        inds.append(0)}
    
    if(inds[i] == 1){
        
    }
}
print(inds)
for i in 0..<7{
    print(week1.dias[i].hobQuant)
}


