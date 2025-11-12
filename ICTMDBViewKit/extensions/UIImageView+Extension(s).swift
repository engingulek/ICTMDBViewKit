//
//  UIImageView+Extension(s).swift
//  ICTMDBViewKit
//
//  Created by Engin Gülek on 11.11.2025.
//

import Kingfisher
import UIKit
//MARK: UIImageView + Extension
public extension UIImageView {
  
    // Display image with url using kingfisher
    /// - Parameters:
    ///   - urlString: image url
    ///   - size: image size
    func setImageWithKigfisher(with urlString: String?,size:Int = 100) {
        let lightGrayImage = UIImage(color: UIColor.lightGray, size: CGSize(width: size, height: size))
        guard let url = URL(string: urlString ?? "") else {
            self.image = UIImage(resource: .nonePoster)
            return
        }
       let resizingProcessor = ResizingImageProcessor(
        referenceSize: CGSize(width: size, height: size), mode: .aspectFill)
        self.kf.setImage(
            with: url,
            placeholder: lightGrayImage,
            options: [
                .processor(resizingProcessor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(0.3)),
                .cacheOriginalImage,
                .memoryCacheExpiration(.seconds(1)),
                .diskCacheExpiration(.days(7))
                
            ],
            progressBlock: nil,
            completionHandler: {  _ in
                
            }
        )
    }
}

extension UIImage {
    convenience init?(color: UIColor, size: CGSize) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
}
