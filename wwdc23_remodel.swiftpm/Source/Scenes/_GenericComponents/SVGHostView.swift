//
//  SwiftUIView.swift
//  
//
//  Created by Caio Soares on 09/04/23.
//

import SwiftUI

struct SVGHostView: View {
	
	var svgFileName: String
	var index: Int
	
//	@ObservedObject var strokeColors: strokeColors
	
    var body: some View {
		ZStack {
			Image(svgFileName)
				.ignoresSafeArea()
			Color("testPurple")
				.blendMode(.colorDodge)
			
		}
    }
}


