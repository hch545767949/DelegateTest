//
//  NumberViewController.h
//  DelegateTest
//
//  Created by greenlaw on 2017/2/28.
//  Copyright © 2017年 Greenlaw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NumberViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *minus;
@property (weak, nonatomic) IBOutlet UILabel *number;
@property (weak, nonatomic) IBOutlet UIButton *plus;
@property (nonatomic,assign) NSNumber *integer;
- (IBAction)minusNumber:(id)sender;
- (IBAction)plusNumber:(id)sender;

@end
