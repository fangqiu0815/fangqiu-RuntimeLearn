//
//  Person.m
//  RuntimeLearn-DynamicAddMethod
//
//  Created by mac on 2018/6/25.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "Person.h"
#import <objc/message.h>

@implementation Person
// 动态添加方法,首先实现这个resolveInstanceMethod
// resolveInstanceMethod调用:当调用了没有实现的方法没有实现就会调用resolveInstanceMethod
// resolveInstanceMethod作用:就知道哪些方法没有实现,从而动态添加方法
// sel:没有实现方法

// 定义函数
// 没有返回值,参数(id,SEL)
// void(id,SEL)

void eatFunc(id self, SEL _cmd, id num)
{
    NSLog(@"调用eat %@ %@ %@",self,NSStringFromSelector(_cmd),num);
}

+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    if (sel == NSSelectorFromString(@"eat:")) {
        
        /*
         class_addMethod(<#Class  _Nullable __unsafe_unretained cls#>, <#SEL  _Nonnull name#>, <#IMP  _Nonnull imp#>, <#const char * _Nullable types#>)
         cls:给哪个类添加方法
         SEL:添加方法的方法编号是什么
         IMP:方法实现,函数入口,函数名  方法实现 => 函数 => 函数入口 => 函数名（添加方法的函数实现（函数地址））
         types:方法类型  (返回值+参数类型) v:void @:对象->self :表示SEL->_cmd 可查看官方文档查询：Type Encodings
         */
        // @:对象 :SEL
        class_addMethod(self, sel, (IMP)eatFunc, "v@:@");
        
        // 处理完
        return YES;
        
    }
    
    return [super resolveInstanceMethod:sel];
}


@end
