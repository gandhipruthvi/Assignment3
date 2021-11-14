//
//  addNewImageViewController.swift
//  Assignment3
//
//  Created by Pruthvi Gandhi on 2021-11-13.
//

import UIKit

protocol AddingImageDelegateProtocol {
    func controllerDidFinishWithNewImage(ii: ImageInfo)// did , will ,
    func controllerDidCancel()
}

class addNewImageViewController: UIViewController {
    public var delegate: AddingImageDelegateProtocol?
      

    @IBOutlet weak var image_title: UITextField!
    @IBOutlet weak var image_url: UITextField!
    override func viewDidLoad() {
          super.viewDidLoad()

          // Do any additional setup after loading the view.
      }
      
    @IBAction func save_clicked(_ sender: Any) {
        if let title = image_title.text {
            if let url = image_url.text {
                if !title.isEmpty && !url.isEmpty{
                    if let newUrl = URL(string: url) {
                        let newImage = ImageInfo(n: title, u: newUrl)
                        print (newImage.title)
                        delegate?.controllerDidFinishWithNewImage(ii: newImage)
                        dismiss(animated: true, completion: nil)
                    }
                }
            }
        }
    }
    
    @IBAction func cancel_clicked(_ sender: Any) {
        delegate?.controllerDidCancel()
        dismiss(animated: true, completion: nil)
    }
}
