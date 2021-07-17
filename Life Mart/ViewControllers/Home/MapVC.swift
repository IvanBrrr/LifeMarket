//
//  MapVC.swift
//  Life Mart
//
//  Created by Islam Mamayunusov on 17/07/21.
//

import UIKit
import YandexMapsMobile

class MapVC: UIViewController {
    var  viewModel : MapViewModel!


    init(viewModel: MapViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "MapVC", bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @IBOutlet weak var mapView: YMKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let TARGET_LOCATION = YMKPoint(latitude: viewModel.lat, longitude: viewModel.long)

        
        mapView.mapWindow.map.move(
            with: YMKCameraPosition(target: TARGET_LOCATION, zoom: 15, azimuth: 0, tilt: 0),
            animationType: YMKAnimation(type: YMKAnimationType.smooth, duration: 0.5),
            cameraCallback: nil)
        
        let mapObjects = mapView.mapWindow.map.mapObjects
        let placemark = mapObjects.addPlacemark(with: TARGET_LOCATION)
        placemark.opacity = 1.0
        placemark.isDraggable = true
        placemark.setIconWith(UIImage(named:"pointer")!)
        
    }
    
    @IBAction func backTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
