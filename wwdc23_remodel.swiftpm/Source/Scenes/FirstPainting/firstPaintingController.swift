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
	
	var firstStrokeRecognizer: lessThan_gesture!
	var secondStrokeRecognizer: moreThan_Gesture!
	var thirdStrokeRecognizer: vertLine_Gesture!
	var finishingStrokeRecognizer: horiLine_Gesture!
	
	@ObservedObject var coordinator: conversationsCoordinator
	
	var svgs: String = "p1b1"
	
	
	
	private let canvasView: UIView = {
		var bg = UIView()
		bg.frame = .zero
		bg.translatesAutoresizingMaskIntoConstraints = false
		bg.backgroundColor = .clear
		return bg
	}()
	
	lazy private var firstStrokeSVG: UIHostingController<SVGHostView> = {
		let view = UIHostingController(rootView: SVGHostView(svgFileName: svgs, index: 0))
		view.view.translatesAutoresizingMaskIntoConstraints = false
		view.view.frame = .zero
		view.view.alpha = 0
		return view
	}()
	
	lazy private var secondStrokeSVG: UIHostingController<SVGHostView> = {
		let view = UIHostingController(rootView: SVGHostView(svgFileName: svgs, index: 1))
		view.view.translatesAutoresizingMaskIntoConstraints = false
		view.view.frame = .zero
		view.view.alpha = 0
		return view
	}()
	
	lazy private var thirdStrokeSVG: UIHostingController<SVGHostView> = {
		let view = UIHostingController(rootView: SVGHostView(svgFileName: svgs, index: 2))
		view.view.translatesAutoresizingMaskIntoConstraints = false
		view.view.frame = .zero
		view.view.alpha = 0
		return view
	}()
	
	lazy private var forthStrokeSVG: UIHostingController<SVGHostView> = {
		let view = UIHostingController(rootView: SVGHostView(svgFileName: svgs, index: 3))
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
	
	init(coordinator: conversationsCoordinator) {
		self.coordinator = coordinator
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
	
	@objc func firstStrokeFunction(_ c: UIGestureRecognizer) {
		if c.state == .ended {
			canvasView.removeGestureRecognizer(firstStrokeRecognizer)
			canvasView.addGestureRecognizer(secondStrokeRecognizer)
			
			firstStrokeSVG.view.alpha = 1
			coordinator.afterPaintingPrepareNextDialogue()
			setupFirstStroke()
	  }
	}
	
	@objc func secondStrokeFunction(_ c: UIGestureRecognizer) {
		if c.state == .ended {
			canvasView.removeGestureRecognizer(secondStrokeRecognizer)
			canvasView.addGestureRecognizer(thirdStrokeRecognizer)
	  }
	}
	
	@objc func thirdStrokeFunction(_ c: UIGestureRecognizer) {
		if c.state == .ended {
			canvasView.backgroundColor = .systemMint
			canvasView.removeGestureRecognizer(thirdStrokeRecognizer)
			canvasView.addGestureRecognizer(finishingStrokeRecognizer)
	  }
	}
	
	@objc func finishingStrokeFunction(_ c: UIGestureRecognizer) {
		if c.state == .ended {
			canvasView.backgroundColor = .systemIndigo
			canvasView.removeGestureRecognizer(finishingStrokeRecognizer)
	  }
	}
	
//	func updateBackgroundColor() {
//		self.bgc = bgc
//	}
	
}

extension firstPaintingController {
	
	func setupViewAccordinglyToStroke(index: Int){
		if index == 1{
			coordinator.afterPaintingPrepareNextDialogue()
		}
	}
	
}

extension firstPaintingController: ViewCoding {
	
	func setupView() {
		firstStrokeRecognizer = lessThan_gesture(target: self, action: #selector(firstStrokeFunction))
		secondStrokeRecognizer = moreThan_Gesture(target: self, action: #selector(secondStrokeFunction))
		thirdStrokeRecognizer = vertLine_Gesture(target: self, action: #selector(thirdStrokeFunction))
		finishingStrokeRecognizer = horiLine_Gesture(target: self, action: #selector(finishingStrokeFunction))
		
		canvasView.addGestureRecognizer(firstStrokeRecognizer)
		canvasView.isUserInteractionEnabled = true
		
		view.isUserInteractionEnabled = true
		view.backgroundColor = .clear
	}
	
	func setupHierarchy() {
		view.addSubview(self.canvasView)
	}
	
	func setupConstraints() {
		
		NSLayoutConstraint.activate([
			canvasView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			canvasView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			canvasView.heightAnchor.constraint(equalTo: view.heightAnchor),
			canvasView.widthAnchor.constraint(equalTo: view.widthAnchor),
		])
	}
	
	func setupFirstStroke() {
		
		canvasView.addSubview(self.firstStrokeSVG.view)
		
		NSLayoutConstraint.activate([
			firstStrokeSVG.view.heightAnchor.constraint(equalTo: view.heightAnchor),
			firstStrokeSVG.view.widthAnchor.constraint(equalTo: view.widthAnchor),
		])
	}
	
}
