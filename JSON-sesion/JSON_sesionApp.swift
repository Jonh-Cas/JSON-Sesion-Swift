//
//  JSON_sesionApp.swift
//  JSON-sesion
//
//  Created by Jonathan Casillas on 15/08/23.
//

import SwiftUI

@main
struct JSON_sesionApp: App {
    var body: some Scene {
        
        let login = PostViewModel()
        
        WindowGroup {
            ContentView().environmentObject(login)
        }
    }
}
