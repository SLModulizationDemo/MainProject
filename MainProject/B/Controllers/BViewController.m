//
//  BViewController.m
//  MainProject
//
//  Created by CoderSLZeng on 2019/4/3.
//  Copyright © 2019 CoderSLZeng. All rights reserved.
//

#import "BViewController.h"
#import <C_Category/CTMediator+C.h>

@interface BViewController ()

@property (strong, nonatomic) UILabel *contentLabel;

@property (strong, nonatomic) UIButton *modalCViewControllerButton;

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
    [self.view addSubview:self.modalCViewControllerButton];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    [self.contentLabel sizeToFit];
    self.contentLabel.center = self.view.center;
    
    [self.modalCViewControllerButton sizeToFit];
    self.modalCViewControllerButton.center = self.contentLabel.center;
    CGRect rect = self.modalCViewControllerButton.frame;
    rect.origin.y = self.view.bounds.size.height - rect.size.height * 2;
    self.modalCViewControllerButton.frame = rect;
}

#pragma mark - event response
- (void)didTouchedModalCViewController {
    
    UIViewController *vc = [[CTMediator sharedInstance] C_viewControllerWithContentText:@"This is modal view controller"];
    [self presentViewController:vc animated:YES completion:nil];
    
}

#pragma mark - getter and setter
- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.textColor = [UIColor blueColor];
    }
    
    return _contentLabel;
}

- (UIButton *)modalCViewControllerButton {
    if (!_modalCViewControllerButton) {
        _modalCViewControllerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_modalCViewControllerButton setTitle:@"modal C view controller" forState:UIControlStateNormal];
        [_modalCViewControllerButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_modalCViewControllerButton addTarget:self
                                        action:@selector(didTouchedModalCViewController)
                              forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _modalCViewControllerButton;
}




@end
