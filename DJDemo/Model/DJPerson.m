//
//  DJPerson.m
//  DJDemo
//
//  Created by 段自强 on 2017/3/30.
//  Copyright © 2017年 段自强. All rights reserved.
//

#import "DJPerson.h"

@implementation DJPerson

+ (NSString *)primaryKey
{
    return @"IDCard";
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"\n我叫%@,ID是%@,\n今年%@岁,我有一条狗%@",self.name,self.IDCard, self.age,self.dog];
}

@end
