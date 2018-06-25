//
//  ViewController.m
//  RuntimeLearn-MethodChange
//
//  Created by mac on 2018/6/25.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+FQExtension.h"

/*
 runtime 交换方法
 
 应用场景：当第三方框架 或者 系统原生方法功能不能满足我们的时候，我们可以在保持系统原有方法功能的基础上，添加额外的功能。
 
 需求：加载一张图片直接用[UIImage imageNamed:@"image"];是无法知道到底有没有加载成功。给系统的imageNamed添加额外功能（是否加载图片成功）。
 
 方案一：继承系统的类，重写方法.（弊端：每次使用都需要导入）
 方案二：使用 runtime，交换方法.
 实现步骤：
 
 1.给系统的方法添加分类
 2.自己实现一个带有扩展功能的方法
 3.交换方法,只需要交换一次,
 案例代码：方法+调用+打印输出
 
 
 */

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 方案一：先搞个分类，定义一个能加载图片并且能打印的方法+ (instancetype)imageWithName:(NSString *)name;
    // 方案二：交换 imageNamed 和 fq_imageNamed 的实现，就能调用 imageNamed，间接调用 fq_imageNamed 的实现。
    
    UIImage *image = [UIImage imageNamed:@"123"];

}

/*
 总结：我们所做的就是在方法调用流程第三步的时候，交换两个方法地址指向。而且我们改变指向要在系统的imageNamed:方法调用前，所以将代码写在了分类的load方法里。最后当运行的时候系统的方法就会去找我们的方法的实现。
 */

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
