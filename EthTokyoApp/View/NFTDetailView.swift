//
//  NFTDetailView.swift
//  EthTokyoApp
//
//  Created by 住居尚弥 on 2023/04/15.
//

import SwiftUI
import SDWebImageSwiftUI


struct DetailNFT {
    var name: String
    var tokenId: String
    var imageUrl: URL
}

struct NFTDetailView: View {
    
    @ObservedObject var motionManager = MotionManager()
    @State var isHovering: Bool = false
    @State var rotation: CGSize = .zero
    
    private let imageWidth = UIScreen.main.bounds.width * 0.8
    private let maxDegrees: Double = 30
    private let rotationScale: Double = 0.5
    
    var detailNFT: DetailNFT
    
    init(detailNFT: DetailNFT) {
        self.detailNFT = detailNFT
    }
    
    var body: some View {
        ZStack {
            
            VStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.primary.opacity(0.25))
                    .frame(width: 30, height: 4)
                    .padding(.top, 66)
                
                VStack(alignment: .leading, spacing: 6) {
                    Text(detailNFT.name)
                        .font(.title.bold())
                        .foregroundColor(.black.opacity(0.4))
                    
                    Text("#\(detailNFT.tokenId)")
                        .font(.title3.bold())
                        .foregroundColor(.black.opacity(0.4))
                        .lineLimit(1)
                        .truncationMode(.tail)
                        .frame(width: 120, alignment: .leading)
                    
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
            }
            .ignoresSafeArea()
            
            
            WebImage(url: detailNFT.imageUrl)
                .resizable()
                .indicator(.activity)
                .shadow(color: .black.opacity(0.1), radius: 32)
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: imageWidth)
                .rotation3DEffect(
                    calcAngle(),
                    axis: calcAxis()
                )
                .rotation3DEffect(
                    Angle(degrees: isHovering ? rotation.height : 0),
                    axis: (x: 0, y: 1, z: 0)
                )
                .animation(.easeInOut, value: rotation.width)
                .animation(.easeInOut, value: motionManager.x)
                .gesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged { value in
                            let width = min(max(value.location.x, 0), imageWidth) / imageWidth
                            let height = min(max(value.location.y, 0), imageWidth) / imageWidth
                            
                            let xRotation = 1 - 2 * height
                            let yRotation = 2 * width - 1
                            
                            isHovering = true
                            rotation = CGSize(width: -xRotation * 10, height: -yRotation * 10)
                            
                            motionManager.stopUpdates()
                        }
                        .onEnded { _ in
                            withAnimation(.easeOut) {
                                rotation = .zero
                                isHovering = false
                            }
                            
                            motionManager.startUpdates()
                        }
                )
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear(perform: motionManager.startUpdates)
        .onDisappear(perform: motionManager.stopUpdates)
        
    }
    
    
    func calcAngle() -> Angle {
        if isHovering {
            return Angle(degrees: rotation.width)
        } else {
            return max(min(Angle.radians(motionManager.magnitude * rotationScale), Angle.degrees(maxDegrees)), Angle.degrees(-maxDegrees))
        }
    }
    
    func calcAxis() -> (x: CGFloat, y: CGFloat, z: CGFloat) {
        if isHovering {
            return (x: 1, y: 0, z: 0)
        } else {
            return (x: CGFloat(motionManager.x), y: CGFloat(motionManager.y), z: 0)
        }
    }
}

struct NFTDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let detailNFT = DetailNFT(name: "NFT Title", tokenId: "123456", imageUrl: URL(string: "https://lh3.googleusercontent.com/SAQBMSXRq6m37KqY6DSf7DcKf5TjrPw9ZHKvM0N8IO7FmYnR13LJWDka9ix3sT6i_w7QRibPkNQSNL60kCKkaYCyZiRS0srJAJmz")!)
        NFTDetailView(detailNFT: detailNFT)
    }
}
