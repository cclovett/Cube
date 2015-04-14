//
//  ViewController.m
//  CCube
//
//  Created by Cc on 15/4/14.
//  Copyright (c) 2015年 PinguoSDK. All rights reserved.
//

#import "CCMainViewController.h"
#import "CCMainTableView.h"
#import "CCMainEntity.h"

@interface CCMainViewController ()

@property (nonatomic,weak) IBOutlet CCMainTableView *mTableView;

@end

@implementation CCMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    NSArray *arr = @[];
    
    [self.mTableView pLoadEntities:arr];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
