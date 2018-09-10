//
//  ViewController.swift
//  Walker
//
//  Created by Ganna Melnyk on 9/7/18.
//  Copyright © 2018 Ganna Melnyk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    let key = "taps"
    var taps = 0
    
    override func viewWillAppear(_ animated: Bool) {
//        if  UserDefaults.standard.integer(forKey: "taps") != 0  {
            taps = UserDefaults.standard.integer(forKey: "taps")
//        }
        self.label.text = "  button was tapped \(taps) times  "
        setRandomColors()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.button.layer.cornerRadius = 10;
        
        if let url = URL(string: "https://img00.deviantart.net/b599/i/2016/140/9/9/appa_poro_by_99g3ny99-da2wpw1.jpg") {
            self.imageView.contentMode = .scaleToFill
            downloadImage(from: url)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func tappedButton(_ sender: UIButton) {
        taps += 1
        UIView.animate(withDuration: 1) {
            self.label.text = "  button was tapped \(self.taps) times  "
            self.setRandomColors()
            
        }
        UserDefaults.standard.set(taps, forKey: "taps")
    }
    
    func randomColor(with alpha: CGFloat) -> UIColor {
        return UIColor(displayP3Red: .random(), green: .random(), blue: .random(), alpha: alpha)
    }
    
    func setRandomColors() {
        self.button.backgroundColor = self.randomColor(with: 0.2)
        self.button.setTitleColor(self.randomColor(with: 1), for: .normal)
        self.label.textColor = self.randomColor(with: 1)
        self.label.backgroundColor = self.randomColor(with: 0.2)
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(from url: URL) {
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() {
                self.imageView.image = UIImage(data: data)
            }
        }
    }
    
    


}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

