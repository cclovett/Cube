//
//  tableView.m
//  
//
//  Created by Cc on 15/4/14.
//
//

#import "CCMainTableView.h"

@interface CCMainTableView () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSArray *mEntities;

@end

@implementation CCMainTableView

- (void)awakeFromNib
{
    self.delegate = self;
    self.dataSource = self;
}

- (void)pLoadEntities:(NSArray *)oArr
{
    _mEntities = [[NSArray alloc] initWithArray:oArr copyItems:YES];
    
    [self reloadData];
}

#pragma UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}


#pragma UITableViewDelegate

@end
