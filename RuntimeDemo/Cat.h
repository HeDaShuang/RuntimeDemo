//
//  Cat.h
//  RuntimeDemo
//
//  Created by eric on 2018/10/31.
//  Copyright © 2018 eric. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Cat : NSObject
{
    NSString *name;
}

@property(nonatomic, assign) NSInteger age;

-(void)catIseattingfood;

@end

NS_ASSUME_NONNULL_END
