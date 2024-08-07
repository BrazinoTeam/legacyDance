//
//  IncorrectAnswerVC.swift


import Foundation
import UIKit
import SnapKit

class IncorrectAnswerVC: UIViewController {
    
    var contentView: IncorrectAnswerView {
        view as? IncorrectAnswerView ?? IncorrectAnswerView()
    }
    
    override func loadView() {
        view = IncorrectAnswerView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        selectBtn()
    }
    
    
    private func selectBtn() {
        contentView.btnGo.addTarget(self, action: #selector(tryAgain), for: .touchUpInside)
        contentView.btnBack.addTarget(self, action: #selector(backNavigate), for: .touchUpInside)
    }
    
    @objc func tryAgain() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func backNavigate() {
        navigationController?.popToRootViewController(animated: true)
    }
  

}
