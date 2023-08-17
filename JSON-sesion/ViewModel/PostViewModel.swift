//
//  PostViewModel.swift
//  JSON-sesion
//
//  Created by Jonathan Casillas on 15/08/23.
//

import Foundation


class PostViewModel: ObservableObject {
    
    @Published var authenticated  = 0
    init(){
        if let sesion = UserDefaults.standard.object(forKey: "sesion") as? Int {
            authenticated = sesion
        }else {
            authenticated = 0
            
        }
    }
    
    
    
    func login( email: String, password: String ){
        
        guard let url = URL(string: "https://reqres.in/api/login") else {
             return
        }
        let params = ["email": email, "password": password]
        let body = try! JSONSerialization.data(withJSONObject: params)
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.httpBody = body
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request){
            data, response, error in
            if let response = response {
                print("El response es -->> ", response)
            }
            
            guard let data = data else { return }
            
            do{
                let datos  = try JSONDecoder().decode(PostModel.self, from: data)
                if !datos.token.isEmpty {
                    //Para aligerar la aplicacion
                    DispatchQueue.main.async {
                        print(datos.token)
                        self.authenticated = 1
                        UserDefaults.standard.setValue(1, forKey: "sesion")
                    }
                }
            }catch let error as NSError {
                print("El error al hacer post --> ", error)
                DispatchQueue.main.async {
                    self.authenticated = 2
                }
            }
            
        }.resume()
        
    }
    
}
