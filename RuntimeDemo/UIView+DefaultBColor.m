//
//  UIView+DefaultBColor.m
//  RuntimeDemo
//
//  Created by eric on 2018/6/11.
//  Copyright © 2018 eric. All rights reserved.
//

#import "UIView+DefaultBColor.h"
#import "objc/runtime.h"

/*
 Property 'defaultBColor' requires method 'defaultBColor' to be defined - use @dynamic or provide a method implementation in this category
 Property 'defaultBColor' requires method 'setDefaultBColor:' to be defined - use @dynamic or provide a method implementation in this category
 */
@implementation UIView (DefaultBColor)

@dynamic defaultBColor;

static char xDefaultColorKey;

-(void)setDefaultBColor:(UIColor *)defaultBColor
{
    //关联对象
    objc_setAssociatedObject(self, &xDefaultColorKey, defaultBColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)defaultBColor
{
    //获取关联对象
    return objc_getAssociatedObject(self, &xDefaultColorKey);
}

@end
