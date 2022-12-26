//
//  Extentions .swift
//  NetworkApp
//
//  Created by Евгений Волчецкий on 26.12.22.
//

import Foundation
import UIKit

// MARK: - CollectionView
extension CollectionViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.width/2.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else { return UICollectionViewCell() }
        cell.nameLabel.text = itemArray[indexPath.row].rawValue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let action = itemArray[indexPath.row]
        
        switch action{
        case .downloadImage:
            navigationController?.pushViewController(destination, animated: true)
            getImage()
        case .get: getRequest()
        case .post: postRequest()
        case .ourCourses:
            let destinationTable = CourseViewController()
            navigationController?.pushViewController(destinationTable, animated: true)
        case .uploadImage: print("Upload Image")
        }
    }
}

//MARK: - TableView
extension CourseViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomCell else { return UITableViewCell() }
        configureCell(cell: cell, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let course = courses[indexPath.row]
        
        courseURL = course.link
        courseName = course.name
        
        let destination = DescriptionController()
        destination.selectedCourse = courseName
        destination.courseURL = courseURL!

        navigationController?.pushViewController(destination, animated: true)
        
    }
}
