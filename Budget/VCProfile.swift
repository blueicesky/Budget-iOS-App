//
//  VCProfile.swift
//  Budget
//
//  Created by Frank Wang on 2016-02-11.
//  Copyright © 2016 Lemma Inc. All rights reserved.
//

import Foundation


import UIKit
import CoreGraphics

extension UIImage{
    
    
    public func imageRotatedByDegrees(_ degrees: CGFloat, flip: Bool) -> UIImage {
        let radiansToDegrees: (CGFloat) -> CGFloat = {
            return $0 * (180.0 / CGFloat(M_PI))
        }
        let degreesToRadians: (CGFloat) -> CGFloat = {
            return $0 / 180.0 * CGFloat(M_PI)
        }
        
        // calculate the size of the rotated view's containing box for our drawing space
        let rotatedViewBox = UIView(frame: CGRect(origin: CGPoint.zero, size: size))
        let t = CGAffineTransform(rotationAngle: degreesToRadians(degrees));
        rotatedViewBox.transform = t
        let rotatedSize = rotatedViewBox.frame.size
        
        // Create the bitmap context
        UIGraphicsBeginImageContext(rotatedSize)
        let bitmap = UIGraphicsGetCurrentContext()
        
        // Move the origin to the middle of the image so we will rotate and scale around the center.
        bitmap?.translateBy(x: rotatedSize.width / 2.0, y: rotatedSize.height / 2.0);
        
        //   // Rotate the image context
        bitmap?.rotate(by: degreesToRadians(degrees));
        
        // Now, draw the rotated/scaled image into the context
        var yFlip: CGFloat
        
        if(flip){
            yFlip = CGFloat(-1.0)
        } else {
            yFlip = CGFloat(1.0)
        }
        
        bitmap?.scaleBy(x: yFlip, y: -1.0)
        CGContextDrawImage(bitmap, CGRect(x: -size.width / 2, y: -size.height / 2, width: size.width, height: size.height), cgImage)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
}
var yesnomaybe = 0
class VCProfile: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet var profilePic: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    @IBAction func addImage(_ sender: AnyObject) {
        
        /*let imagePicker = UIImagePickerController()
        imagePicker.editing = false
        imagePicker.delegate = self*/
        /*imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(imagePicker, animated: true, completion: nil)*/
        
        let action = UIAlertController(title: "Change your profile picture", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        
        
        let libButton = UIAlertAction(title: "Photo Library", style: UIAlertActionStyle.default) { (libSelected) in
            self.imagePicker.sourceType = .photoLibrary;
            self.imagePicker.allowsEditing = true
            yesnomaybe = 0
            self.present(self.imagePicker, animated: true, completion: nil)
            
        }
        let cameraButton = UIAlertAction(title: "Take Picture", style: UIAlertActionStyle.default) { (camSelected) in
            
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera){
                
                self.imagePicker.sourceType = .camera
                self.imagePicker.allowsEditing = true
                yesnomaybe = 1
                self.present(self.imagePicker, animated: true, completion: nil)
            }
            
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default) { (cancelSelected) in
            
            
            
        }
        
        action.addAction(libButton)
        action.addAction(cameraButton)
        action.addAction(cancelButton)
        
        self.present(action, animated: true, completion: nil)
        
    }
    func cropToBounds(_ image: UIImage, width: Double, height: Double) -> UIImage {
        
        let contextImage: UIImage = UIImage(cgImage: image.cgImage!)
        
        
        let contextSize: CGSize = contextImage.size
        
        var posX: CGFloat = 0.0
        var posY: CGFloat = 0.0
        var cgwidth: CGFloat = CGFloat(width)
        var cgheight: CGFloat = CGFloat(height)
        
        // See what size is longer and create the center off of that
        if contextSize.width > contextSize.height {
            posX = ((contextSize.width - contextSize.height) / 2)
            posY = 0
            cgwidth = contextSize.height
            cgheight = contextSize.height
        } else {
            posX = 0
            posY = ((contextSize.height - contextSize.width) / 2)
            cgwidth = contextSize.width
            cgheight = contextSize.width
        }
        
        let rect: CGRect = CGRect(x: posX, y: posY, width: cgwidth, height: cgheight)
        
        // Create bitmap image from context using the rect
        let imageRef: CGImage = contextImage.cgImage!.cropping(to: rect)!
        
        // Create a new image based on the imageRef and rotate back to the original orientation
        //let image: UIImage = UIImage(CGImage: imageRef, scale: image.scale, orientation: image.imageOrientation)
        let im: UIImage = UIImage(cgImage: imageRef, scale: 1.0, orientation: image.imageOrientation)
        
        return im
    }
    
    func cropToBounds1(_ image: UIImage, width: Double, height: Double) -> UIImage {
        
        let contextImage: UIImage = UIImage(cgImage: image.cgImage!)
        
        
        let contextSize: CGSize = contextImage.size
        
        var posX: CGFloat = 0.0
        var posY: CGFloat = 0.0
        var cgwidth: CGFloat = CGFloat(width)
        var cgheight: CGFloat = CGFloat(height)
        
        // See what size is longer and create the center off of that
        if contextSize.width > contextSize.height {
            posX = ((contextSize.width - contextSize.height) / 2)
            posY = 0
            cgwidth = contextSize.height
            cgheight = contextSize.height
        } else {
            posX = 0
            posY = ((contextSize.height - contextSize.width) / 2)
            cgwidth = contextSize.width
            cgheight = contextSize.width
        }
        
        let rect: CGRect = CGRect(x: posX, y: posY, width: cgwidth, height: cgheight)
        
        // Create bitmap image from context using the rect
        let imageRef: CGImage = contextImage.cgImage!.cropping(to: rect)!
        
        // Create a new image based on the imageRef and rotate back to the original orientation
        //let image: UIImage = UIImage(CGImage: imageRef, scale: image.scale, orientation: image.imageOrientation)
        let im: UIImage = UIImage(cgImage: imageRef)
        //im = im.imageRotatedByDegrees(90, flip: false)
        
        return im
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        if yesnomaybe == 1{
            let prof = cropToBounds1(image, width: 100, height: 100)
            self.profilePic.image = prof
            UserDefaults.standard.set(UIImagePNGRepresentation(prof), forKey: "profImage")
            self.dismiss(animated: true, completion: nil)
        }else{
            let prof = cropToBounds(image, width: 100, height: 100)
            self.profilePic.image = prof
            UserDefaults.standard.set(UIImagePNGRepresentation(prof), forKey: "profImage")
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.profilePic.layer.cornerRadius = profilePic.frame.height / 2.0
    }
    
    
    @IBOutlet var titleLabe: UILabel!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        titleLabe.numberOfLines = 1
        titleLabe.adjustsFontSizeToFitWidth = true
        
        imagePicker.delegate = self
        
        let imageData = UserDefaults.standard.object(forKey: "profImage") as! Data
        let profImage = UIImage(data: imageData, scale: 1.0)
        
        //let modelName = UIDevice.currentDevice().modelName
        
        self.profilePic.image = profImage
        //self.profilePic.layer.cornerRadius = self.profilePic.frame.size.width / 3
        self.profilePic.clipsToBounds = true
        

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
}
