// Path: /ChopTrack/Core/Presentation/Components/EmotionalFace.swift

import SwiftUI

struct EmotionalFace: View {
    enum Mood {
        case happy, sad, neutral, worried, excited
        
        var color: Color {
            switch self {
            case .happy: return .ctPastelPink
            case .sad: return .ctPastelBlue
            case .neutral: return .ctPastelMint
            case .worried: return .ctPastelYellow
            case .excited: return .ctPrimary
            }
        }
        
        var eyeOffset: CGFloat {
            switch self {
            case .happy, .excited: return -0.1
            case .sad: return 0.15
            case .neutral: return 0
            case .worried: return -0.05
            }
        }
        
        var mouthPath: Path {
            Path { path in
                switch self {
                case .happy, .excited:
                    path.addArc(
                        center: CGPoint(x: 0.5, y: 0.65),
                        radius: 0.2,
                        startAngle: .degrees(20),
                        endAngle: .degrees(160),
                        clockwise: false
                    )
                case .sad:
                    path.addArc(
                        center: CGPoint(x: 0.5, y: 0.85),
                        radius: 0.2,
                        startAngle: .degrees(200),
                        endAngle: .degrees(340),
                        clockwise: false
                    )
                case .neutral:
                    path.move(to: CGPoint(x: 0.3, y: 0.7))
                    path.addLine(to: CGPoint(x: 0.7, y: 0.7))
                case .worried:
                    path.move(to: CGPoint(x: 0.3, y: 0.75))
                    path.addQuadCurve(
                        to: CGPoint(x: 0.7, y: 0.75),
                        control: CGPoint(x: 0.5, y: 0.65)
                    )
                }
            }
        }
    }
    
    let mood: Mood
    let size: CGFloat
    @State private var isAnimating = false
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            
            ZStack {
                // Background circle
                Circle()
                    .fill(mood.color.opacity(0.3))
                    .overlay(
                        Circle()
                            .stroke(mood.color, lineWidth: 3)
                    )
                
                // Face features
                Group {
                    // Eyes
                    HStack(spacing: width * 0.2) {
                        Circle()
                            .fill(Color.ctBackground)
                            .frame(width: width * 0.08, height: height * 0.08)
                            .offset(y: height * mood.eyeOffset)
                        
                        Circle()
                            .fill(Color.ctBackground)
                            .frame(width: width * 0.08, height: height * 0.08)
                            .offset(y: height * mood.eyeOffset)
                    }
                    .offset(y: -height * 0.1)
                    
                    // Mouth
                    mood.mouthPath
                        .stroke(Color.ctBackground, lineWidth: 3)
                        .scaleEffect(CGSize(width: width, height: height))
                }
                
                // Animated elements for some moods
                if mood == .excited {
                    ForEach(0..<3) { index in
                        Image(systemName: "star.fill")
                            .font(.system(size: width * 0.1))
                            .foregroundColor(.ctWarning)
                            .offset(
                                x: width * 0.3 * cos(Double(index) * 2 * .pi / 3),
                                y: height * 0.3 * sin(Double(index) * 2 * .pi / 3)
                            )
                            .rotationEffect(.degrees(isAnimating ? 360 : 0))
                            .animation(
                                .linear(duration: 3)
                                .repeatForever(autoreverses: false),
                                value: isAnimating
                            )
                    }
                }
            }
        }
        .frame(width: size, height: size)
        .onAppear {
            isAnimating = true
        }
    }
}
