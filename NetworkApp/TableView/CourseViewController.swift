//
//  TableViewController.swift
//  NetworkApp
//
//  Created by Евгений Волчецкий on 26.12.22.
//

import UIKit

class CourseViewController: UIViewController {
    
//    private let jsonUrlString = "https://swiftbook.ru//wp-content/uploads/api/api_course"
    private let jsonUrlString = "https://swiftbook.ru//wp-content/uploads/api/api_courses"
//    private let jsonUrlString = "https://swiftbook.ru//wp-content/uploads/api/api_missing_or_wrong_fields"
    
    public var courses = [Course]()
    public var courseName: String?
    public var courseURL: String?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        addSubviews()
        addConstraints()
        fetchData()
    }
    
    private func addSubviews() {
        view.addSubview(tableView)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setUI() {
        view.backgroundColor = .white
    }
    
    private func fetchData() {
        guard let url = URL(string: jsonUrlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                self.courses = try decoder.decode([Course].self, from: data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let error {
                print("Error serialization json", error)
            }
        }.resume()
    }
    
    public func configureCell(cell: CustomCell, for indexPath: IndexPath) {
        let course = courses[indexPath.row]
        cell.nameLabel.text = course.name
        
        if let description = course.numberOfLessons {
            cell.descriptionLabel.text = "Number of lessons: \(description)"
        }
        if let numberOfTest = course.numberOfTests {
            cell.anotherLabel.text = "Number of tests: \(numberOfTest)"
        }
        DispatchQueue.global().async {
            guard let imageUrl = URL(string: course.imageUrl ?? "networking") else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            
            DispatchQueue.main.async {
                cell.itemImage.image = UIImage(data: imageData)
            }
        }
    }
}
