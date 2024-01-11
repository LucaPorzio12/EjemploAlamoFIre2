//
//  ApiConexiones.swift
//  EjemploAlamoFIre2
//
//  Created by Luca on 11/01/2024.
//

import Foundation
import Alamofire

final class ApiConexiones{
    static let api = ApiConexiones()
    let BASE_URL="https://jsonplaceholder.typicode.com"
    let estadoOK = 200...299


    func getAlbums(success: @escaping (_ respuesta: listaAlbums) -> (), failure: @escaping(_ error: Error?) -> ()){
        let url = "\(BASE_URL)/albums"
        
        AF.request(url, method: .get).validate(statusCode: estadoOK).responseDecodable(of: listaAlbums.self){
            respuesta in
            if let albums = respuesta.value{
                success(albums)
            }else{
                failure(respuesta.error)
            }
        }
    }
    
    //POR PARÁMETRO
    func getPhotosAlbum(idAlbum: Int, success: @escaping (_ respuesta: listaPhotos) -> (), failure: @escaping(_ error: Error?) -> ()) {
        let url = "\(BASE_URL)/photos"
        let parametros: Parameters = ["albumId": idAlbum]
        
        AF.request(url, method: .get, parameters: parametros).validate(statusCode: estadoOK).responseDecodable(of: listaPhotos.self){
            respuesta in
            if let photos = respuesta.value{
                success(photos)
            }else{
                failure(respuesta.error)
            }
        }
    }
    
    //POR PATH
    func getPhotosAlbum2(idAlbum: Int, success: @escaping (_ respuesta: listaPhotos) -> (), failure: @escaping(_ error: Error?) -> ()) {
        let url = "\(BASE_URL)/albums/\(idAlbum)/photos"
        
        AF.request(url, method: .get).validate(statusCode: estadoOK).responseDecodable(of: listaPhotos.self){
            respuesta in
            if let photos = respuesta.value{
                success(photos)
            }else{
                failure(respuesta.error)
            }
        }
    }
    
    //POST
    func addAlbum(album: nuevoAlbum, success: @escaping (_ respuesta: Album) -> (), failure: @escaping(_ error: Error?) -> ()) {
        
        let url = "\(BASE_URL)/albums"
        
        AF.request(url, method: .post, parameters: album,encoder: JSONParameterEncoder.default).validate(statusCode: estadoOK).responseDecodable(of: Album.self){
            respuesta in
            if let album = respuesta.value, album.id != nil{
                success(album)
            }else{
                failure(respuesta.error)
            }
        }
    }
}
