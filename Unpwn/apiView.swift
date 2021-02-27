//
//  apiView.swift
//  Storyboard_Unpwnd
//
//  Created by Alessandro Borsato on 26/02/21.
//
import SwiftUI
import SwiftyJSON
import Foundation


struct apiView: View {
    
    @State private var userPassword=""
    @State private var buttonResult=""
    @State private var textFieldId: String = UUID().uuidString

    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Am I been hacked?", text: $userPassword)
                        .id(textFieldId)
                }
                Section{
                    Button{
                        textFieldId = UUID().uuidString
                        buttonResult=""
                        if userPassword=="" {
                            buttonResult="Enter your password first"
                            return
                        }
                        var hash = SHA1.hexString(from: userPassword)!
                            .replacingOccurrences(of: " ", with: "")
                        let hashPrefix = hash.prefix(5)
                        var hashSuffix = ""
                        
                        for _ in 0...4 {
                            hash.remove(at: hash.startIndex)
                            hashSuffix=hash
                        }
                        var rawUrl = "https://api.pwnedpasswords.com/range/"
                        rawUrl.append(contentsOf: hashPrefix)
                        let url = URL(string: rawUrl)
                        guard let requestUrl = url else { fatalError() }

                        var request = URLRequest(url: requestUrl)

                        request.httpMethod = "GET"

                        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in

                            if let error = error {
                                print("Error took place \(error)")
                                return
                            }

                            if let response = response as? HTTPURLResponse {
                                print("Response HTTP Status code: \(response.statusCode)")
                            }

                            if let data = data, let dataString = String(data: data, encoding: .utf8) {

                                if dataString.contains(hashSuffix) {
                                    buttonResult="Your password is not safe. \"\(userPassword)\" has been found various data breaches! Change the password in every account with this password."
                                } else {
                                    buttonResult="Your password is safe!"
                                }
                            }
                        }
                        task.resume()
                    } label: {
                        Text("Is my password safe?")
                    } .contentShape(Rectangle())
                    
                    Text("\(buttonResult)")
                }
            }
        }
    }
}
