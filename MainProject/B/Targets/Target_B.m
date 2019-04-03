//
//  Target_B.m
//  MainProject
//
//  Created by CoderSLZeng on 2019/4/3.
//  Copyright © 2019 CoderSLZeng. All rights reserved.
//

#import "Target_B.h"
#import "BViewController.h"

@implementation Target_B

- (nonnull UIViewController *)Action_viewController:(nullable NSDictionary *)parameters {
    NSString *contentText = parameters[@"contentText"];
    BViewController *vc = [[BViewController alloc] initWithContentText:contentText];
    return vc;
}

@end
