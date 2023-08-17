//
//  Home2.swift
//  JSON-sesion
//
//  Created by Jonathan Casillas on 16/08/23.
//

import SwiftUI

struct Home2: View {
    
    @StateObject var json2 = Modelo2ViewModel()
    
    var body: some View {
        if json2.datosModelo.data.isEmpty {
            ProgressView()
        }else {
            List(json2.datosModelo.data, id:\.id){
                item in
                
                HStack{
                    Image(systemName: "person.fill")
                        .data(url: URL(string: item.avatar)!)
                        .frame(width: 80, height: 80 )
                        .clipped()
                        .clipShape(Circle())
                    VStack(alignment: .leading){
                        Text(item.first_name).font(.title)
                        Text(item.email).font(.subheadline)
                    }
                }.navigationTitle("JSON Con Image")
                
            }
        }
    }
}

extension Image {
    func data(url: URL ) -> Self {
        if let data = try? Data(contentsOf: url){
            return Image(uiImage: UIImage(data: data)! )
                .resizable()
        }
        return self.resizable()
    }
}

