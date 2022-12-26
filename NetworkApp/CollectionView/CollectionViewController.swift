//
//  ViewController.swift
//  NetworkApp
//
//  Created by Евгений Волчецкий on 26.12.22.
//

import UIKit

class CollectionViewController: UIViewController {
    
    // MARK: - Properties
    let array = ["Tap to download image", "GET", "PUT", "Unload"]
    let urlString = "https://applelives.com/wp-content/uploads/2016/03/iPhone-SE-11.jpeg"
let destination = DownloadImageController()
    private lazy var itemsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        addSubviews()
        addCounstraints()
    }
    
    //MARK: - Methods
    private func setupViews() {
        view.backgroundColor = .white
        title = "Networking"
    }
    
    private func addSubviews() {
        view.addSubview(itemsCollectionView)
    }
    
    private func addCounstraints() {
        NSLayoutConstraint.activate([
            itemsCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            itemsCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            itemsCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            itemsCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    public func getImage() {
          guard let url = URL(string: urlString) else { return }
          let session = URLSession.shared
          session.dataTask(with: url) { data, response, error in
              if let data = data, let image = UIImage(data: data) {
                  DispatchQueue.main.async {
                      self.destination.imageView.image = image
                  }
              }
          }.resume()
      }
}

