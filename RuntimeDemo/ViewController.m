//
//  ViewController.m
//  RuntimeDemo
//  
//  Created by eric on 2018/6/11.
//  Copyright © 2018 eric. All rights reserved.
//

#import "ViewController.h"
#import "objc/runtime.h"

@interface UIView(DefaultColor)

@property (nonatomic, strong) UIColor *defaultColor;

@end

@implementation  UIView(DefaultColor)
@dynamic defaultColor;

static char kDefaultColorKey;

- (void)setDefaultColor:(UIColor *)defaultColor {
    objc_setAssociatedObject(self, &kDefaultColorKey, defaultColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)defaultColor {
    return objc_getAssociatedObject(self, &kDefaultColorKey);
}

@end


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getCatclassAllIvar];

    [self getCatclassAllMethod];
    
    
    //使用runtime给类增加一个属性defaultBColor
    UIView *testView = [[UIView alloc] initWithFrame:CGRectMake(20, 100, 300, 300)];
    testView.defaultColor = [UIColor greenColor];
    testView.backgroundColor = [UIColor blueColor];
    testView.defaultBColor = [UIColor yellowColor];
    
    NSLog(@"%@", testView.defaultColor);
    NSLog(@"%@", testView.defaultBColor);
    
    [self.view addSubview:testView];
    
 
}


//使用runtime获取类的成员变量
-(void)getCatclassAllIvar{
    unsigned int count = 0;
    Ivar *allVariable = class_copyIvarList([Cat class], &count);
    for (int i = 0; i < count; i ++) {
        Ivar ivar = allVariable[i];
        const char *variableName = ivar_getName(ivar);
        const char *type = ivar_getTypeEncoding(ivar);
        
        NSLog(@"name:%s  === type:%s", variableName, type);
    }
}

//使用runtime获取类的方法
-(void)getCatclassAllMethod{
    
    unsigned int countx = 0;
    Method *allMethods = class_copyMethodList([Cat class], &countx);
    for (int j = 0; j < countx; j++) {
        Method method = allMethods[j];
        SEL sel = method_getName(method);
        //得到sel的方法名：以字符串格式获取sel的name，也即@selector()中的方法名称
        const char *methodName = sel_getName(sel);
        NSLog(@"-------the method :%s",methodName);
    }
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
