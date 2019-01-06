//
//  ViewController.swift
//  PhotoLibrary
//
//  Created by 李昱昊 on 2018/12/28.
//  Copyright © 2018 LYH. All rights reserved.
//


import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate,
UINavigationControllerDelegate {
    
    @IBOutlet weak var EditSwitch: UISwitch!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //选取相册
    @IBAction func openphoto(_ sender: Any) {

        //判断设置是否支持图片库
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            //初始化图片控制器
            let picker = UIImagePickerController()
            //设置代理
            picker.delegate = self
            //指定图片控制器类型
            picker.sourceType = UIImagePickerController.SourceType.photoLibrary
            //设置是否允许编辑
            picker.allowsEditing = EditSwitch.isOn
            //弹出控制器，显示界面
            self.present(picker, animated: true, completion: {
                () -> Void in
            })
        }else{
            print("读取相册错误")
        }
        
    }
    //选择图片成功后代理
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //查看info对象
        print(info)
        //显示的图片
        let image:UIImage!
        if EditSwitch.isOn {
            //获取编辑后的图片
            image = info[.editedImage] as? UIImage
        }else{
            //获取选择的原图
            image = info[.originalImage] as? UIImage
        }
        
        imageView.image = image
        //图片控制器退出
        picker.dismiss(animated: true, completion: {
            () -> Void in
        })
    }
}
