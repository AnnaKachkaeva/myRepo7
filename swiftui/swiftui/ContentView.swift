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
    @Namespace var animation
    @State var showDetail = false

    var body: some View {
        ZStack {
            if (!showDetail) {
                HStack {
                    Spacer()
                    VStack {
                        Spacer()
                        Button("open me") {
                            withAnimation {
                                showDetail.toggle()
                            }
                        }
                        .matchedGeometryEffect(id: "button", in: animation)
                        .buttonStyle(.borderedProminent)
                        .padding(.trailing)
                    }
                }
            } else {
                DetailView(showDetail: $showDetail, animation: _animation)
            }
        }
        .onTapGesture {
            withAnimation(.easeInOut(duration: 4)) {
                showDetail.toggle()
            }
        }
    }
}



struct DetailView: View {
    @Binding var showDetail: Bool
    @Namespace var animation

    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(.blue)
            .frame(
                width: showDetail ? 350 : 100,
                height: showDetail ? 450 : 50
            )
            .overlay(
                alignment: .topLeading
            ) {
                Button("<- back") {
                    print("tapped")
                    showDetail.toggle()
                }
                .foregroundColor(.white)
                .padding(.all)
            }
            .matchedGeometryEffect(id: "button", in: animation)
    }
}


//struct ContentView: View {
//    @Namespace private var animation
//    @State private var isExpanded: Bool = false
//
//    var body: some View {
//        if isExpanded {
//            ZStack(alignment: .topLeading) {
//                Color.blue
//                    .cornerRadius(25)
//                    .matchedGeometryEffect(id: "button", in: animation)
//                    .frame(
//                        width: isExpanded ? 350 : 100,
//                        height: isExpanded ? 450 : 50
//                    )
//                Button(action: {
//                    withAnimation(.spring) {
//                        isExpanded.toggle()
//                    }
//                }) {
//                    HStack {
//                        Image(systemName: "arrowshape.backward.fill")
//                        Text("Back")
//                            .font(.title3.bold())
//                    }
//                    .padding()
//                    .foregroundStyle(.white)
//                    .matchedGeometryEffect(id: "Text", in: animation, properties: .position, anchor: .leading)
//                }
//            }
//        } else {
//            Button(action: {
//                withAnimation(.spring) {
//                    isExpanded.toggle()
//                }
//            }) {
//                Color.blue
//                    .cornerRadius(15)
//                    .matchedGeometryEffect(id: "button", in: animation)
//                    .frame(
//                        width: !isExpanded ? 100 : 350,
//                        height: !isExpanded ? 50 : 450
//                    )
//                    .overlay(
//                        Text("Open")
//                            .font(.title3.bold())
//                            .foregroundStyle(.white)
//                            .matchedGeometryEffect(id: "Text", in: animation, properties: .position, anchor: .leading)
//                    )
//                    .padding()
//            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: isExpanded ? .center : .bottomTrailing)
//        }
//    }
//}
