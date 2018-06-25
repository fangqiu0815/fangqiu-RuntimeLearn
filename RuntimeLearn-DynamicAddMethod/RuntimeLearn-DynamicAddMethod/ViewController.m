//
//  ViewController.m
//  RuntimeLearn-DynamicAddMethod
//
//  Created by mac on 2018/6/25.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

/*
 动态添加方法
 
 应用场景：如果一个类方法非常多，加载类到内存的时候也比较耗费资源，需要给每个方法生成映射表，可以使用动态给某个类，添加方法解决。
 
 注解：OC 中我们很习惯的会用懒加载，当用到的时候才去加载它，但是实际上只要一个类实现了某个方法，就会被加载进内存。当我们不想加载这么多方法的时候，就会使用到 runtime 动态的添加方法。
 
 需求：runtime 动态添加方法处理调用一个未实现的方法 和 去除报错。
 
 
 */
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Person *person = [[Person alloc]init];
    
    [person performSelector:@selector(eat:) withObject:@10];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
