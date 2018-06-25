//
//  ViewController.m
//  RuntimeLearn-Message
//
//  Created by mac on 2018/6/25.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ViewController.h"
#import <objc/message.h>
#import "Person.h"

/*
 必须要导入头文件 #import <objc/message.h>
 
 注解1：我们导入系统的头文件，一般用尖括号。
 
 注解2：OC 解决消息机制方法提示步骤【查找build setting -> 搜索msg -> objc_msgSend（YES --> NO）】
 
 注解3：最终生成消息机制,编译器做的事情，最终代码，需要把当前代码重新编译，用xcode编译器，【clang -rewrite-objc main.m 查看最终生成代码】，示例：cd main.m --> 输入前面指令，就会生成 .opp文件(C++代码)
 
 注解4：这里一般不会直接导入<objc/runtime.h>
 
 一般写法---
 // id objc = [NSObject alloc];
 id objc = objc_msgSend([NSObject class], @selector(alloc));
 
 // objc = [objc init];
 objc = objc_msgSend(objc, @selector(init));
 
 // 本质：让类对象发送消息

 runtime 方法调用流程「消息机制」
 
 面试：消息机制方法调用流程
 
 怎么去调用eat方法，对象方法：(保存到类对象的方法列表) ，类方法：(保存到元类(Meta Class)中方法列表)。
 
 1.OC 在向一个对象发送消息时，runtime 库会根据对象的 isa指针找到该对象对应的类或其父类中查找方法。。
 
 2.注册方法编号（这里用方法编号的好处，可以快速查找）。
 
 3.根据方法编号去查找对应方法。
 
 4.找到只是最终函数实现地址，根据地址去方法区调用对应函数。
 
 补充：一个objc 对象的 isa 的指针指向什么？有什么作用？
 
 每一个对象内部都有一个isa指针，这个指针是指向它的真实类型，根据这个指针就能知道将来调用哪个类的方法。
 
 
 */

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    /*调用对象方法通常做法1*/
//      Person *person1 = [[Person alloc]init];
//    
//      [person1 eat];
    
    /*调用对象方法通常做法2*/
    //Person *person2 = [[Person alloc]init];
    //[person2 performSelector:@selector(eat)];
    // SEL:方法编号,根据方法编号就可以找到对应方法实现，此方法其实就是运用了运行时。
    /*运行时方法*/
    
    
    /*调用类方法通常做法*/
    //[Person eat];//通过类名调用 方法1
    //[[Person class] eat];//通过类对象调用 方法2
    
    //运行时方法
    // 运行时,发送消息,谁做事情就引用谁
    
    // 让person发送消息-对象
    Person *person3 = [[Person alloc]init];
    objc_msgSend(person3, @selector(eat));
    
    
    //类方法使用runtime
    // 获取类对象
    Class personClass = [Person class];
    // 运行时
    objc_msgSend(personClass, @selector(eat));


}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
