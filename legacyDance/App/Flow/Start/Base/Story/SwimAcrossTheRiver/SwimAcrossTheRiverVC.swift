//
//  SwimAcrossTheRiverVC.swift


import Foundation
import UIKit
import SnapKit

class SwimAcrossTheRiverVC: UIViewController {
    
    var contentView: SwimAcrossTheRiverView {
        view as? SwimAcrossTheRiverView ?? SwimAcrossTheRiverView()
    }
    
    override func loadView() {
        view = SwimAcrossTheRiverView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        selectBtn()
    }
    
    
    private func selectBtn() {
        contentView.btnHome.addTarget(self, action: #selector(goHome), for: .touchUpInside)
        contentView.btnBack.addTarget(self, action: #selector(backNavigate), for: .touchUpInside)
    }
    
    @objc func goHome() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func backNavigate() {
        navigationController?.popToRootViewController(animated: true)
    }
  

}
