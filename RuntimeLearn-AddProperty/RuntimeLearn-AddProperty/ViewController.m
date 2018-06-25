//
//  ViewController.m
//  RuntimeLearn-AddProperty
//
//  Created by mac on 2018/6/25.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+FQExtension.h"

/*
 runtime 给分类动态添加属性
 
 原理：给一个类声明属性，其实本质就是给这个类添加关联，并不是直接把这个值的内存空间添加到类存空间。
 
 应用场景：给系统的类添加属性的时候,可以使用runtime动态添加属性方法。
 注解：系统 NSObject 添加一个分类，我们知道在分类中是不能够添加成员属性的，虽然我们用了@property，但是仅仅会自动生成get和set方法的声明，并没有带下划线的属性和方法实现生成。但是我们可以通过runtime就可以做到给它方法的实现。
 
 需求：给系统 NSObject 类动态添加属性 name 字符串。
 
 案例代码：方法+调用+打印
 
 
 */

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 调用
    NSObject *objc = [[NSObject alloc] init];
    objc.name = @"tom";
    objc.age = @"22";
    NSLog(@"runtime动态添加属性 name==%@",objc.name);
    NSLog(@"runtime动态添加属性 age==%@",objc.age);



}

/*
 总结：其实，给属性赋值的本质，就是让属性与一个对象产生关联，所以要给NSObject的分类的name属性赋值就是让name和NSObject产生关联，而runtime可以做到这一点。
 */

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
