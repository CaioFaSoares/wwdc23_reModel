//
//  File.swift
//  
//
//  Created by Caio Soares on 04/04/23.
//

import Foundation
import SwiftUI

class firstPaintingObservable: ObservableObject {
	@Published var backgroundColor: UIColor = .systemRed
	var changeColorToMint: (() -> Void)!
}

struct firstPaitingView: View {
	
	@State var showNextView: Bool = false
	@State var obs = firstPaintingObservable()
	
	var body: some View {
		ZStack {
			firstPaintingRepresentable(obs: $obs)
			VStack {
				Text("teste!")
				Button("test button") {
					obs.backgroundColor = .systemMint
				}
				Button("what's the view?") {
					print(obs.backgroundColor)
				}
			}
			.hiddenNavigationBarStyle()
		}
	}
}
