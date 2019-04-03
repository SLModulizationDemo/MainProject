//
//  ViewController.m
//  MainProject
//
//  Created by CoderSLZeng on 2019/4/3.
//  Copyright © 2019 CoderSLZeng. All rights reserved.
//

#import "ViewController.h"
#import <A_Category/CTMediator+A.h>

@interface ViewController ()
/** push B控制器的按钮 */
@property (strong, nonatomic) UIButton *pushAViewControllerButton;
@end

@implementation ViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.pushAViewControllerButton];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    [self.pushAViewControllerButton sizeToFit];
    self.pushAViewControllerButton.center = self.view.center;
}

#pragma mark - event response
- (void)didTouchedpushAViewControllerButton {    
    UIViewController *vc = [[CTMediator sharedInstance] A_viewController];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - getters and setters
- (UIButton *)pushAViewControllerButton {
    if (!_pushAViewControllerButton) {
        _pushAViewControllerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_pushAViewControllerButton setTitle:@"push A view controller" forState:UIControlStateNormal];
        [_pushAViewControllerButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_pushAViewControllerButton addTarget:self
                                       action:@selector(didTouchedpushAViewControllerButton)
                             forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _pushAViewControllerButton;
}

@end
