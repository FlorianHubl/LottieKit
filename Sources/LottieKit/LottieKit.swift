
import SwiftUI
import Lottie

@available(iOS 13.0.0, macOS 10.15, *)
public struct LottieView: UIViewRepresentable {
    public typealias UIViewType = UIView
    
    public let file: String
    public let loop: Bool
    public let speed: Float
    
    public init(file: String, loop: Bool = false, speed: Float = 1) {
        self.file = file
        self.loop = loop
        self.speed = speed
    }
    
    public func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)
        let animationView = LottieAnimationView()
        
        let animation = LottieAnimation.named(file)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        
        if loop {
            animationView.loopMode = .loop
        }else {
            animationView.loopMode = .playOnce
        }
        
        animationView.animationSpeed = CGFloat(speed)
        animationView.play()
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
        ])
        
        return view
    }
    public func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
    }
}

