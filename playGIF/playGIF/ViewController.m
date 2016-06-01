//
//  ViewController.m
//  playGIF
//
//  Created by 李根 on 16/6/1.
//  Copyright © 2016年 ligen. All rights reserved.
//

#import "ViewController.h"
#import "LGGifView.h"

@interface ViewController ()

@end

@implementation ViewController
{
    LGGifView *_showGifView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSString *dataPath = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"0"] ofType:@"gif"];
    NSData *data = [[NSData alloc] initWithContentsOfFile:dataPath];
    
    
    _showGifView = [[LGGifView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:_showGifView];
    _showGifView.contentMode = UIViewContentModeScaleAspectFit;
    
    [_showGifView loadData:data];
    
}

//- (void)loadData:(NSData *)data {
//    [_showGifView loadData:data];
//}











- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
