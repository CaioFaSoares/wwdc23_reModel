//
//  File.swift
//  
//
//  Created by Caio Soares on 04/04/23.
//

import Foundation
import SwiftUI

struct firstPaintingRepresentable: UIViewControllerRepresentable {
	@Binding var obs: firstPaintingObservable
	
	func makeUIViewController(context: Context) -> firstPaintingController {
		let viewController = firstPaintingController(observable: obs)
		return viewController
	}
	
	func updateUIViewController(_ uiViewController: firstPaintingController, context: Context) {
		uiViewController.observable = obs
	}
	
	typealias UIViewControllerType = firstPaintingController
	
}
