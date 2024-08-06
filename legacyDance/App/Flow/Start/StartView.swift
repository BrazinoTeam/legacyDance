//
//  StartView.swift



import Foundation
import UIKit
import SnapKit

class StartView: UIView {
    
    
    private (set) var bgImage: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    private (set) var loadView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.layer.cornerRadius = 5
        return view
    }()

    private(set) lazy var progressView: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .default)
        progressView.progress = 0.0
        progressView.progressTintColor = .orange
        progressView.layer.cornerRadius = 5
        progressView.clipsToBounds = true
        return progressView
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {

        [bgImage, loadView] .forEach(addSubview(_:))
        loadView.addSubview(progressView)

    }
    
    private func setupConstraints() {
        bgImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        loadView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(11)
            make.width.equalTo(250)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-150)
        }
        
        progressView.snp.makeConstraints { make in
            make.left.equalTo(loadView.snp.left)   // Закрепите левую границу к левой границе loadView
            make.right.equalTo(loadView.snp.right) // Закрепите правую границу к правой границе loadView
            make.centerY.equalTo(loadView.snp.centerY) // Выровнять по центру loadView по вертикали
            make.height.equalTo(loadView.snp.height)   
        }
    }

}

