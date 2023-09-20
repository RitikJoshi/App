import SwiftUI
struct ThirdPopUpView: View {
    @Binding var isPresented: Bool // Binding to control the presentation of the popup
    @State private var selectedProfile: String? // State to store the selected profile
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black.opacity(0.5) // Semi-transparent black background
                .ignoresSafeArea()

            VStack {
                Spacer()

                VStack(spacing: 20) {
                    Text("Ready To Play?") // Header
                        .font(.title2)
                        .foregroundColor(.black)
                        .padding(.top,50)
                    
                    Text("Mel_lo") 
                        .font(.title)
                        .foregroundColor(.black)
                        .padding(.top,-10)
                        .padding(.bottom,20)
                        
                        .bold(true)
                    
                    HStack(spacing: 20) { 
                        ProfileSelectionView1(noName: "🎮")
                            .onTapGesture {
                                selectedProfile = "Play"  // Set the selected profile
                            }
                        ProfileSelectionView1(noName: "🗒️")
                            .onTapGesture {
                                selectedProfile = "Events"
                            }
                        ProfileSelectionView1(noName: "💀")
                            .onTapGesture {
                                selectedProfile = "Exit"
                            }
                    }
                    .padding(.bottom,70)
                    if let selectedProfile = selectedProfile { // If a profile is selected
                        Button(action: {  // Add a button to close the popup
                            isPresented = false // Close the popup
                        }) {
                            Text("\(selectedProfile)") // Change the button name to your desired text
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 10)
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                        .padding()
                    }
                        
                    
                }
                .frame(maxWidth: .infinity)
                .background(BlurView(style: .systemUltraThinMaterial))
                .cornerRadius(20)
                .padding()
            }
            .background(.black).ignoresSafeArea()
        }
    }
}
struct ProfileSelectionView1: View {
    let noName: String
    
    var body: some View {
        VStack {
            Circle()
                .frame(width: 60, height: 60)
                .foregroundColor(.blue) // Filled circle background
                .overlay(
                    Circle()
                        .stroke(Color.black, lineWidth: 2)
                        .opacity(0.5) // Add opacity to the stroke circle
                )
                .shadow(radius: 4)
                .overlay(
                    ZStack {
                        Circle()
                            .foregroundColor(.clear)
                            .frame(width: 30, height: 30)
                        Text(noName) // Change the circle text to your desired text
                            .font(.title)
                            .foregroundColor(.white)
                    }
                )

            
            
        }
    }
}
struct ThirdPopUpView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdPopUpView(isPresented: .constant(true))
    }
}
