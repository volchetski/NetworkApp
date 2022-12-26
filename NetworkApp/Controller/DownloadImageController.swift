//
//  DownloadImageController.swift
//  NetworkApp
//
//  Created by Евгений Волчецкий on 26.12.22.
//

import UIKit

class DownloadImageController: UIViewController {
    
    // MARK: - Properties
//    let urlString = "https://applelives.com/wp-content/uploads/2016/03/iPhone-SE-11.jpeg"
    public lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    public lazy var indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.isHidden = true
        indicator.startAnimating()
        indicator.hidesWhenStopped = true
        return indicator
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        addSubviews()
        addConstraints()
    }
    
    // MARK: - Methods
    private func addSubviews() {
        view.addSubview(imageView)
        view.addSubview(indicator)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            indicator.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            indicator.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    
//    public func getImage() {
//          guard let url = URL(string: urlString) else { return }
//          let session = URLSession.shared
//          session.dataTask(with: url) { data, response, error in
//              if let data = data, let image = UIImage(data: data) {
//                  DispatchQueue.main.async {
//                      self.imageView.image = image
//                  }
//              }
//          }.resume()
//      }
}
