//
//  ContentView.swift
//  Unpwn
//
//  Created by Alessandro Borsato on 20/02/21.
//
import SwiftUI

struct ContentView: View {
    
    //Toggle booleans
    @State private var lowercase=true
    @State private var uppercase=true
    @State private var numbers=true
    @State private var special = true
    
    //Variable that stores the number of characters selected by the user using the slider
    @State private var numberOfCharacters: Double = 0
    let specialCharacters = ["!", ",", "#", "$", "%", "&", "(", ")", "*", "+", ",", "-", ".", "/", ":", ",", "<", "=", ">", "?", "@", "[", "^", "_", "{", "|", "}", "~"]
    
    //Funcion that checks the preferences of the user, giving a string as output
    func check(uppercase: Bool, lowercase: Bool, numbers: Bool, special: Bool) -> String {
        var output=""
        if uppercase {
            output+="A"
        }
        if lowercase {
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
    
    //Variable displayed at the bottom
    var pwned: String {
        var selectedChars = ""
        if (uppercase==false&&lowercase==false&&numbers==false&&special==false){
            //if every toggle is set to false (off), Unpwn will generate lowercase passwords
            selectedChars = "a"
        } else {
            selectedChars = check(uppercase: uppercase, lowercase: lowercase, numbers: numbers, special: special)
        }
        var output=""
        for _ in 0...Int(numberOfCharacters) {
            //The switch will take one of the characters of selectedChars. selectedChars is the string with the user' preferences
            switch String(selectedChars[selectedChars.index(selectedChars.startIndex, offsetBy: Int.random(in: 0..<selectedChars.count))]){
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
                    //Because toRemoveOptionalString would print "Optional: x", Unpwn don't add directly the result to the finel output. First the "raw" value is stored in "toRemoveOptionalString"
                    let toRemoveOptionalString = (String(describing: UnicodeScalar(specialCharacters.randomElement()!)))
                    //And then then only the 10th element is added to the output string
                    output.append(String(toRemoveOptionalString[toRemoveOptionalString.index(toRemoveOptionalString.startIndex, offsetBy: 10)]))
                    break
                default:
                    break
            }
        }
        //This copies to the clipboard every generated password
        let pasteboard = UIPasteboard.general
        pasteboard.string = output
        
        return output
    }

    var body: some View {
        NavigationView{
            Form{
                Section{
                    
                    //lowercases toggle
                    Toggle(isOn: $lowercase) {
                            Text("Enable lowercase characters")
                    }
                    
                    //uppercases toggle
                    Toggle(isOn: $uppercase) {
                            Text("Enable uppercase characters")
                    }
                    
                    //numbers toggle
                    Toggle(isOn: $numbers) {
                            Text("Enable numbers")
                    }
                    
                    //special characters toggle
                    Toggle(isOn: $special) {
                            Text("Enable special characters")
                    }
                    
                }
                Section(header: Text("Numbers of characters: \(Int(numberOfCharacters))")){
                    Slider(value: $numberOfCharacters, in: 0...64, step: 1)
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
