//
//  ViewController.swift
//  EjemploAlamoFIre2
//
//  Created by Luca on 11/01/2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbResultadoListaAlbums: UILabel!
    @IBOutlet weak var cargando: UIActivityIndicatorView!
    @IBOutlet weak var txtIdAlbum: UITextField!
    @IBOutlet weak var lbPhotos: UILabel!
    @IBOutlet weak var txtUserID: UITextField!
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var lbResultadoCrear: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cargando.hidesWhenStopped = true
        cargando.stopAnimating()
    }

    @IBAction func btnGetAlbums(_ sender: Any) {
        cargando.startAnimating()

        ApiConexiones.api.getAlbums(){
            respuesta in
            self.cargando.stopAnimating()
            self.lbResultadoListaAlbums.text = "Total Albums: \(respuesta.count)"
        }failure: {
            error in
            self.cargando.stopAnimating()
            self.lbResultadoListaAlbums.text = error.debugDescription
        }
    }
    
    @IBAction func btnGetPhotos(_ sender: Any) {
        cargando.startAnimating()
        let idAlbum:Int = Int(txtIdAlbum.text!)!
        
        /*POR PARÁMETRO*/
        //ApiConexiones.api.getPhotosAlbum(idAlbum: idAlbum){
        
        /*POR PATH*/ApiConexiones.api.getPhotosAlbum2(idAlbum: idAlbum){

            respuesta in
            self.cargando.stopAnimating()
            self.lbPhotos.text = "Total Photos: \(respuesta.count)"
        }failure: {
            error in
            self.cargando.stopAnimating()
            self.lbPhotos.text = error.debugDescription
        }
    }
    
    @IBAction func btnCrearAlbum(_ sender: Any) {
        cargando.startAnimating()
        var a = nuevoAlbum(userId: Int(txtUserID.text!)!, title: txtTitle.text!)
        
        ApiConexiones.api.addAlbum(album: a){
            respuesta in
            self.cargando.stopAnimating()
            self.lbResultadoCrear.text = "Id Nuevo: \(respuesta.id)"
        }failure: {
            error in
            self.cargando.stopAnimating()
            self.lbResultadoCrear.text = error.debugDescription
        }
    }
}

