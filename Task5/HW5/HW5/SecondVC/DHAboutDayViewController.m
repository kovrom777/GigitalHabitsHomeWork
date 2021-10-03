//
//  DHAboutDayViewController.m
//  HW5
//
//  Created by Роман Ковайкин on 03.10.2021.
//

#import "DHAboutDayViewController.h"
#import "../CompleteTask/DHCompleteTaskViewController.h"

@interface DHAboutDayViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation DHAboutDayViewController

- (instancetype) initWithDay:(NSString *)day{
    self = [super init];
    if (self){
        _day = [day copy];
        [self fillInDict];
        self.CellId = @"TaskCellId";
    }
    return self;
}

- (instancetype) init{
    return [self initWithDay:@""];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"day = %@", self.day);
    self.title = self.day;
    self.view.backgroundColor = [UIColor whiteColor];
    [self configureTableView];
}

- (void) configureTableView{
    self.table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.table.delegate = self;
    self.table.dataSource = self;
    [self.table registerClass:UITableViewCell.class forCellReuseIdentifier:self.CellId];
    [self.view addSubview:self.table];
}

- (void) fillInDict{
    self.tasks = @{
        @"Monday": @[@"Wake Up Monday", @"Eat Monday", @"Work Monday", @"Sleep Monday"],
        @"Tuesday": @[@"Wake Up Tuesday", @"Eat Tuesday", @"Work Tuesday", @"Sleep Tuesday"],
        @"Wednesday": @[@"Wake Up Wednesday", @"Eat Wednesday", @"Work Wednesday", @"Sleep Wednesday"],
        @"Thursday": @[@"Wake Up Thursday", @"Eat Thursday", @"Work Thursday", @"Sleep Thursday"],
        @"Friday": @[@"Wake Up Friday", @"Eat Friday", @"Work Friday", @"Sleep Friday"],
        @"Saturday": @[@"Wake Up Saturday", @"Eat Saturday", @"Work Saturday", @"Sleep Saturday"],
        @"Sunday": @[@"Wake Up Sunday", @"Eat Sunday", @"Work Sunday", @"Sleep Sunday"]
    };
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray* tasksArray = self.tasks[self.day];
    return tasksArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [self.table dequeueReusableCellWithIdentifier:self.CellId forIndexPath:indexPath];
    
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.CellId];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSArray *data = self.tasks[self.day];
    cell.textLabel.text = [data objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *data = self.tasks[self.day];
    [self.navigationController pushViewController:[[DHCompleteTaskViewController alloc]initWithTaskName:[data objectAtIndex:indexPath.row]] animated:YES];
}

@end
