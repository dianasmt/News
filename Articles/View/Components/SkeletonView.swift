import SwiftUI

struct SkeletonRow: View {
    @State var startPoint = UnitPoint.topLeading
    @State var endPoint = UnitPoint.bottomTrailing
    
    var gradient = [Color.gray.opacity(0.7), Color.gray.opacity(0.2)]
    
    var body: some View {
        VStack(alignment: .leading) {
            placeholder
        }
        .onAppear(perform: {
            DispatchQueue.main.async {
                withAnimation(.easeIn(duration: 1.0).repeatForever()) {
                    self.startPoint = UnitPoint(x: 0.9, y: 0.9)
                }
            }
        }
        )
    }
    var gradientFill: LinearGradient {
        LinearGradient(
            gradient: Gradient(colors: self.gradient),
            startPoint: self.startPoint,
            endPoint: self.endPoint
        )
    }
    
    var placeholder: some View {
        Rectangle()
            .fill(gradientFill)
            .cornerRadius(12.0)
    }
}
