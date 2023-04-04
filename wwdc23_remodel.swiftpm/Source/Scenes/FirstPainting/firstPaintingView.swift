//
//  File.swift
//  
//
//  Created by Caio Soares on 04/04/23.
//

import Foundation
import SwiftUI

struct firstPaitingView: View {
	
	@State var showNextView: Bool = false
	
	var paintingRepresentable = firstPaintingRepresentable()
	
	var body: some View {
		if showNextView {
			firstPaintingRepresentable()
				.ignoresSafeArea()
		} else {
			ZStack {
				firstPaintingRepresentable()
				Text("teste!")
			}
		}
	}
}
