//
//  PostViewController.swift
//  Telephoto
//
//  Created by Joel Annenberg on 3/18/16.
//  Copyright © 2016 Joel A. All rights reserved.
//

import UIKit

class PostViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var postTextField: UITextField!
    @IBOutlet weak var pickedImageView: UIImageView!
    @IBOutlet weak var postButton: UIButton!
    @IBOutlet weak var photoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postTextField.becomeFirstResponder()
        pickedImageView.layer.cornerRadius = 5
        postButton.layer.cornerRadius = 5
        photoView.layer.cornerRadius = 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject]) {
            // Get the image captured by the UIImagePickerController
            let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
            
            if editedImage.imageAsset != nil {
                pickedImageView.image = editedImage
            } else {
                pickedImageView.image = originalImage
            }
            
            // Dismiss UIImagePickerController to go back to your original view controller
            dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    @IBAction func onPost(sender: AnyObject) {
        Post.postUserImage(pickedImageView.image, withCaption: postTextField.text) { (success: Bool, error: NSError?) -> Void in
            self.postTextField.resignFirstResponder()
            self.postTextField.text = nil
            self.pickedImageView.image = nil
            self.tabBarController?.selectedIndex = 0
        }
    }

    @IBAction func onBackgroundTap(sender: AnyObject) {
        postTextField.resignFirstResponder()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
