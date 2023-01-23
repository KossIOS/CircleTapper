//
//  ViewController.swift
//  CircleTapper
//
//  Created by Konstantyn Koroban on 25/09/2021.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var circleView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        view.backgroundColor = .black
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture(_:)))
        view.addGestureRecognizer(tapGesture)
        
    }
    
    private func makeRandomSize() -> CGSize {
        let random = CGFloat.random(in: 30...90)
        let randomSize = CGSize(width: random, height: random)
        return randomSize
        
    }
    
    private func setRandomSize(for view: UIView) {
        let randomSize = makeRandomSize()
        view.frame.size = randomSize
        view.layer.cornerRadius = randomSize.width / 2
    }
    
    private func makeRandomColor() -> UIColor {
        .init(red: .random(in: 0...1),
              green: .random(in: 0...1),
              blue: .random(in: 0...1),
              alpha: 1)
    }
    
    private func setRandomColor(for view: UIView) {
        view.backgroundColor = makeRandomColor()
        
    }
    
    private func makeCircleView() -> UIView {
        let circleView = UIView()
        setRandomSize(for: circleView)
        setRandomColor(for: circleView)
        return circleView
        
    }
    
    @objc
    private func handleTapGesture(_ recognizer: UITapGestureRecognizer) {
        circleView = makeCircleView()
        
        let positionCenter = recognizer.location(in: view)
        circleView.center = positionCenter
        setRandomColor(for: circleView)
        setRandomSize(for: circleView)
        view.addSubview(circleView)
        
        let removeViewGesture = UITapGestureRecognizer(target: self, action: #selector(removefromView(_:)))
        circleView.addGestureRecognizer(removeViewGesture)
        
    }
    
    @objc
    private func removefromView(_ recognizer2: UITapGestureRecognizer) {
        recognizer2.view?.removeFromSuperview()
        
    }
}

