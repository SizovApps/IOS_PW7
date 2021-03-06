//
//  ViewController.swift
//  visizovPW7
//
//  Created by user on 27.01.2022.
//

import UIKit
import CoreLocation
import MapKit

final class MapController: UIViewController {

    let goButton: UIButton = {
        let goButton = UIButton(type: .system)
        goButton.setTitle("Go", for: .normal)
        goButton.translatesAutoresizingMaskIntoConstraints = false
        goButton.backgroundColor = .blue
        return goButton
    }()
    
    let clearButton: UIButton = {
        let clearButton = UIButton(type: .system)
        clearButton.setTitle("Clear", for: .normal)
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        clearButton.backgroundColor = .gray
        return clearButton
    }()
    
    let startLocation: UITextField = {
     let control = UITextField()
     control.backgroundColor = UIColor.lightGray
     control.textColor = UIColor.black
     control.placeholder = "From"
     control.layer.cornerRadius = 2
     control.clipsToBounds = false
     control.font = UIFont.systemFont(ofSize: 15)
     control.borderStyle = UITextField.BorderStyle.roundedRect
     control.autocorrectionType = UITextAutocorrectionType.yes
     control.keyboardType = UIKeyboardType.default
     control.returnKeyType = UIReturnKeyType.done
     control.clearButtonMode =
    UITextField.ViewMode.whileEditing
     control.contentVerticalAlignment =
    UIControl.ContentVerticalAlignment.center
     return control
     }()
    
    let endLocation: UITextField = {
     let control = UITextField()
     control.backgroundColor = UIColor.lightGray
     control.textColor = UIColor.black
     control.placeholder = "End"
     control.layer.cornerRadius = 2
     control.clipsToBounds = false
     control.font = UIFont.systemFont(ofSize: 15)
     control.borderStyle = UITextField.BorderStyle.roundedRect
     control.autocorrectionType = UITextAutocorrectionType.yes
     control.keyboardType = UIKeyboardType.default
     control.returnKeyType = UIReturnKeyType.done
     control.clearButtonMode =
    UITextField.ViewMode.whileEditing
     control.contentVerticalAlignment =
    UIControl.ContentVerticalAlignment.center
     return control
     }()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.addSubview(mapView)
        
        view.addSubview(goButton)
        view.addSubview(clearButton)
        
        configureUI()
        
        SetupButtons()
        
        let textStack = UIStackView()
         textStack.axis = .vertical
         view.addSubview(textStack)
         textStack.spacing = 10
         textStack.pin(to: view, [.top: 50, .left: 10, .right: 10])
         [startLocation, endLocation].forEach { textField in
         textField.setHeight(to: 40)
         textField.delegate = self
         textStack.addArrangedSubview(textField)
         }
        


    }
    
    private let mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.layer.masksToBounds = true
        mapView.layer.cornerRadius = 5
        mapView.clipsToBounds = false
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.showsScale = true
        mapView.showsCompass = true
        mapView.showsTraffic = true
        mapView.showsBuildings = true
        mapView.showsUserLocation = true

        
        return mapView
    } ()
    
    private func configureUI() {
        mapView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        mapView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        mapView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1).isActive = true
        mapView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
     return .lightContent
     }
    
    private func SetupButtons() {
        goButton.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        goButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2).isActive = true
        goButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        
        clearButton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        clearButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2).isActive = true
        clearButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        
    
    }
    
    @objc func clearButtonWasPressed() {
    
    }

}


extension MapController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

