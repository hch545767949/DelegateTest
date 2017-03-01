//
//  NumberViewController.h
//  DelegateTest
//
//  Created by greenlaw on 2017/2/28.
//  Copyright © 2017年 Greenlaw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NumberKVOViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *minus;
@property (weak, nonatomic) IBOutlet UILabel *number;
@property (weak, nonatomic) IBOutlet UIButton *plus;

//The following three properties are used to test key-value coding protocol, on different scalars or structures.
//If the property being accessed is not an object, it will be wrapped into a NSNumber object. And the corresponding object is then returned.
//If the property being set is not an object, the NSNumber object being stored will be unwrapped into a scalar or a structure.
//And the corresponding scalar or structure is then stored.
//In a word, the property can be an object, or a scalar or structure. But the other side of the KVC is always an object.
//  --by greenlaw 2017/3/1
@property (nonatomic, retain) NSNumber *NSNumberTest;
@property (nonatomic, assign) NSInteger NSIntegerTest;
@property (nonatomic, assign) int intTest;
- (IBAction)minusNumber:(id)sender;
- (IBAction)plusNumber:(id)sender;

@end
