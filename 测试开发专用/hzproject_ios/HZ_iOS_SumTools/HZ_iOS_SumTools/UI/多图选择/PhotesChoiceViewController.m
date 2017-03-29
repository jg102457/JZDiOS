//
//  PhotesChoiceViewController.m
//  HZ_iOS_SumTools
//
//  Created by jason on 16/9/21.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "PhotesChoiceViewController.h"
#import "TZImagePickerController.h"
@interface PhotesChoiceViewController ()<TZImagePickerControllerDelegate>

@end

@implementation PhotesChoiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:9 delegate:self];
    
    // You can get the photos by block, the same as by delegate.
    // 你可以通过block或者代理，来得到用户选择的照片.
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray *photos, NSArray *assets) {
        
    }];
    [self presentViewController:imagePickerVc animated:YES completion:nil];
}
- (void)imagePickerControllerDidCancel:(TZImagePickerController *)picker{

}

/*
选择了图
 */
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets infos:(NSArray<NSDictionary *> *)infos{


}
/*
 选择video
 */
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingVideo:(UIImage *)coverImage sourceAssets:(id)asset{

}
@end
