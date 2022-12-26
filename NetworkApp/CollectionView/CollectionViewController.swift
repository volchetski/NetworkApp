//
//  ViewController.swift
//  NetworkApp
//
//  Created by Евгений Волчецкий on 26.12.22.
//

import UIKit

class CollectionViewController: UIViewController {
    
    // MARK: - Properties
    let array = ["Tap to download image", "GET", "POST", "Our courses"]
    let urlString = "https://applelives.com/wp-content/uploads/2016/03/iPhone-SE-11.jpeg"
    let requestUrl = "https://jsonplaceholder.typicode.com/posts"
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
            itemsCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            itemsCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
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
                      self.destination.indicator.stopAnimating()
                  }
              }
          }.resume()
      }
    
    public func getRequest() {
        guard let url = URL(string: requestUrl) else { return }
        let session = URLSession.shared
        session.dataTask(with: url) { data, response, error in
            guard
                let response = response, let data = data
            else { return }
            print(response)
            print(data)
            
            do {
                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    public func postRequest() {
        guard let url = URL(string: requestUrl) else { return }
        let userData = ["Course": "Networking", "Lesson": "GET and POST Request"]
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: userData, options: []) else { return }
        request.httpBody = httpBody
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        session.dataTask(with: request) { data, response, error in
            guard let responsee = response, let data = data else { return }
            print(response)
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

