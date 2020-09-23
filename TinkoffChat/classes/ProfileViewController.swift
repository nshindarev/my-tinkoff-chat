//
//  ProfileViewController.swift
//  TinkoffChat
//
//  Created by Shindarev Nikita on 18.09.2020.
//  Copyright © 2020 nshindarev. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
        
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var selfDescriptionLabel: UILabel!
    @IBOutlet weak var initialsLabel: UILabel!
    @IBOutlet weak var editBtn: UIButton!
    
    var imagePicker = UIImagePickerController()

    // MARK: - UIViewController lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        
        profileView.layer.cornerRadius =
            profileView.bounds.width/2;
        
        imageView.layer.cornerRadius = profileView.layer.cornerRadius

        initialsLabel.text = getInitials(fullName: fullNameLabel.text ?? "")
        
        DispatchQueue.main.async{
            self.selfDescriptionLabel.text = "Software developer \n Saint-Petersburg, Russia"
        }
        
        print(#function, editBtn.frame)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(#function, editBtn.frame)
    }
    
    func getInitials (fullName: String) -> String{
          var components = fullName.components(separatedBy: " ")
          if components.count > 0 {
            let firstName = components.removeFirst()
            let lastName = components.joined(separator: " ")
            debugPrint(firstName)
            debugPrint(lastName)
            return String (firstName.prefix(1) + lastName.prefix(1))
        }
        return ""
    }
       
    
    @IBAction func onEditClick(_ sender: Any) {
        
        let optionMenu = UIAlertController(title: nil, message: "Choose Option", preferredStyle: .actionSheet)
        
        let galeryPhotoAction = UIAlertAction(title: "Choose a photo", style: .default, handler: {(action: UIAlertAction!) in
            if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
                print("Photo selected")
                self.imagePicker.sourceType = .photoLibrary
                self.present(self.imagePicker, animated: true, completion: nil)
            }
        })
        
        let cameraPhotoAction = UIAlertAction(title: "Take a new photo", style: .default, handler: {(action: UIAlertAction!) in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                print("Camera selected")
                self.imagePicker.sourceType = .camera
                self.present(self.imagePicker, animated: true, completion: nil)
            }
        })
        
        let clearPhotoAction = UIAlertAction(title: "Clear profile photo", style: .default, handler: {(action: UIAlertAction!) in
//            self.imageView.isHidden = true
            self.initialsLabel.isHidden = false
            self.imageView.image = nil
                
        })
        
        let cancelAction =      UIAlertAction(title: "Cancel", style: .cancel)

        optionMenu.addAction(galeryPhotoAction)
        optionMenu.addAction(cameraPhotoAction)
        optionMenu.addAction(cancelAction)
        optionMenu.addAction(clearPhotoAction)


            
        self.present(optionMenu, animated: true, completion: nil)
    }
    
   // MARK: - UIImagePickerControllerDelegate Methods
   func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
       if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
        
        initialsLabel.isHidden = true
        
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.contentMode = .scaleToFill
        imageView.image = pickedImage
       }
       dismiss(animated: true, completion: nil)
   }
}
