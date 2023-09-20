import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Title of the app
                Text("MOBA Games")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.top, 20)
                
                // Loop through game indices to display individual game cards
                ForEach(1..<6) { index in
                    // Display each game card using CardView
                    CardView(logoImageName: "logo\(index)")
                        .frame(maxWidth: .infinity)
                        .shadow(color: Color.white.opacity(0.8), radius: 10) // Add white shadow effect to each card
                }
            }
            .padding() // Add padding to the content inside ScrollView
        }
        .background(Color.black.ignoresSafeArea()) // Set background color of the entire view
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // Generate a preview of the ContentView
        ContentView()
    }
}
