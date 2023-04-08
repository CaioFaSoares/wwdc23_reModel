import SwiftUI

struct MainMenuView: View {
	
	@State var showNextView: Bool = false
	
    var body: some View {
		NavigationView {
			VStack {
				Spacer()
				Image("Logo")
				Button ("Start") {
					showNextView.toggle()
				}
				NavigationLink(destination: firstPaitingView(), isActive: $showNextView) { EmptyView() }
				Spacer()
			}
		}
		.hiddenNavigationBarStyle()
    }
}

struct HiddenNavigationBar: ViewModifier {
	func body(content: Content) -> some View {
		content
		.navigationViewStyle(.stack)
		.navigationBarTitle("", displayMode: .inline)
		.navigationBarHidden(true)
	}
}

extension View {
	func hiddenNavigationBarStyle() -> some View {
		modifier( HiddenNavigationBar() )
	}
}
