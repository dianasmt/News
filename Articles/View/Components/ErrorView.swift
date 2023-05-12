import SwiftUI

struct ErrorView: View {
    let error: Error
    let retryHandler: () -> Void

    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "exclamationmark.triangle")
                .resizable()
                .scaledToFit()
                .frame(width: 80.0, height: 80.0)
                .foregroundColor(.red)
            Text("An error occurred:")
                .font(.headline)
                .foregroundColor(.red)
                .padding(.top, 16.0)
            Text(error.localizedDescription)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 16.0)
                .padding(.top, 8.0)
            Spacer()
        }
        .padding(32)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onTapGesture {
            retryHandler()
        }
    }
}
