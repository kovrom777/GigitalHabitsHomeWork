//
//  DHAboutDayViewController.h
//  HW5
//
//  Created by Роман Ковайкин on 03.10.2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DHAboutDayViewController : UIViewController

@property (strong, nonatomic) NSString* day;
- (instancetype)initWithDay: (NSString*)day NS_DESIGNATED_INITIALIZER;
@property (strong, nonatomic) NSDictionary* tasks;
@property (strong, nonatomic) UITableView* table;
@property (strong, nonatomic) NSString* CellId;

@end

NS_ASSUME_NONNULL_END
