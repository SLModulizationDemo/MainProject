//
//  BViewController.m
//  MainProject
//
//  Created by CoderSLZeng on 2019/4/3.
//  Copyright © 2019 CoderSLZeng. All rights reserved.
//

#import "BViewController.h"

@interface BViewController ()

@property (strong, nonatomic) UILabel *contentLabel;

@end

@implementation BViewController

#pragma mark - life cycle
- (instancetype)initWithContentText:(NSString *)contentText {
    if (self = [super init]) {
        self.contentLabel.text = contentText;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.contentLabel];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    [self.contentLabel sizeToFit];
    self.contentLabel.center = self.view.center;
}

#pragma mark - getter and setter
- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.textColor = [UIColor blueColor];
    }
    
    return _contentLabel;
}



@end
