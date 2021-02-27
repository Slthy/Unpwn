//
//  homeView.swift
//  Storyboard_Unpwnd
//
//  Created by Alessandro Borsato on 26/02/21.
//

import SwiftUI


struct homeView: View {
    var body: some View {
        NavigationView{
            Form{
                Section{
                    Button{
                    } label: {
                        Text("Password Generator")
                    } .contentShape(Rectangle())
                }
                Section{
                    Button{
                    } label: {
                        Text("Password Checker")
                    } .contentShape(Rectangle())
                }
                Section{
                    Button{
                    } label: {
                        Text("Info")
                    } .contentShape(Rectangle())
                }
            }
        }
    }
    
}




