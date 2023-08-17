//
//  Modelo1ViewModel.swift
//  JSON-sesion
//
//  Created by Jonathan Casillas on 15/08/23.
//

import Foundation

class Modelo1ViewModel: ObservableObject {
        
    @Published var datosModelo: [Modelo1] = []
    
    init(){
        fetch()
    }
    
    func fetch(){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users")else{
             return
        }
        
        URLSession.shared.dataTask(with: url){
            data, _, _ in
            guard let data = data else { return }
            
            do{
                let json = try JSONDecoder().decode([Modelo1].self, from: data)
                DispatchQueue.main.async {
                    self.datosModelo = json
                }
            }catch let error as NSError{
                print("El error es ---> ", error.localizedDescription)
            }
            
        }.resume()
    }
    
}
