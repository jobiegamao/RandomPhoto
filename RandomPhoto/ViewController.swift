//
//  ViewController.swift
//  RandomPhoto
//
//  Created by may on 1/9/23.
//

import UIKit

class ViewController: UIViewController {
	
	private let imageView: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFill
		imageView.backgroundColor = .white
		imageView.layer.cornerRadius = 8.0
		imageView.clipsToBounds = true
		return imageView
	}()
	
	private let randomBtn: UIButton = {
		let btn = UIButton()
		btn.backgroundColor = .white
		btn.setTitle("Random Photo Please", for: .normal)
		btn.setTitleColor(.black, for: .normal)
		btn.setTitleColor(.blue, for: .highlighted)
		
		return btn
	}()

	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemTeal
		view.addSubview(imageView)
		imageView.frame = CGRect(x:0, y: 0, width: 300, height: 300)
		imageView.center = view.center
		
		view.addSubview(randomBtn)
		randomBtn.addTarget(self, action: #selector(didTapRandomPhoto), for: .touchUpInside)
		
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		randomBtn.frame = CGRect(x: 20,
								 y: view.frame.size.height - view.safeAreaInsets.bottom - 150,
								 width: view.frame.size.width - 40,
								 height: 50)
		
	}
	
	@objc func didTapRandomPhoto(){
		getRandomPhoto()
		self.view.backgroundColor = .random
	}
	
	func getRandomPhoto() {
		let urlString = "https://source.unsplash.com/random/600x600"
		let url = URL(string: urlString)!

//		DispatchQueue.global().async {
//			let data = try? Data(contentsOf: url)
//			DispatchQueue.main.async {
//				self.imageView.image = UIImage(data: data!)
//			}
//		}
		
		guard let data = try? Data(contentsOf: url) else {return}
		
		imageView.image = UIImage(data: data)
		
	}


}

extension UIColor {
	static var random: UIColor {
		return UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
	}
}

