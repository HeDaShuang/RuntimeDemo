//
//  NSObject+Swizzling.h
//  RuntimeDemo
//
//  Created by eric on 2018/6/19.
//  Copyright © 2018 eric. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Swizzling)

+(void)swizzlingWithOriginalSelector:(SEL) originalSelector bySwizzledSelector:(SEL) swizzlingSelector;

@end
