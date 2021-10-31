//
//  TextViewController.swift
//  Happick_
//
//  Copyright © 2020 Claire. All rights reserved.
//

import UIKit
import YPImagePicker

class TextViewController: UIViewController, UITextViewDelegate {
    
    
    @IBOutlet weak var NowDate: UILabel!
    
    @IBOutlet weak var TextView: UITextView!
    
    @IBOutlet weak var ButtonView: UIView!
    
    @IBOutlet weak var CameraButton: UIButton!
    
    @IBOutlet weak var DoneButton: UIButton!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.TextView.delegate = self
        
        let date = Date()
        
        let formatter = DateFormatter()
        
        formatter.locale = .current
        
        formatter.dateFormat = "yyyy.MM.dd"
        
        NowDate.text = formatter.string(from: date)
        
        func textAlignmentSetting() {
            
            NowDate.textAlignment = .center
            
            TextView.delegate = self
            
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification , object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    
    //키보드가 표시 될 때 호출 되는 함수
    @objc func keyboardWillShow(_ notification:NSNotification) {
        print(notification)
        info(name: "Keyboard Will beShown", with: notification)
        
        moveButtonViewUp(with: notification)
    }
    
    //키보드가 사라질 때, 호출 되는 함수
    @objc func keyboardWillHide(_ notification:NSNotification) {
        info(name: "Keyboard Will beHidden", with: notification)
        
        moveButtonViewDown(with: notification)
    }

    //정보 표시
    fileprivate func info(name str:String, with notification:NSNotification) {
        if let userInfo = notification.userInfo {
            let frameBegin = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue ?? CGRect.zero
            let frameEnd = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue ?? CGRect.zero
            let curve = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber ?? NSNumber.init(value: 0)
            let duration = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber ).doubleValue
            
            let log = String("\(str) (\(Int(frameBegin.origin.x)),\(Int(frameBegin.origin.y)),\(Int(frameBegin.size.width)),\(Int(frameBegin.size.height))), (\(Int(frameEnd.origin.x)),\(Int(frameEnd.origin.y)),\(Int(frameEnd.size.width)),\(Int(frameEnd.size.height))) curve:\(curve), duration:\(duration)")

            
            //View에 추가한 UITextView에 표시
            self.TextView.text = self.TextView.text + "\n" + log
            self.TextView.scrollRangeToVisible(NSMakeRange(self.TextView.text.count - 1, 1))
        }
    }
    
    fileprivate func moveButtonViewUp(with notification:NSNotification) {
        self.moveButtonView(isUp: true, with: notification)
    }
    fileprivate func moveButtonViewDown(with notification:NSNotification) {
        self.moveButtonView(isUp: false, with: notification)
    }
    
    fileprivate func moveButtonView(isUp up:Bool, with notification:NSNotification) {
        if let userInfo = notification.userInfo {
            //let beginFrame = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
            let endFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
            let duration = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
            let animationOptions = UIView.AnimationOptions(rawValue: (userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as! NSNumber).uintValue)
            
            let frame = self.ButtonView.frame

            let keyboardY = self.view.frame.height - endFrame.size.height
            print("keyboardY : \(keyboardY), ButtonViewY : \(self.ButtonView.frame.origin.y)")
            //ButtonView의 frame.origin.y 값을 계산해 준다.
            // 표시할 때와, 사라질 때의 툴바의 Y위치를 계산
            let ButtonViewY = up ? keyboardY - frame.size.height : self.view.frame.height - frame.size.height
            let rect:CGRect = CGRect(x: frame.origin.x,
                                     y: ButtonViewY,
                                     width: frame.size.width,
                                     height: frame.size.height)
            UIView.animate(withDuration: duration,
                           delay: 0.0,
                           options: animationOptions,
                           animations: { [self] () -> Void in
                            self.ButtonView.frame = rect
                           }, completion: nil)
        }else{
            //UserInfo가 없을 경우..
        }
    }
   
    
    
        
   
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func CameraButton(_ sender: UIButton) {
        
        let picker = YPImagePicker()
        
        picker.didFinishPicking { [unowned picker] items, _ in
            
            if let photo = items.singlePhoto {
                
                print(photo.fromCamera) // Image source (camera or library)
                
                print(photo.image) // Final image selected by the user
                
                print(photo.originalImage) // original image selected by the user, unfiltered
                
                print(photo.modifiedImage) // Transformed image, can be nil
                
                print(photo.exifMeta) // Print exif meta data of original image.
                
            }
            
            
            picker.dismiss(animated: true, completion: nil)
            
        }
        
        self.present(picker, animated: true, completion: nil)
        
        
    }
    
    
    
    
 
    
    
    
    
}
