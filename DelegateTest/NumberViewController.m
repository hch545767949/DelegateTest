//
//  NumberViewController.m
//  DelegateTest
//
//  Created by greenlaw on 2017/2/28.
//  Copyright © 2017年 Greenlaw. All rights reserved.
//

#import "NumberViewController.h"

@interface NumberViewController ()

@end

@implementation NumberViewController

- (instancetype)init {
    self = [super init];
    if(self) {
        self.number.text = self.number.text = [NSString stringWithFormat:@"%ld",self.integer];
        [self.view setBackgroundColor:[UIColor redColor]];
        [self.plus setTitle:@"+" forState:UIControlStateNormal];
        [self.minus setTitle:@"-" forState:UIControlStateNormal];
        NSLog(@"%@",[NSString stringWithFormat:@"init+%@",self.plus == nil? @"YES" : @"NO"]);
    }
    _integer = 1;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"viewDidLoad");
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
