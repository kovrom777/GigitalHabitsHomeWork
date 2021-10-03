//
//  DHCompleteTaskViewController.m
//  HW5
//
//  Created by Роман Ковайкин on 03.10.2021.
//

#import "DHCompleteTaskViewController.h"

@interface DHCompleteTaskViewController ()

@end

@implementation DHCompleteTaskViewController

#pragma mark - Init

- (instancetype) initWithTaskName:(NSString *)task{
    self = [super init];
    if (self){
        _task = [task copy];
        NSLog(@"Task description = %@", _task);
    }
    return self;
}

- (instancetype) init{
    return [self initWithTaskName:@""];
}

#pragma mark - VC life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureView];
    [self setUpView];
}

#pragma mark - View configuration
- (void) configureView{
    self.view.backgroundColor = [UIColor whiteColor];
    self.doneLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.doneLabel.text = @"Task complete";
    self.doneLabel.textAlignment = NSTextAlignmentCenter;
    self.doneLabel.textColor = [UIColor blackColor];
    self.doneLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.doneLabel];
    
    self.image = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.image.translatesAutoresizingMaskIntoConstraints = NO;
    self.image.image = [[UIImage systemImageNamed:@"checkmark"] imageWithTintColor:[UIColor greenColor]];
    [self.view addSubview:self.image];
    
    self.taskNameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.taskNameLabel.text = self.task;
    self.taskNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.taskNameLabel.textColor = [UIColor systemBrownColor];
    self.taskNameLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.taskNameLabel];
    
    self.homeButton = [[UIButton alloc] initWithFrame:CGRectZero];
    self.homeButton.layer.cornerRadius = 16;
    self.homeButton.backgroundColor = [UIColor blueColor];
    self.homeButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.homeButton setTitle:@"Go home" forState:UIControlStateNormal];
    [self.homeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.homeButton addTarget:self action: @selector(goHome) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.homeButton];
    
}

-(void) goHome{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void) setUpView{
    //Done Lable
    [self.doneLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [self.doneLabel.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
    [self.doneLabel.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:16].active = YES;
    [self.doneLabel.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-16].active = YES;
    [self.doneLabel.heightAnchor constraintEqualToConstant:50].active = YES;

    //imageView
    [self.image.bottomAnchor constraintEqualToAnchor:self.doneLabel.topAnchor constant:-50].active = YES;
    [self.image.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [self.image.heightAnchor constraintEqualToConstant:100].active = YES;
    [self.image.widthAnchor constraintEqualToConstant:100].active = YES;
    
    //Home Button
    
    [self.homeButton.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:-50].active = YES;
    [self.homeButton.leadingAnchor constraintEqualToAnchor:self.doneLabel.leadingAnchor].active = YES;
    [self.homeButton.trailingAnchor constraintEqualToAnchor:self.doneLabel.trailingAnchor].active = YES;
    [self.homeButton.heightAnchor constraintEqualToConstant:60].active = YES;
    
    //Task description Label
    [self.taskNameLabel.topAnchor constraintEqualToAnchor:self.image.bottomAnchor constant:20].active = YES;
    [self.taskNameLabel.leadingAnchor constraintEqualToAnchor:self.doneLabel.leadingAnchor].active = YES;
    [self.taskNameLabel.trailingAnchor constraintEqualToAnchor:self.doneLabel.trailingAnchor].active = YES;
    [self.taskNameLabel.bottomAnchor constraintEqualToAnchor:self.homeButton.topAnchor constant:-40].active = YES;
    
}


@end
