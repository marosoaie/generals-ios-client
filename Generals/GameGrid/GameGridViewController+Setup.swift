//
//  GameGridViewController+Setup.swift
//  Generals
//
//  Created by Mihai Arosoaie on 15/07/2017.
//  Copyright © 2017 Mihai Arosoaie. All rights reserved.
//
import UIKit

extension GameGridViewController {
    
    func addScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        
        if #available(iOS 11.0, *) {
            scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        } else {
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        }
        if #available(iOS 11.0, *) {
            scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        } else {
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        }
        scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        scrollView.contentSize = squareSize * size + (size * separatorWidth) - separatorWidth
        
    }
    
    func addSquares() {
        for i in 0..<Int(size.width) {
            for j in 0..<Int(size.height) {
                let layer = layers[i][j]
                let xOrigin = CGFloat(i) * squareSize.width + CGFloat(i) * separatorWidth
                let yOrigin = CGFloat(j) * squareSize.height + CGFloat(j) * separatorWidth
                layer.frame = CGRect(x: xOrigin, y: yOrigin, width: squareSize.width, height: squareSize.height)
                layer.backgroundColor = UIColor.lightGray.cgColor
                scrollView.layer.addSublayer(layer)
            }
        }
    }
    
    func addPanGestureRecognizer() {
        let panRecognizer = UIPanGestureRecognizer()
        panRecognizer.maximumNumberOfTouches = 1
        panRecognizer.addTarget(self, action: #selector(panned))
        scrollView.addGestureRecognizer(panRecognizer)
        scrollView.panGestureRecognizer.require(toFail: panRecognizer)
    }

}
