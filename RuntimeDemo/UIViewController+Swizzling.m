//
//  UIViewController+Swizzling.m
//  RuntimeDemo
//  使用runtime拦截系统自带的方法，重写load方法，在load里面拦截viewDidAppear
//  Created by eric on 2018/6/19.
//  Copyright © 2018 eric. All rights reserved.
//

#import "UIViewController+Swizzling.h"
#import "NSObject+Swizzling.h"

@implementation UIViewController (Swizzling)

+(void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [UIViewController swizzlingWithOriginalSelector:@selector(viewDidAppear:) bySwizzledSelector:@selector(my_ViewDidAppear:)];
    });
}

-(void)my_ViewDidAppear:(BOOL) animated{
    [self my_ViewDidAppear:animated];
    NSLog(@"===== %@ viewDidAppear=====",[self class]);
}

@end
