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
        _integer = [NSNumber numberWithInteger:1];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.number.text = [NSString stringWithFormat:@"%@",self.integer];
    [self.plus setTitle:@"+" forState:UIControlStateNormal];
    [self.minus setTitle:@"-" forState:UIControlStateNormal];
    
    [self addObserver:self forKeyPath:@"integer" options:NSKeyValueObservingOptionNew context:nil];
    
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
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if( [keyPath isEqualToString:@"integer"] && object == self) {
        self.number.text = [change valueForKey:NSKeyValueChangeNewKey];
    }
}

- (IBAction)minusNumber:(id)sender {
    NSNumber *newNumber = [NSNumber numberWithInteger:[self.integer integerValue] - 1];
    [self setValue:newNumber forKey:@"integer"];
    NSLog(@"minusNumber");
}

- (IBAction)plusNumber:(id)sender {
    NSNumber *newNumber = [NSNumber numberWithInteger:[self.integer integerValue] + 1];
    [self setValue:newNumber forKey:@"integer"];
    NSLog(@"plusNumber");
}
@end
