//
//  Home.swift
//  JSON-sesion
//
//  Created by Jonathan Casillas on 15/08/23.
//

import SwiftUI

struct Home: View {
    
    @EnvironmentObject var login: PostViewModel
    @StateObject var json = Modelo1ViewModel()
    
    var body: some View {
        NavigationView{
            
            if json.datosModelo.isEmpty {
                ProgressView()
            }else{
                List(json.datosModelo, id:\.id ){
                    item in
                    VStack(alignment: .leading){
                        Text(item.name)
                        Text("Latitud: \(item.address.geo.lat)")
                    }
                }.navigationTitle("JSON")
                    .toolbar{
                        ToolbarItem(placement: .navigationBarLeading){
                            Button(action: {
                                    UserDefaults.standard.removeObject(forKey: "sesion")
                                    login.authenticated = 0
                                }) { Text("Salir") }
                            }
                            
                        ToolbarItem(placement: .navigationBarTrailing){
                            NavigationLink(destination: {
                                Home2()
                            }){
                               Text("Siguiente")
                            }
                        }
             
                    }
            }
                
        }
    }
}
