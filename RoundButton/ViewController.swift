//
//  ViewController.swift
//  RoundButton
//
//  Created by Вячеслав Квашнин on 31.07.2022.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    let viewCenter: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        view.backgroundColor = .red
        view.layer.cornerRadius = 50
        return view
    }()

    let roundButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        button.backgroundColor = .purple
        button.layer.cornerRadius = 100
//        button.clipsToBounds = false
        button.layer.masksToBounds = false
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowOffset = CGSize(width: 2, height: 4)
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 2
        
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(roundButton)
        roundButton.center = view.center
        
        roundButton.addSubview(viewCenter)
        viewCenter.center = view.center
    }
    
    @objc func tapButton() {
        print("TAP")
    }
}

extension UIButton {
    override open func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let expandedBounds = self.bounds.insetBy(dx: -15, dy: -15)
        return expandedBounds.contains(point)
    }
}

struct MyProvider: PreviewProvider {
    static var previews: some View {
        ContainerView()
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> some ViewController {
            return ViewController()
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}
