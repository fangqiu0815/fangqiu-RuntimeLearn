//
//  Person.m
//  RuntimeLearn-Message
//
//  Created by mac on 2018/6/25.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "Person.h"

@implementation Person


-(void)eat{
    
    NSLog(@"对象方法---我要吃鱼了");
    
}
+(void)eat{
    
    NSLog(@"类方法---我要吃鱼了");
}



@end
