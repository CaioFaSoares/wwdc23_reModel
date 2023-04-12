//
//  File.swift
//  
//
//  Created by Caio Soares on 04/04/23.
//

import Foundation
import UIKit
import SwiftUI

class firstPaintingController: UIViewController {
	
	var bgc: UIColor!
	var firstStrokeRecognizer: fp1stGestureRecognizer!
	
	private let canvasView: UIView = {
		var bg = UIView()
		bg.frame = .zero
		bg.translatesAutoresizingMaskIntoConstraints = false
		bg.backgroundColor = .systemBrown
		return bg
	}()
	
	private var firstStrokeSVG: UIHostingController<SVGHostView> = {
		let view = UIHostingController(rootView: SVGHostView(svgFileName: "p1b1", svgColor: ".blue"))
		view.view.translatesAutoresizingMaskIntoConstraints = false
		view.view.frame = .zero
		view.view.alpha = 0
		return view
	}()
	
	private var testLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "label"
		return label
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
		buildLayout()
	}
	
}

extension firstPaintingController {
	
	@objc func circled(_ c: UIGestureRecognizer) {
		if c.state == .ended {
			canvasView.backgroundColor = .systemPink
	  }
	}
	
	func updateBackgroundColor() {
		view.backgroundColor = bgc
	}
	
}

extension firstPaintingController: ViewCoding {
	
	func setupView() {
		firstStrokeRecognizer = fp1stGestureRecognizer(target: self, action: #selector(circled))
		view.isUserInteractionEnabled = true
		view.addGestureRecognizer(firstStrokeRecognizer)
		view.backgroundColor = .clear
	}
	
	func setupHierarchy() {
		view.addSubview(self.canvasView)
		view.addSubview(self.firstStrokeSVG.view)
	}
	
	func setupConstraints() {
		
		NSLayoutConstraint.activate([
			canvasView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			canvasView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			canvasView.heightAnchor.constraint(equalTo: view.heightAnchor),
			canvasView.widthAnchor.constraint(equalTo: view.widthAnchor),
			
			firstStrokeSVG.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			firstStrokeSVG.view.topAnchor.constraint(equalTo: view.topAnchor),
			firstStrokeSVG.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
		])
	}
	
}
