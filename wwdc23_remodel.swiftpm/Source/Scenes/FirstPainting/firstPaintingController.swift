//
//  File.swift
//  
//
//  Created by Caio Soares on 04/04/23.
//

import Foundation
import UIKit

class firstPaintingController: UIViewController {
	
	private var canvas: UIView {
		let canvas = UIView(frame: .zero)
		canvas.translatesAutoresizingMaskIntoConstraints = false
		canvas.backgroundColor = .systemMint
		return canvas
	}
	
	var thunderRecognizer: ThunderGestureRecognizer!
	var checkRecognizer: CheckGestureRecognizer!

	@objc func circled(_ c: UIGestureRecognizer) {
		if c.state == .ended {
			canvas.backgroundColor = UIColor.systemTeal
	  }
	}
	
	override func viewDidLoad() {
		setupView()
	}
	
}

extension firstPaintingController: ViewCoding {
	
	func setupView() {
		checkRecognizer = CheckGestureRecognizer(target: self, action: #selector(circled))
		thunderRecognizer = ThunderGestureRecognizer(target: self, action: #selector(circled))
		view.backgroundColor = .systemPink
		view.isUserInteractionEnabled = true
		view.addGestureRecognizer(checkRecognizer)
		view.addGestureRecognizer(thunderRecognizer)
	}
	
	func setupHierarchy() {	}
	
	func setupConstraints() { }
	
}
