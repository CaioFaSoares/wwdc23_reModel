//
//  File.swift
//  
//
//  Created by Caio Soares on 04/04/23.
//

import Foundation
import SwiftUI

struct firstPaintingRepresentable: UIViewControllerRepresentable {
	
	func makeUIViewController(context: Context) -> firstPaintingController {
		let vc = firstPaintingController()
		return vc
	}
	
	func updateUIViewController(_ uiViewController: firstPaintingController, context: Context) {
		
	}
	
	typealias UIViewControllerType = firstPaintingController
	
}
