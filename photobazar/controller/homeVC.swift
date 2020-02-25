//
//  ViewController.swift
//  photobazar
//
//  Created by eitysams on 2/9/20.
//  Copyright © 2020 eitysams. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class homeVC: UIViewController {
    //outlets
    

    @IBOutlet weak var loginOutBtn: UIBarButtonItem!
    @IBOutlet weak var collectionview: UICollectionView!
    
    @IBOutlet weak var activityindicator: UIActivityIndicatorView!
    
    //variables
    var categories =  [catrgory]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      let category = catrgory.init(name: "Nature", id: "Iksjdhf", imUrl: "https://images.unsplash.com/photo-1582587572201-5951a993c8cc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60 ",
        isActive: true, timeStamp: Timestamp())
        
        //init(name: "Nature" , id: "Iksjhf" , imUrl: , isActive: true, timeStamp: Timestamp())
            
        collectionview.delegate =  self
        collectionview.dataSource = self
        collectionview.register(UINib(nibName: Identifiers.CategoryCell, bundle: nil), forCellWithReuseIdentifier: Identifiers.CategoryCell)
        if Auth.auth().currentUser == nil {
            Auth.auth().signInAnonymously { ( result, error) in
                if let error = error {
                    Auth.auth().handleFireAuthError(error: error, vc: self)
                    debugPrint(error)
                }
            }
        }

        // Do any additional setup after loading the view.
    }
    
 
    override func viewDidAppear(_ animated: Bool) {
        if let user = Auth.auth().currentUser  , !user.isAnonymous{
            // we are loged in
         loginOutBtn.title = "Logout"
            
        }else{
            loginOutBtn.title = "Login"
        }
    
    }
    fileprivate func presentLoginController() {
        let storyboard = UIStoryboard(name:Storyboard.LoginStoryboard, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: StoryboardId.LoginVC)
        present(controller, animated: true, completion: nil)
    }
    

    @IBAction func loginOutClicked(_ sender: Any) {
        guard let user = Auth.auth().currentUser else { return}
        if user.isAnonymous {
            presentLoginController()
        } else {
            do {
                try Auth.auth().signOut()
                Auth.auth().signInAnonymously { (result, error) in
                    if let error = error {
                        self.handleFireAuthError(error: error)
                        debugPrint(error)
                    }
                        self.presentLoginController()
                    
                }
            } catch {
                self.handleFireAuthError(error: error)
                debugPrint(error)
                
             }
           }
        }
    }

extension homeVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifiers.CategoryCell,for: indexPath ) as? CategoryCell {
            cell.configurcell(category: categories[indexPath.item])
return cell
            
        }
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width
        let cellWidth = (width - 50) / 2
let cellheight = cellWidth * 1.5
        
        return CGSize(width: cellWidth, height:cellheight)
        
    }
    }

