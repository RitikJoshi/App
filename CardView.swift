import SwiftUI

struct CardView: View {
    var logoImageName: String // Name of the logo image for the game
    
    @State private var showAbout = false // State to control the About view presentation
    
    var body: some View {
        VStack {
            HStack {
                // Display the logo image of the game
                Image(logoImageName)
                    .resizable()
                    .frame(width: 65, height: 65)
                    .padding(.leading, 25)
                    .padding(.top, 25)
                Spacer() // Create space between logo and other content
            }
            
            Spacer() // Push the button and content to the bottom
            
            // Button to trigger About view presentation
            Button(action: {
                self.showAbout = true // Show the About view
            }) {
                Text("Play Now!")
                    .font(.title2)
                    .fontDesign(.serif)
                    .foregroundColor(.black)
                    .padding(.vertical, 10)
                    .frame(width: 250, height: 60)
                    .background(Color.blue)
                    .cornerRadius(30)
            }
            .padding(.bottom, 20)
            .fullScreenCover(isPresented: $showAbout, content: {
                AboutView() // Present the About view using fullScreenCover
            })
        }
        .frame(width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.height * 0.7) // Set the size of the card
        .background(Color.gray)
        .cornerRadius(10) 
        .shadow(radius: 5) // Add shadow effect to the card
        .padding() // Add padding to the card
    }
}
