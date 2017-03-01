//
//  NumberDirectViewController.m
//  DelegateTest
//
//  Created by greenlaw on 2017/3/1.
//  Copyright © 2017年 Greenlaw. All rights reserved.
//

#import "NumberDirectViewController.h"

@interface NumberDirectViewController ()

@end

@implementation NumberDirectViewController

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
    
//    [self addObserver:self forKeyPath:@"integer" options:NSKeyValueObservingOptionNew context:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"integer"];
}

//直接修改，不需要这个方法监听
//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
//    if( [keyPath isEqualToString:@"integer"] && object == self) {
//        NSNumber *newNumber = [change valueForKey:NSKeyValueChangeNewKey];
//        self.number.text = [NSString stringWithFormat:@"%@",newNumber];
//        NSLog(@"into");
//    }
//}

- (IBAction)minusNumber:(id)sender {
    NSNumber *newNumber = [NSNumber numberWithInteger:[self.integer integerValue] - 1];
    self.integer = newNumber;
    self.number.text = [NSString stringWithFormat:@"%@",newNumber];
    NSLog(@"minusNumber");
}

- (IBAction)plusNumber:(id)sender {
    NSNumber *newNumber = [NSNumber numberWithInteger:[self.integer integerValue] + 1];
    self.integer = newNumber;
    self.number.text = [NSString stringWithFormat:@"%@",newNumber];
    NSLog(@"plusNumber%ld",[newNumber integerValue]);
}

@end
