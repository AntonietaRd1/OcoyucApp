//
//  MapViewController.swift
//  OcoyucApp
//
//  Created by Administrador on 09/10/24.
//

//import Foundation

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate  {
    
    var manager = CLLocationManager()
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Asignar delegados
        mapView.delegate = self
        manager.delegate = self
        //Pedir permiso para el GPS
        if (manager.responds(to: #selector(CLLocationManager.requestWhenInUseAuthorization))){
            manager.requestWhenInUseAuthorization()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //aqui guardar todo lo que se necesite antes de que cierre la app
        //si esta usando mucha memoria
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let region = MKCoordinateRegion(center: userLocation.coordinate, latitudinalMeters: 700, longitudinalMeters: 700)
        mapView.setRegion(mapView.regionThatFits(region), animated: true)
        //se necesitan permisos, agregar en info en frameworks, add Privacy - Location When In Use Usage Description
        
        let point = MKPointAnnotation()
        point.coordinate = userLocation.coordinate
        point.title = "¿Me puedes ver?"
        point.subtitle = "Estoy aquí"
        mapView.addAnnotation(point)
    }
    
}

