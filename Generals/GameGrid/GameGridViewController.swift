//
//  GameGridViewController.swift
//  Generals
//
//  Created by Mihai Arosoaie on 14/07/2017.
//  Copyright © 2017 Mihai Arosoaie. All rights reserved.
//

import UIKit

class GameGridViewController: UIViewController {
    
    
    let size: CGSize
    let squareSize: CGSize
    let scrollView = UIScrollView()
    let separatorWidth: CGFloat
    
    let layers: [[CALayer]]
    
    
    init(size: CGSize, squareSize: CGSize = CGSize(width: 50, height: 50), separatorWidth: CGFloat = 2) {
        self.size = size
        self.squareSize = squareSize
        self.separatorWidth = separatorWidth
        self.layers = (0..<Int(size.height)).map { _ in
            return (0..<Int(size.width)).map { _ in
                return CALayer()
            }
        }
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Not implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addScrollView()
        addSquares()
        addPanGestureRecognizer()

    }
    
    let myColor = UIColor.red
    
    @objc func panned(sender: UIPanGestureRecognizer) {
        
        switch sender.state {
        case .began:
            print("began")
        case .cancelled:
            print("cancelled")
        case .changed:
            let touchPoint = sender.location(in: scrollView)
            print(touchPoint)
            guard let mPos = indexesFor(hitPoint: touchPoint) else {return}
            let layer = layers[mPos.i][mPos.j]
            print(layer.frame)
            if !(layer.backgroundColor == myColor.cgColor) {
                CATransaction.begin()
                CATransaction.setCompletionBlock({
                    layer.backgroundColor = self.myColor.cgColor
                })
                let animation = CABasicAnimation(keyPath: "backgroundColor")
                animation.toValue = myColor.cgColor
                animation.duration = 0.15
                layer.add(animation, forKey: "backgroundColor")
                animation.isRemovedOnCompletion = false
                CATransaction.commit()
            }
            print("changed")
        case .ended:
            print("ended")
        case .failed:
            print("failed")
        case .possible:
            print("possible")
        }
        
    }
    
    func indexesFor(hitPoint: CGPoint) -> (i: Int, j: Int)? {
        let i = Int(hitPoint.x / (squareSize.width + separatorWidth))
        let v1 = hitPoint.x - (CGFloat(i) * squareSize.width + CGFloat(i) * separatorWidth)
        guard 0 <= v1 && v1 <= squareSize.width else { return nil }
        
        let j = Int(hitPoint.y / (squareSize.height + separatorWidth))
        let v2 = hitPoint.y - (CGFloat(j) * squareSize.height + CGFloat(j) * separatorWidth)
        guard 0 <= v2 && v2 <= squareSize.height else { return nil }

        return (i, j)
    }
    
}


