//
//  ViewController.swift
//  Assignment3
//
//  Created by Pruthvi Gandhi on 2021-11-13.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, AddingImageDelegateProtocol {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imagePicker: UIPickerView!
    var manager: ImageManager = ImageManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        DispatchQueue.global().async { [self] in
            if let data = try? Data(contentsOf: manager.getAllImages()[row].url) {
                if let image = UIImage(data: data) {
                    self.imageView.image = image
                }
            }
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return manager.getAllImages().count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return manager.getAllImages()[row].title
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let aVC = segue.destination as! addNewImageViewController
        aVC.delegate = self
    }
 
    
    func controllerDidFinishWithNewImage(ii: ImageInfo) {
        manager.addNewImage(ni: ii)
        imagePicker.reloadAllComponents()
    }
    
    func controllerDidCancel() {
        
    }
}

