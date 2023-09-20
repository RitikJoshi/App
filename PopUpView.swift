import SwiftUI

struct PopUpView: View {
    @Binding var isPresented: Bool // Binding to control the presentation of the popup
    @State private var isPresentingSecondPopUp = false // State to control the presentation of the second popup
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black.opacity(0.5)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                VStack(spacing: 20) {
                    Text("PROFILES") // Header for the popup
                        .font(.title)
                        .foregroundColor(.black)
                        .padding().bold(true)
                    
                    HStack(spacing: 20) {
                        PlayerProfileView(imageName: "profilepicture1", name: "Mel_lo", level: 15)
                        PlayerProfileView(imageName: "profilepicture2", name: "YelloFlash", level: 8)
                    }
                    
                    Button(action: {
                        isPresentingSecondPopUp = true // Trigger the presentation of the second popup
                    }) {
                        Text("Next")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.horizontal, 40) 
                            .padding(.vertical, 10)
                            .background(Color.blue)
                            .cornerRadius(20)
                    }
                    .padding(.bottom, 20)
                }
                .frame(maxWidth: .infinity)
                .background(BlurView(style: .systemUltraThinMaterial))
                .cornerRadius(20)
                .padding()
            }
        }
        .background(.black).ignoresSafeArea() 
        .sheet(isPresented: $isPresentingSecondPopUp) {
            SecondPopUpView(isPresented: $isPresentingSecondPopUp) // Present the second popup using sheet
        }
    }
}

struct PlayerProfileView: View {
    var imageName: String
    var name: String
    var level: Int
    
    var body: some View {
        VStack {
            Image(imageName) // Display player profile picture
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
            
            Text(name) // Display player's name
                .font(.title3)
                .foregroundColor(.black)
            
            Text("Level \(level)") // Display player's level
                .font(.subheadline)
                .foregroundColor(.blue)
        }
    }
}

struct BlurView: UIViewRepresentable {
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        UIVisualEffectView(effect: UIBlurEffect(style: style)) // Create a UIView with a blur effect
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style) // Update the blur effect style
    }
}

struct PopUpView_Previews: PreviewProvider {
    static var previews: some View {
        PopUpView(isPresented: .constant(true))
    }
}
