//
//  DJDog.h
//  DJDemo
//
//  Created by 段自强 on 2017/3/30.
//  Copyright © 2017年 段自强. All rights reserved.
//

#import <Realm/Realm.h>

@interface DJDog : RLMObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *color;
@end

RLM_ARRAY_TYPE(DJDog)
