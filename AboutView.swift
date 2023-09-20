import SwiftUI

struct AboutView: View {
    // State properties to control the view's behavior
    @State private var isShowingFullDescription = false
    @State private var isDownloading = false
    @State private var showPlayButton = false
    @State private var isPresentingPopUp = false // State to control the Popup view presentation
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                // Display the logo image and game title
                Image("logo1")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .padding(.leading, 15)
                
                Text("League\nOf Legends")
                    .padding(.leading, 10)
                    .font(.title)
                    .foregroundColor(Color(hex: "0xFFFFFF"))
            }
            .padding(.top, 80)
            .padding(.bottom, 10)
            
            // Display game description with read more/less functionality
            Text("CHOOSE YOUR CHAMPION!\nWhether you like to dive straight into the fray, support your teammates, or something in between, there’s a spot for you on the Rift.")
                .font(.body)
                .padding(.leading, 15)
                .foregroundColor(.gray)
                .lineLimit(isShowingFullDescription ? nil : 2) // Limit to 2 lines if not showing full description
            
            // Button to toggle full description
            Button(action: {
                isShowingFullDescription.toggle() // Toggle the state to show/hide full description
            }) {
                Text(isShowingFullDescription ? "Read Less" : "Read More")
                    .font(.body) // Use the same font size as the description
                    .foregroundColor(Color.green)
                    .padding(.horizontal, 150)
                    .padding(.vertical,-5)
                    .background(Color.black)
            }
            .padding(.top, 10)
            
            // Display images using a horizontal stack
            HStack {
                Image("picture1") // Replace with your image name
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity, maxHeight: 315)
                
                Image("picture2") // Replace with your image name
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
            }
            .frame(maxHeight: UIScreen.main.bounds.height * 0.5)
            
            Spacer()
            
            // Button to trigger downloading and Popup view presentation
            Button(action: {
                isDownloading = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    isDownloading = false
                    DispatchQueue.main.asyncAfter(deadline: .now()) {
                        showPlayButton = true
                        isPresentingPopUp = true // Present the Popup view
                    }
                }
            }) {
                // Customize button appearance based on state
                if isDownloading {
                    Text("DOWNLOADING...")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 250, height: 50)
                        .background(Color(hex: "0x3498AA"))
                        .cornerRadius(30)
                } else if showPlayButton {
                    Text("PLAY NOW")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 250, height: 50)
                        .background(Color.green)
                        .cornerRadius(30)
                } else {
                    Text("DOWNLOAD\n30MB")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 250, height: 50)
                        .background(Color(hex: "0x3498DB"))
                        .cornerRadius(30)
                }
            }
            .frame(maxWidth: .infinity, alignment: .center) // Center the button horizontally
            .padding(.bottom, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hex: "0x000000").ignoresSafeArea()) // Set background color
        .sheet(isPresented: $isPresentingPopUp) {
            PopUpView(isPresented: $isPresentingPopUp) // Present the Popup view using sheet
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}

// Extension to create a Color from a hex string
extension Color {
    init(hex: String) {
        // Convert hex to RGB values
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        // Initialize the Color using RGB values
        self.init(
            .sRGB,
            red: Double((rgb & 0xFF0000) >> 16) / 255.0,
            green: Double((rgb & 0x00FF00) >> 8) / 255.0,
            blue: Double(rgb & 0x0000FF) / 255.0,
            opacity: 1.0
        )
    }
}
