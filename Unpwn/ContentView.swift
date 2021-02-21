//
//  ContentView.swift
//  Unpwn
//
//  Created by Alessandro Borsato on 20/02/21.
//
import SwiftUI

struct ContentView: View {
    
    @State private var maiusc=true
    @State private var min=true
    @State private var numbers=true
    @State private var special = true
    @State private var maiuscPicker = 0
    @State private var minPicker = 0
    @State private var numbersPicker = 0
    @State private var specialPicker = 0
    @State private var chars: Double = 0
    let specialCharacters = ["!", ",", "#", "$", "%", "&", "(", ")", "*", "+", ",", "-", ".", "/", ":", ",", "<", "=", ">", "?", "@", "[", "^", "_", "{", "|", "}", "~"]
    
    func check(maiusc: Bool, min: Bool, numbers: Bool, special: Bool) -> String {
        var output=""
        if maiusc {
            output+="A"
        }
        if min {
            output+="a"
        }
        if numbers {
            output+="0"
        }
        if special {
            output+="s"
        }
        return output
    }
    
    var pwned: String {
        let limit:Int = Int(chars)
        var selectedChars = ""
        if (maiusc==false&&min==false&&numbers==false&&special==false){
            selectedChars = "a"
        } else {
            selectedChars = check(maiusc: maiusc, min: min, numbers: numbers, special: special)
        }
        var output=""
        var currentElement = ""
        for _ in 0...limit {
            if selectedChars.count>0 {
                let currentType=Int.random(in: 0..<selectedChars.count)
                currentElement=String(selectedChars[selectedChars.index(selectedChars.startIndex, offsetBy: currentType)])
            } else {
                currentElement = "a"
            }
            switch currentElement{
                case "a":
                    output.append(String(describing: UnicodeScalar((Int.random(in: 0..<26) + 97))!))
                    break
                case "A":
                    output.append(String(describing: UnicodeScalar((Int.random(in: 0..<26) + 65))!))
                    break
                case "0":
                    output.append(String(describing: UnicodeScalar((Int.random(in: 0..<10) + 48))!))
                    break
                case "s":
                    let toRemoveOptionalString = (String(describing: UnicodeScalar(specialCharacters.randomElement()!)))
                    output.append(String(toRemoveOptionalString[toRemoveOptionalString.index(toRemoveOptionalString.startIndex, offsetBy: 10)]))
                    break
                default:
                    break
            }
        }
        let pasteboard = UIPasteboard.general
        pasteboard.string = output
        return output
    }

    var body: some View {
        NavigationView{
            Form{
                Section{
                    Toggle(isOn: $maiusc) {
                            Text("Enable maiuscole characters")
                    }
                    Toggle(isOn: $min) {
                            Text("Enable minuscole characters")
                    }
                    Toggle(isOn: $numbers) {
                            Text("Enable numbers")
                    }
                    Toggle(isOn: $special) {
                            Text("Enable special characters")
                    }
                }
                Section(header: Text("Numbers of characters: \(Int(chars))")){
                    Slider(value: $chars, in: 0...64, step: 1)
                    Text("\(String(pwned))")
                }
            }
            .navigationBarTitle("Unpwn", displayMode: .large)}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
