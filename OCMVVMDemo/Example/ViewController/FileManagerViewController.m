//
//  FileManagerViewController.m
//  OCMVVMDemo
//
//  Created by liquan on 2017/11/23.
//  Copyright © 2017年 liquan. All rights reserved.
//

#import "FileManagerViewController.h"
#import "LQKFileManager.h"
@interface FileManagerViewController ()

@end

@implementation FileManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    LQKLog(@"rootDir %@",[[LQKFileManager sharedInstance] lqk_getRootDirectory]);
    LQKLog(@"document %@",[[LQKFileManager sharedInstance]lqk_getDocumentDirectory]);
    LQKLog(@"Lirbrary %@",[LQKFileManager sharedInstance].lqk_getLibraryDirectory);
    LQKLog(@"cache %@",[[LQKFileManager sharedInstance] lqk_getCacheDirectory]);
    LQKLog(@"tem %@",[[LQKFileManager sharedInstance]lqk_getTmpDirectory]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)createDir:(id)sender {
   BOOL su = [[LQKFileManager sharedInstance]lqk_createDirWithDirName:@"小白" andDirPath:[[LQKFileManager sharedInstance] lqk_getCacheDirectory]];
    LQKLog(@"%@",su?@"创建成功":@"创建失败");
}

- (IBAction)deleteDir:(id)sender {
    [[LQKFileManager sharedInstance]lqk_deleteDirWithDirPath:[NSString stringWithFormat:@"%@/%@",[[LQKFileManager sharedInstance] lqk_getCacheDirectory],@"小白"]];
}

- (IBAction)createFile:(id)sender {
    [[LQKFileManager sharedInstance]lqk_createFileWithFileName:@"大宝.txt" andFilePath:[[LQKFileManager sharedInstance] lqk_getCacheDirectory]];
}

- (IBAction)deleteFile:(id)sender {
    [[LQKFileManager sharedInstance]lqk_deleteFileWithFilePath:[NSString stringWithFormat:@"%@/%@",[[LQKFileManager sharedInstance] lqk_getCacheDirectory],@"大宝.txt"]];
}
- (IBAction)deleteAllInDir:(id)sender {
    [[LQKFileManager sharedInstance]lqk_deleteDirContainFileWithDirPath:[[LQKFileManager sharedInstance] lqk_getCacheDirectory]];
    
}

- (IBAction)deleteTypeInDir:(id)sender {
     [[LQKFileManager sharedInstance]lqk_deleteDirContainFileWithDirPath:[[LQKFileManager sharedInstance] lqk_getCacheDirectory] andFileType:@"txt"];
}
- (IBAction)writeDataToFile:(id)sender {
    [[LQKFileManager sharedInstance]lqk_writeDataWith:@"这是一个字符串" ToFilePath:[NSString stringWithFormat:@"%@/大宝.txt",[[LQKFileManager sharedInstance] lqk_getCacheDirectory]] ];
}
- (IBAction)readDataFromFile:(id)sender {
   NSString *str =  [[LQKFileManager sharedInstance]lqk_readDataFromFilePath:[NSString stringWithFormat:@"%@/大宝.txt",[[LQKFileManager sharedInstance] lqk_getCacheDirectory]] ];
    LQKLog(@"这是读到的字符串：%@",str);
}

@end
