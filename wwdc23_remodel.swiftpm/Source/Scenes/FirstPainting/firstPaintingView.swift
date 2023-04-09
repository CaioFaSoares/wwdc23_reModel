//
//  File.swift
//  
//
//  Created by Caio Soares on 04/04/23.
//

import Foundation
import SwiftUI

struct firstPaitingView: View {
	
	@State var changingBackgroundColor: UIColor = .systemPink
	
	var body: some View {
		ZStack {
			firstPaintingRepresentable(backgroundColor: $changingBackgroundColor)
				.ignoresSafeArea()
			VStack {
				Text("teste!")
				Button("what's the view?") {
					changingBackgroundColor = .systemMint
				}
			}
			.hiddenNavigationBarStyle()
		}
	}
}
