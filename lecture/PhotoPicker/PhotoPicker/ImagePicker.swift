//
//  ImagePicker.swift
//  PhotoPicker
//
//  Created by 서보경 on 2021/06/11.
//

import Foundation
import SwiftUI
import PhotosUI

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var isPresent: Bool
    @Binding var images: [UIImage]
    
    func makeUIViewController(context: Context) -> some UIViewController {
        
        var config = PHPickerConfiguration()
        config.selectionLimit = 0 // 이미지 여러개 선택
        config.filter = .images
        
        let picker = PHPickerViewController(configuration: config)
        
        picker.delegate = context.coordinator
        
        return picker
    }
    
    func makeCoordinator() -> Coordinator {
        return ImagePicker.Coordinator(picker: self)
    }
    
    class Coordinator: PHPickerViewControllerDelegate {
        
        var picker: ImagePicker
        
        init(picker: ImagePicker) {
            self.picker = picker
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            
            self.picker.isPresent = false
            self.picker.images.removeAll()
            
            for img in results {
                if img.itemProvider.canLoadObject(ofClass: UIImage.self) {
                    
                    img.itemProvider.loadObject(ofClass: UIImage.self) { loadedImage, err in
                        // 로딩해온 이미지 추가
                        guard let hasImage = loadedImage else { return }
                        
                        self.picker.images.append(hasImage as! UIImage)
                    }
                    
                } else {
                    print("fail to loaded")
                }
            }
            
        }
    }
    
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}
