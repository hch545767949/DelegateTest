//
//  NumberViewController.m
//  DelegateTest
//
//  Created by greenlaw on 2017/2/28.
//  Copyright © 2017年 Greenlaw. All rights reserved.
//

#import "NumberKVOViewController.h"

@interface NumberKVOViewController ()

@end

@implementation NumberKVOViewController

- (instancetype)init {
    self = [super init];
    if(self) {
        _NSNumberTest = [NSNumber numberWithInteger:1];
        _NSIntegerTest = 1;
        _intTest = 1;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.number.text = [NSString stringWithFormat:@"%@",self.NSNumberTest];
    
    [self.plus setTitle:@"+"
               forState:UIControlStateNormal];
    
    [self.minus setTitle:@"-"
                forState:UIControlStateNormal];
    
    [self addObserver:self
           forKeyPath:@"NSNumberTest"
              options:NSKeyValueObservingOptionNew
              context:nil];
    [self addObserver:self
           forKeyPath:@"NSIntegerTest"
              options:NSKeyValueObservingOptionNew
              context:nil];
    [self addObserver:self
           forKeyPath:@"intTest"
              options:NSKeyValueObservingOptionNew
              context:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    //此处直接取NSKeyValueChangeNewKey的值，没有使用kvc去访问实际的property新值
    if( [keyPath isEqualToString:@"NSNumberTest"] && object == self) {
        NSNumber *newNumber = [change valueForKey:NSKeyValueChangeNewKey];
        self.number.text = [NSString stringWithFormat:@"%@",newNumber];
        NSLog(@"NSNumber = %ld", [newNumber integerValue]);
    } else if ( [keyPath isEqualToString:@"intTest"] && object == self) {
        NSLog(@"intTest = %@", [change valueForKey:NSKeyValueChangeNewKey]);
    } else if ( [keyPath isEqualToString:@"NSIntegerTest"] && object == self) {
        NSLog(@"NSInteger = %@", [change valueForKey:NSKeyValueChangeNewKey]);
    }
    
    NSLog(@"Observed");
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"NSNumberTest"];
    [self removeObserver:self forKeyPath:@"NSIntegerTest"];
    [self removeObserver:self forKeyPath:@"intTest"];
}

- (IBAction)minusNumber:(id)sender {
    NSNumber *newNumber = [NSNumber numberWithInteger:[self.NSNumberTest integerValue] - 1];
    [self setValue:newNumber forKey:@"NSNumberTest"];//NSNumber类型可以直接赋值给NSNumber
    
    NSInteger newnsinteger = self.NSIntegerTest - 1;
    [self setValue:[NSNumber numberWithInteger:newnsinteger] forKey:@"NSIntegerTest"];//NSInteger转换为NSNumber才能传入
    
    int newint = self.intTest - 1;
    [self setValue:[NSNumber numberWithInt:newint] forKey:@"intTest"];//int转换为NSNumber才能传入
    
    NSLog(@"minus NSNumber = %ld NSInteger = %ld intTest = %d",[self.NSNumberTest integerValue], self.NSIntegerTest, self.intTest);
}

- (IBAction)plusNumber:(id)sender {
    NSNumber *newNumber = [NSNumber numberWithInteger:[self.NSNumberTest integerValue] + 1];
    [self setValue:newNumber forKey:@"NSNumberTest"];//NSNumber类型可以直接赋值给NSNumber
    
    NSInteger newnsinteger = self.NSIntegerTest + 1;
    [self setValue:[NSNumber numberWithInteger:newnsinteger] forKey:@"NSIntegerTest"];//NSInteger转换为NSNumber才能传入
    
    int newint = self.intTest + 1;
    [self setValue:[NSNumber numberWithInt:newint] forKey:@"intTest"];//int转换为NSNumber才能传入
    
    NSLog(@"plus NSNumber = %ld NSInteger = %ld intTest = %d",[self.NSNumberTest integerValue], self.NSIntegerTest, self.intTest);}
@end
