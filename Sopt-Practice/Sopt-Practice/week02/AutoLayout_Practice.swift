//
//  AutoLayout_Practice.swift
//  Sopt-Practice
//
//  Created by 성환 on 4/11/26.
//

import UIKit

class AutoLayout_Practice: UIViewController {
    
    let yellowBox: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        
        return view
    }()
    
    let greenBox: UIView = {
        let view = UIView()
        view.backgroundColor = .green
       
        return view
    }()
    
    let blackBox: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        
        return view
    }()
    
    let blueBox: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        
        return view
    }()
    
    func setUI() {
        view.addSubviews(yellowBox, greenBox, blackBox, blueBox)
        
        yellowBox.translatesAutoresizingMaskIntoConstraints = false
        greenBox.translatesAutoresizingMaskIntoConstraints = false
        blackBox.translatesAutoresizingMaskIntoConstraints = false
        blueBox.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setLayout() {
        NSLayoutConstraint.activate([yellowBox.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
                                     yellowBox.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25)])
        NSLayoutConstraint.activate([greenBox.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
                                     greenBox.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25),
                                     greenBox.topAnchor.constraint(equalTo: yellowBox.bottomAnchor),
                                     greenBox.leadingAnchor.constraint(equalTo: yellowBox.trailingAnchor)])
        NSLayoutConstraint.activate([blackBox.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
                                     blackBox.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25),
                                     blackBox.topAnchor.constraint(equalTo: greenBox.bottomAnchor),
                                     blackBox.trailingAnchor.constraint(equalTo: greenBox.leadingAnchor)])
        NSLayoutConstraint.activate([blueBox.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
                                     blueBox.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25),
                                     blueBox.leadingAnchor.constraint(equalTo: blackBox.trailingAnchor),
                                     blueBox.topAnchor.constraint(equalTo: blackBox.bottomAnchor)])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
        setLayout()
    }
    
}
