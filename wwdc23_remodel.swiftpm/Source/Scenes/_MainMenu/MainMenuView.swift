import SwiftUI

struct MainMenuView: View {
	
	@State private var showNextView: Bool = false
	@State private var isShowingCredits: Bool = false
	
    var body: some View {
		NavigationStack {
			VStack {
				Spacer()
				Image("Logo")
				Button ("Start") {
					showNextView.toggle()
				}
					.buttonStyle(.bordered)
					.padding(.all)
				NavigationLink(destination: firstPaitingView(), isActive: $showNextView) { EmptyView() }
				Spacer()
				HStack{
					Spacer()
					Button("Credits") {
						isShowingCredits.toggle()
					}
						.padding(.all)
						.sheet(isPresented: $isShowingCredits) {
									CreditsView()
								}
				}
			}
		}
		.hiddenNavigationBarStyle()
    }
}

struct CreditsView: View {
	@Environment(\.dismiss) var dismiss
	var body: some View {
		VStack {
			Text("Dedicated to my parents.")
				.padding(.all)
				.multilineTextAlignment(.center)
			Text("Special thanks to Luiz, Thiago and Yago. Couldn't have coded all of this without you guys. Also the folks @ Cydonia and the Dreamcast, you guys rock.")
				.padding(.all)
				.multilineTextAlignment(.center)
			Text("All of the assets were made by me, @caiofasoares.")
				.padding(.all)
				.multilineTextAlignment(.center)
			Button("Return to menu") {
				dismiss()
			}
		}
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
