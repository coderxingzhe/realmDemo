//
//  DJPerson.h
//  DJDemo
//
//  Created by 段自强 on 2017/3/30.
//  Copyright © 2017年 段自强. All rights reserved.
//

#import <Realm/Realm.h>
#import "DJDog.h"


@interface DJPerson : RLMObject
@property (nonatomic, strong) NSString *IDCard;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *age;
@property (nonatomic, strong) DJDog *dog;
@end

RLM_ARRAY_TYPE(DJPerson)
