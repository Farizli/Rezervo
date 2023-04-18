//
//  OTPVC.swift
//  RezervoApp
//
//  Created by Ali  Farizli  on 08.03.23.
//

import UIKit
import Combine

class OTPVC: UIViewController {

    var countDownDuration = 60
    var type: LoginType?
    
    var cancelables = Set<AnyCancellable>()
    @IBOutlet weak var otpView: OTPView! {
        didSet{
            otpView.publisher(for: \.text, options: .new)
                .sink { [weak self] otp in
                    guard let self else {return}
                    let text = otp.compactMap {$0 != "" ? $0 : nil}
                    if text.count == 4{
//                        CHECK OTP HERE
                    }
                }
                .store(in: &cancelables)
        }
    }
    @IBOutlet weak var verifyBtn: CustomButton! {
        didSet {
            verifyBtn.type = .highImportance
            let gesture = UITapGestureRecognizer(target: self, action: #selector(didTap))
            verifyBtn.addGestureRecognizer(gesture)
        }
    }
    @IBOutlet weak var codeSentInfoLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var resendCodeLbl: UILabel! 
    @IBOutlet weak var backBtn: UIButton! {
        didSet {
            let gesture = UITapGestureRecognizer(target: self, action: #selector(didTap))
            backBtn.addGestureRecognizer(gesture)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        sendCodeAgain()

        // Do any additional setup after loading the view.
    }
    
    @objc private func didTap(_ sender: UITapGestureRecognizer){
        switch sender.view{
        case backBtn:
            self.dismiss(animated: true)
        case verifyBtn:
            let storyboard = UIStoryboard(name: "Login", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "EnterUserInfoVC") as! EnterUserInfoVC
            vc.type = type
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        default:
            break
        }
    }
    
    func sendCodeAgain() {
        var countDown = countDownDuration
        resendCodeLbl.isUserInteractionEnabled = false
        resendCodeLbl.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        resendCodeLbl.textColor = ColorUI.mainText
        let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] (Timer) in
            guard let self else {return}
            if countDown > 1 {
                countDown -= 1
                let fulltxt = NSMutableAttributedString()
                let normalFontAttributes = [NSAttributedString.Key.foregroundColor: ColorUI.mainText, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17.0)]
                let boldFontAttributes = [NSAttributedString.Key.foregroundColor: ColorUI.mainTheme, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17.0)]
                let firstTxt = NSMutableAttributedString(string: "Resend code in", attributes: normalFontAttributes)
                let boldTxt = NSMutableAttributedString(string: " \(Int(countDown))", attributes: boldFontAttributes)
                let thirdTxt = NSMutableAttributedString(string: " s", attributes: normalFontAttributes)

                fulltxt.append(firstTxt)
                fulltxt.append(boldTxt)
                fulltxt.append(thirdTxt)

                self.resendCodeLbl.attributedText = fulltxt
            } else {
                Timer.invalidate()
                self.resendCodeLbl.isUserInteractionEnabled = true
                self.resendCodeLbl.text = "Resend code"
                self.resendCodeLbl.textColor = ColorUI.mainText
                self.resendCodeLbl.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
            }
        }
        timer.fire()
    }
    


}
