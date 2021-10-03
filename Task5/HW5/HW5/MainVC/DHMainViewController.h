//
//  DHMainViewController.h
//  HW5
//
//  Created by Роман Ковайкин on 03.10.2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DHMainViewController : UIViewController

@property (strong, nonatomic) UITableView* tableView;
@property (strong, nonatomic) NSArray* content;
@property (strong, nonatomic) NSString* cellId;


@end

NS_ASSUME_NONNULL_END
