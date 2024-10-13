import SwiftUI

struct WizardInfoView: View {
    var wizardDetails: Wizard?
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.yellow)
                .frame(width: .infinity, height: 50)
                .overlay(
                    HStack {
                        Text(wizardDetails?.name ?? "")
                            .font(.system(size: 20))
                            .foregroundStyle(.white)
                        if let hogwartsStaff = wizardDetails?.hogwartsStaff {
                            Image(systemName: hogwartsStaff ? "graduationcap" : "")
                                .foregroundStyle(.white)
                        }
                    }
                    
                )
                .padding(.horizontal, 10)
                        
            AsyncImageView(wizardImg: wizardDetails?.image ?? "")
                .frame(width: 250, height: 300)
            
            VStack(alignment: .center, spacing: 0) {
                if let wizardSpecies = wizardDetails?.species {
                    HStack(spacing: 0) {
                        TableCell(text: "Species", color: .white)
                        TableCell(text: "\(wizardSpecies)", color: .white)
                    }
                }
                if let wizardGender = wizardDetails?.gender {
                    HStack(spacing: 0) {
                        TableCell(text: "Gender", color: .white)
                        TableCell(text: "\(wizardGender)", color: .white)
                    }
                }
                if let wizardHouse = wizardDetails?.house {
                    HStack(spacing: 0) {
                        TableCell(text: "House", color: .white)
                        TableCell(text: "\(wizardHouse)", color: .red)
                    }
                }
                if let wizardDOB = wizardDetails?.dateOfBirth {
                    HStack(spacing: 0) {
                        TableCell(text: "Date of Birth", color: .white)
                        TableCell(text: "\(wizardDOB)", color: .white)
                    }
                    Divider().frame(height: 1)
                }
            }
            .padding(.bottom, 10)
        }
        .overlay(
            Rectangle()
                .stroke(.yellow, lineWidth: 3)
                .padding(.horizontal, 10)
        )
        .padding(.top, 15)
    }
}

struct TableCell: View {
    var text: String
    var color: Color
    var textColor: Color = .black
    
    var body: some View {
        Text(text)
            .frame(width: 180, height: 50)
            .background(color)
            .foregroundStyle(textColor)
            .border(Color.black, width: 1)
            .font(.system(size: 18, weight: .semibold))
    }
}

#Preview {
    WizardInfoView()
}
