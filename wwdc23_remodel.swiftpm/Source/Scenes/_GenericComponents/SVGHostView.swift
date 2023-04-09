//
//  SwiftUIView.swift
//  
//
//  Created by Caio Soares on 09/04/23.
//

import SwiftUI

struct SVGHostView: View {
	
	var svgFileName: String
	var svgColor: String
	
    var body: some View {
        Image(svgFileName)
			.ignoresSafeArea()
			.foregroundColor(.black)
    }
}


