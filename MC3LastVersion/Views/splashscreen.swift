import SwiftUI
import UIKit

struct ContentView: View {
    @State private var isActive = false
    
    var localizedGifName: String = "alaween"
    
    var body: some View {
        VStack {
            if isActive {
                OnBordingView()
           } else {
                GifBackground(gifName: localizedGifName) {
                    isActive = true
                }
                .frame(width: 350, height: 350)
            }
        }
        //.navigationBarHidden(true)
    }
}

struct GifBackground: UIViewRepresentable {
    var gifName: String
    var completion: () -> Void
    
    func makeUIView(context: Context) -> UIView {
        let gifView = GifView()
        gifView.gifName = gifName
        gifView.completion = completion
        return gifView
    }
    
    func updateUIView(_ uiView: UIView, context: Context) { }
}

class GifView: UIView {
    var gifName: String? {
        didSet {
            guard let gifName = gifName else { return }
            if let gifURL = Bundle.main.url(forResource: gifName, withExtension: "gif") {
                let imageData = try! Data(contentsOf: gifURL)
                let gifImage = UIImage.gifImageWithData(imageData)
                let imageView = UIImageView(image: gifImage)
                imageView.frame = bounds
                imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                addSubview(imageView)
                
                // Start a timer to transition to the Intro phase after the GIF finishes playing
                Timer.scheduledTimer(withTimeInterval: gifImage!.duration, repeats: false) { _ in
                    self.completion()
                }
            }
        }
    }
    
    var completion: () -> Void = { }
}

extension UIImage {
    static func gifImageWithData(_ data: Data) -> UIImage? {
        guard let source = CGImageSourceCreateWithData(data as CFData, nil) else {
            print("Failed to create image source for GIF")
            return nil
        }
        
        let frameCount = CGImageSourceGetCount(source)
        var images = [UIImage]()
        
        for i in 0..<frameCount {
            guard let cgImage = CGImageSourceCreateImageAtIndex(source, i, nil) else {
                print("Failed to create image for GIF frame at index \(i)")
                continue
            }
            
            let image = UIImage(cgImage: cgImage)
            images.append(image)
        }
        
        return UIImage.animatedImage(with: images, duration: 2.6)
    }
}

struct Splash_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
