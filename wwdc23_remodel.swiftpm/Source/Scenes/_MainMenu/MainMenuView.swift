import SwiftUI

struct MainMenuView: View {
	
	@State var showNextView: Bool = false
	
    var body: some View {
		if showNextView {
			firstPaintingRepresentable()
				.ignoresSafeArea()
		} else {
			VStack {
				Spacer()
				Image("Logo")
				Button("Start", action: { showNextView.toggle() })
				Spacer()
			}
		}
    }
}