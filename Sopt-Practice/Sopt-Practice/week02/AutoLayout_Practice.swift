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
        view.addSubview(yellowBox)
        view.addSubview(greenBox)
        view.addSubview(blackBox)
        view.addSubview(blueBox)
        
        yellowBox.translatesAutoresizingMaskIntoConstraints = false
        greenBox.translatesAutoresizingMaskIntoConstraints = false
        blackBox.translatesAutoresizingMaskIntoConstraints = false
        blueBox.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setLayout() {
        NSLayoutConstraint.activate([yellowBox.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
                                     yellowBox.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25)])
        NSLayoutConstraint.activate([greenBox.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
                                     greenBox.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25),])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
        setLayout()
    }
    
}
