//
//  File.swift
//  
//
//  Created by Caio Soares on 04/04/23.
//

import Foundation
import SwiftUI

struct firstPaintingRepresentable: UIViewControllerRepresentable {
	
	@ObservedObject var coordinator: conversationsCoordinator
	
	func makeUIViewController(context: Context) -> firstPaintingController {
		let viewController = firstPaintingController(coordinator: coordinator)
		return viewController
	}
	
	func updateUIViewController(_ uiViewController: firstPaintingController, context: Context) {
		uiViewController.coordinator = coordinator
//		uiViewController.updateBackgroundColor()
	}
	
	typealias UIViewControllerType = firstPaintingController
	
}
