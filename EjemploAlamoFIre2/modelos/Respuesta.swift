//
//  Respuesta.swift
//  EjemploAlamoFIre2
//
//  Created by Luca on 11/01/2024.
//

import Foundation

struct Album: Decodable{
    let userId: Int
    let id: Int
    let title: String
}

typealias listaAlbums = [Album]

struct Photo: Decodable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}

typealias listaPhotos = [Photo]

struct nuevoAlbum: Encodable{
    let userId: Int
    let title: String
}
