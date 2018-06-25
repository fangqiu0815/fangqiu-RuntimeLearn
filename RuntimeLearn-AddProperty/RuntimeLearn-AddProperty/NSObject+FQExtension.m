//
//  NSObject+FQExtension.m
//  RuntimeLearn-AddProperty
//
//  Created by mac on 2018/6/25.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "NSObject+FQExtension.h"
#import <objc/runtime.h>

@implementation NSObject (FQExtension)

- (void)setName:(NSString *)name
{
    /*
     objc_setAssociatedObject(<#id  _Nonnull object#>, <#const void * _Nonnull key#>, <#id  _Nullable value#>, <#objc_AssociationPolicy policy#>)
     将某个值跟某个对象关联起来，将某个值存储到某个对象中）
     
     object: 给哪个对象添加属性
     key: 属性名称
     value: 属性值
     policy: 保存策略
     
     */
    
    objc_setAssociatedObject(self, @"name", name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)name
{
    return objc_getAssociatedObject(self, @"name");
}

- (void)setAge:(NSString *)age
{
    objc_setAssociatedObject(self, @"age", age, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

}

- (NSString *)age
{
    return objc_getAssociatedObject(self, @"age");
}


@end
