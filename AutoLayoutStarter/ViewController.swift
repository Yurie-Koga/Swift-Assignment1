//
//  ViewController.swift
//  AutoLayoutStarter
//
//  Created by Derrick Park on 2019-04-17.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
  let mainView: UIView = {
    let main = UIView()
    // important when setting contraints programmatically
    main.translatesAutoresizingMaskIntoConstraints = false
    main.backgroundColor = .green
    return main
  }()
  
  let squareButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Square", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(squareTapped), for: .touchUpInside)
    return butt
  }()
  
  let portraitButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Portrait", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(portraitTapped), for: .touchUpInside)
    return butt
  }()
  
  let landScapeButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Landscape", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(landscapeTapped), for: .touchUpInside)
    return butt
  }()
  
    
    let purpleBox: UIView = {
        let purpleBox = UIView()
        purpleBox.translatesAutoresizingMaskIntoConstraints = false
        purpleBox.backgroundColor = .purple
        return purpleBox
    }()
    
  var widthAnchor: NSLayoutConstraint?
  var heightAnchor: NSLayoutConstraint?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.addSubview(mainView)
    setupLayout()
  }

  fileprivate func setupLayout() {
    mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    widthAnchor = mainView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7, constant: 0)
    widthAnchor?.isActive = true
    
    heightAnchor = mainView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7, constant: 0)
    heightAnchor?.isActive = true
    
    let buttStackView = UIStackView(arrangedSubviews: [
      squareButton, portraitButton, landScapeButton])
    buttStackView.translatesAutoresizingMaskIntoConstraints = false
    buttStackView.axis = .horizontal
    buttStackView.alignment = .center
    buttStackView.distribution = .fillEqually
    
    view.addSubview(buttStackView)
    NSLayoutConstraint.activate([
      buttStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
      buttStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      buttStackView.heightAnchor.constraint(equalToConstant: 50),
      buttStackView.widthAnchor.constraint(equalTo: view.widthAnchor)
      ])
    
    
    mainView.addSubview(purpleBox)
    purpleBox.bottomAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.bottomAnchor, constant: -25).isActive = true
    purpleBox.trailingAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.trailingAnchor, constant: -25).isActive = true
    purpleBox.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.7, constant: 0).isActive = true
    purpleBox.heightAnchor.constraint(equalTo: mainView.heightAnchor, multiplier: 0.1, constant: 0).isActive = true
    
    addBlueBoxes()
    addOrangeBoxes()
  }
        
    func addBlueBoxes() {
        let botton1 = UIButton()
        botton1.translatesAutoresizingMaskIntoConstraints = false
        botton1.backgroundColor = .blue
        let botton2 = UIButton()
        botton2.translatesAutoresizingMaskIntoConstraints = false
        botton2.backgroundColor = .blue
        let botton3 = UIButton()
        botton3.translatesAutoresizingMaskIntoConstraints = false
        botton3.backgroundColor = .blue
        
        let boxStackView = UIStackView(arrangedSubviews: [botton1, botton2, botton3])
        boxStackView.translatesAutoresizingMaskIntoConstraints = false
        boxStackView.axis = .vertical
        boxStackView.alignment = .center
        boxStackView.distribution = .equalSpacing
        boxStackView.spacing = 20
        mainView.addSubview(boxStackView)

        boxStackView.leadingAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        boxStackView.trailingAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true

        boxStackView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        boxStackView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor).isActive = true
        boxStackView.heightAnchor.constraint(equalTo: mainView.heightAnchor, multiplier: 0.6).isActive = true

        botton1.widthAnchor.constraint(equalToConstant: 50).isActive = true
        botton1.heightAnchor.constraint(equalToConstant: 50).isActive = true
        botton2.widthAnchor.constraint(equalToConstant: 50).isActive = true
        botton2.heightAnchor.constraint(equalToConstant: 50).isActive = true
        botton3.widthAnchor.constraint(equalToConstant: 50).isActive = true
        botton3.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    func addOrangeBoxes() {
        let botton1 = UIButton()
        botton1.translatesAutoresizingMaskIntoConstraints = false
        botton1.backgroundColor = .orange
        let botton2 = UIButton()
        botton2.translatesAutoresizingMaskIntoConstraints = false
        botton2.backgroundColor = .orange
        
        let boxStackView = UIStackView(arrangedSubviews: [botton1, botton2])
        boxStackView.translatesAutoresizingMaskIntoConstraints = false
        boxStackView.axis = .horizontal
        boxStackView.alignment = .center
        // seems no need to fill or spacing
//        boxStackView.distribution = .fillProportionally
        boxStackView.spacing = UIStackView.spacingUseSystem
        boxStackView.backgroundColor = .red
        boxStackView.isLayoutMarginsRelativeArrangement = true
        // padding
        boxStackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        mainView.addSubview(boxStackView)

        boxStackView.topAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        boxStackView.trailingAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.trailingAnchor, constant: -25).isActive = true
        boxStackView.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.3, constant: 0).isActive = true
//        boxStackView.heightAnchor.constraint(equalTo: mainView.heightAnchor, multiplier: 0.1, constant: 0).isActive = true
        // fix height
        boxStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        botton1.widthAnchor.constraint(equalTo: boxStackView.widthAnchor, multiplier: 0.6).isActive = true
//        botton1.heightAnchor.constraint(equalTo: boxStackView.heightAnchor, multiplier: 0.7).isActive = true
        // fix height
        botton1.heightAnchor.constraint(equalToConstant: 50).isActive = true
        // no need to set width to use the rest of space
//        botton2.widthAnchor.constraint(equalTo: boxStackView.widthAnchor, multiplier: 0.6).isActive = true
        
//        botton2.heightAnchor.constraint(equalTo: boxStackView.heightAnchor, multiplier: 0.7).isActive = true
        // fix height
        botton2.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

  @objc private func squareTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
  }
  
  @objc private func portraitTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.7)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
    
  }
  
  @objc private func landscapeTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.95)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
  }
}

