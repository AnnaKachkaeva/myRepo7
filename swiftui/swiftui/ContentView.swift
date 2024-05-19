import SwiftUI

extension AnyTransition {
    static var moveAndFade: AnyTransition {

        .push(from: .bottom)

//        .asymmetric(
//            insertion: .scale(scale:1), //.move(edge: .bottom),
//            removal: .scale.combined(with: .opacity)
//        )
    }
}



struct ContentView: View {
    @Namespace private var animation
    @State private var isExpanded: Bool = false

    var body: some View {
        if isExpanded {
            ZStack(alignment: .topLeading) {
                Color.cyan
                    .cornerRadius(25)
                    .matchedGeometryEffect(id: "button", in: animation)
                    .frame(
                        width: isExpanded ? 350 : 100,
                        height: isExpanded ? 450 : 50
                    )
                Button(action: {
                    withAnimation(.spring) {
                        isExpanded.toggle()
                    }
                }) {
                    HStack {
                        Text("<- Back")
                            .font(.title3.bold())
                    }
                    .padding()
                    .foregroundStyle(.white)
                    .matchedGeometryEffect(id: "Text", in: animation, properties: .position, anchor: .leading)
                }
            }
        } else {
            Button(action: {
                withAnimation(.spring) {
                    isExpanded.toggle()
                }
            }) {
                Color.cyan
                    .cornerRadius(15)
                    .matchedGeometryEffect(id: "button", in: animation)
                    .frame(
                        width: !isExpanded ? 100 : 350,
                        height: !isExpanded ? 50 : 450
                    )
                    .overlay(
                        Text("Open")
                            .font(.title3.bold())
                            .foregroundStyle(.white)
                            .matchedGeometryEffect(id: "Text", in: animation, properties: .position, anchor: .leading)
                    )
                    .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: isExpanded ? .center : .bottomTrailing)
        }
    }
}
