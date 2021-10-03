//
//  DHCompleteTaskViewController.h
//  HW5
//
//  Created by Роман Ковайкин on 03.10.2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DHCompleteTaskViewController : UIViewController

@property (strong, nonatomic) UILabel *doneLabel;
@property (strong, nonatomic) UIImageView *image;
@property (strong, nonatomic) UILabel* taskNameLabel;
@property (strong, nonatomic) UIButton* homeButton;

@property (strong, nonatomic) NSString* task;
- (instancetype)initWithTaskName: (NSString*)task NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
