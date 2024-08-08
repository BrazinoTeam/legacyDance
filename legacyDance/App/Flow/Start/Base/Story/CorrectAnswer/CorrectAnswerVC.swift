//
//  CorrectAnswerVC.swift


import Foundation
import UIKit
import SnapKit

class CorrectAnswerVC: UIViewController {
    
    var contentView: CorrectAnswerView {
        view as? CorrectAnswerView ?? CorrectAnswerView()
    }
    
    override func loadView() {
        view = CorrectAnswerView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        selectBtn()
    }
    
    
    private func selectBtn() {
        contentView.btnGo.addTarget(self, action: #selector(goNext), for: .touchUpInside)
    }
    
    @objc func goNext() {
        let vc = MeetingTheGuardianVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func backNavigate() {
        navigationController?.popToRootViewController(animated: true)
    }
  

}
