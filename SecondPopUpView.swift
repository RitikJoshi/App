import SwiftUI

struct SecondPopUpView: View {
    @Binding var isPresented: Bool // Binding to control the presentation of the popup
    @State private var selectedAmt: String? // State to store the selected profile
    @State private var showThirdPopUp = false
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black.opacity(0.5)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                VStack(spacing: 20) {
                    Text("SELECT PROFILE") // Header
                        .font(.title)
                        .foregroundColor(.black)
                        .padding().bold(true)
                    
                    HStack(spacing: 20) {
                        AmtSelectionView(amtName: "5")
                            .onTapGesture {
                                selectedAmt = "5"
                            }
                        AmtSelectionView(amtName: "10")
                            .onTapGesture {
                                selectedAmt = "10"
                            }
                        AmtSelectionView(amtName: "15")
                            .onTapGesture {
                                selectedAmt = "15"
                            }
                    }
                    
                    if let selectedAmt = selectedAmt {
                        Text("$\(selectedAmt)")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding(.top,-10)
                    }
                    HStack {
                                        Text("Wallet:") // Header
                                            .font(.title2)
                                            .foregroundColor(.black)
                                            .padding(.leading,50)
                                        
                                        // Small box with text
                                        RoundedRectangle(cornerRadius: 10)
                                            .frame(width: 150, height: 35)
                                            .foregroundColor(.blue)
                                            .padding(.leading,20)
                                            .overlay(
                                                Text("$70.00")
                                                    .font(.headline)
                                                    .foregroundColor(.white)
                                                    .padding(.leading,-50)
                                            )
                                        
                                        Spacer() // Push "Wallet" header and box to the right
                                    }
                        
                        
                    
                    Button(action: {
                        showThirdPopUp=true; // Trigger the presentation of the second popup
                    }) {
                        Text("Pay")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding(.horizontal, 90)
                            .padding(.vertical, 10)
                            .background(Color.green)
                            .cornerRadius(20)
                    }
                    .padding(.bottom, 20)
                }
                .sheet(isPresented: $showThirdPopUp) {
                            ThirdPopUpView(isPresented: $showThirdPopUp) // Present the second popup using sheet
                        }
                .frame(maxWidth: .infinity)
                .background(BlurView(style: .systemUltraThinMaterial))
                .cornerRadius(20)
                .padding()
            }
            .background(.black)
            .ignoresSafeArea()
            
        }
    }
}

struct AmtSelectionView: View {
    let amtName: String
    
    var body: some View {
        VStack {
            Circle()
                .frame(width: 60, height: 60)
                .foregroundColor(.green) // Filled circle background
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
                        Text(amtName) // Change the number to your desired text
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                ) 
        }
    }
}

struct SecondPopUpView_Previews: PreviewProvider {
    static var previews: some View {
        PopUpView(isPresented: .constant(true))
    }
}
