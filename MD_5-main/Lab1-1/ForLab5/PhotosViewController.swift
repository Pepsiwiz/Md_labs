//
//  PhotosViewController.swift
//  Lab1-1
//
//  Created by Andrew Kurovskiy on 30.04.2021.
//

import UIKit

class PhotosViewController: UIViewController {
    @IBOutlet var collectionView: UICollectionView!
    
    var arrayOfPictures:[UIImage] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()

        if let layout = collectionView?.collectionViewLayout as? MyCollectionViewLayout {
            layout.delegate = self
        }
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "MyCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MyCollectionViewCell")
        
    }
   
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
}

extension PhotosViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfPictures.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as! MyCollectionViewCell
        cell.configure(image: arrayOfPictures[indexPath.item])

        
        return cell
    }
    
    
}


extension PhotosViewController: MyCollectionViewLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView,heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
        if((indexPath.item + 1) % 6 == 1) {
            return collectionView.frame.width/5*3
        } else if (((indexPath.item + 1) % 6 == 2 ) || (indexPath.item + 1) % 6 == 3) {
            return collectionView.frame.width/5*2
        } else {
            return collectionView.frame.width/5
        }
    }
}

extension PhotosViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBAction func openPhotos() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let newImage = info[.originalImage] as? UIImage else { return }
        arrayOfPictures.append(newImage)
        collectionView.reloadData()
    }
        
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}




