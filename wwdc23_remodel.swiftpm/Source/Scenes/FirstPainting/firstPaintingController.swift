//
//  File.swift
//  
//
//  Created by Caio Soares on 04/04/23.
//

import Foundation
import UIKit

class firstPaintingController: UIViewController {
	
	var bgc: UIColor!
	var firstStrokeRecognizer: fp1stGestureRecognizer!
	
	private let canvasView: UIView = {
		var bg = UIView()
		bg.frame = .zero
		bg.backgroundColor = .systemBrown
		return bg
	}()
	
	internal init(bgc: UIColor? = nil, firstStrokeRecognizer: fp1stGestureRecognizer? = nil) {
		self.bgc = bgc
		self.firstStrokeRecognizer = firstStrokeRecognizer
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		setupView()
	}
	
}

extension firstPaintingController {
	
	@objc func circled(_ c: UIGestureRecognizer) {
		if c.state == .ended {
			print("test")
	  }
	}
	
	func updateBackgroundColor() {
		view.backgroundColor = bgc
	}
	
}

extension firstPaintingController: ViewCoding {
	
	func setupView() {
		firstStrokeRecognizer = fp1stGestureRecognizer(target: self, action: #selector(circled))
		view.isUserInteractionEnabled = false
		view.addGestureRecognizer(firstStrokeRecognizer)
		view.backgroundColor = bgc
	}
	
	func setupHierarchy() {
		view.addSubview(canvasView)
	}
	
	func setupConstraints() {
		
		canvasView.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			canvasView.topAnchor.constraint(equalTo: view.topAnchor),
			canvasView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			canvasView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			canvasView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
		])
	}
	
}
