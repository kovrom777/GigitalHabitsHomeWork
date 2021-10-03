//
//  DHMainViewController.m
//  HW5
//
//  Created by Роман Ковайкин on 03.10.2021.
//

#import "DHMainViewController.h"
#import "../SecondVC/DHAboutDayViewController.h"

@interface DHMainViewController () <UITableViewDelegate, UITableViewDataSource>


@end

@implementation DHMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Tasks";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.cellId = @"CellId";
    [self configureTableView];
    self.content = @[@"Monday", @"Tuesday", @"Wednesday", @"Thursday", @"Friday", @"Saturday", @"Sunday"];
    
}

-(void) configureTableView{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier: self.cellId];
    [self.view addSubview:self.tableView];
}


- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.content.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:self.cellId forIndexPath:indexPath];
    
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.cellId];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = [self.content objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"Title of cell %@", [self.content objectAtIndex:indexPath.row]);
    [self.navigationController pushViewController: [[DHAboutDayViewController alloc]initWithDay:[self.content objectAtIndex:indexPath.row]]  animated:YES];
}

@end
