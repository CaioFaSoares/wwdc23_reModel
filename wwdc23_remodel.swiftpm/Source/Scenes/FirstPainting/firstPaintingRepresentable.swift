//
//  File.swift
//  
//
//  Created by Caio Soares on 04/04/23.
//

import Foundation
import SwiftUI

struct firstPaintingRepresentable: UIViewControllerRepresentable {
	
	@Binding var backgroundColor: UIColor
	
	func makeUIViewController(context: Context) -> firstPaintingController {
		let viewController = firstPaintingController(bgc: backgroundColor)
		return viewController
	}
	
	func updateUIViewController(_ uiViewController: firstPaintingController, context: Context) {
		uiViewController.bgc = backgroundColor
		uiViewController.updateBackgroundColor()
	}
	
	typealias UIViewControllerType = firstPaintingController
	
}
