//
//  ScrollViewPractice1.swift
//  Sopt-Practice
//
//  Created by 성환 on 4/11/26.
//

import UIKit

import SnapKit

class ScrollViewPractice2: UIViewController {
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let redView = UIView()
    private let orangeView = UIView()
    private let yellowView = UIView()
    private let grennView = UIView()
    private let blueView = UIView()
    private let purpleView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
    
    private func setUI() {
        view.backgroundColor = .white
        redView.backgroundColor = .red
        orangeView.backgroundColor = .orange
        yellowView.backgroundColor = .yellow
        grennView.backgroundColor = .green
        blueView.backgroundColor = .blue
        purpleView.backgroundColor = .purple
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        [redView, orangeView, yellowView, grennView, blueView, purpleView].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func setLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.frameLayoutGuide)
            $0.height.greaterThanOrEqualToSuperview().priority(.low)
        }
        
        let width = UIScreen.main.bounds.width/2
        let height = 337
        
        redView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalTo(width)
            $0.height.equalTo(height)
        }
        
        orangeView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalTo(width)
            $0.height.equalTo(height)
            $0.leading.equalTo(redView.snp.trailing)
        }
        
        yellowView.snp.makeConstraints {
            $0.top.equalTo(redView.snp.bottom)
            $0.width.equalTo(width)
            $0.height.equalTo(height)
        }
        
        grennView.snp.makeConstraints {
            $0.top.equalTo(orangeView.snp.bottom)
            $0.width.equalTo(width)
            $0.height.equalTo(height)
            $0.leading.equalTo(yellowView.snp.trailing)
        }
        
        blueView.snp.makeConstraints {
            $0.top.equalTo(yellowView.snp.bottom)
            $0.width.equalTo(width)
            $0.height.equalTo(height)
        }
        
        purpleView.snp.makeConstraints {
            $0.top.equalTo(grennView.snp.bottom)
            $0.width.equalTo(width)
            $0.height.equalTo(height)
            $0.leading.equalTo(blueView.snp.trailing)
            $0.bottom.equalToSuperview()
        }
    }
}
