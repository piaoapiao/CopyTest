//
//  Person.m
//  CopyTest
//
//  Created by guodong on 2018/5/29.
//  Copyright © 2018年 guodong. All rights reserved.
//

#import "Person.h"

@implementation Person
-(id)initWithCoder:(NSCoder *)aDecoder
{    
    if ((self = [super init])) {
        _name = [aDecoder decodeObjectForKey:@"name"];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
     [aCoder encodeObject:self.name forKey:@"name"];
}


-(id)copyWithZone:(NSZone *)zone {
//    id tmp = [[[self class] alloc] init];
    
    id tmp = [[[self class] allocWithZone: zone] init];
    self.a=0x11111111;
    self.b=0x22222222;
    return tmp;
}

- (id)mutableCopyWithZone:(NSZone *)zone
{
    id tmp = [[[self class] alloc] init];
    //    id tmp;
    return tmp;
}


//+ (instancetype)allocWithZone:( NSZone *)zone
//{
//    id tmp = [[[self class] alloc] init];
//    //    id tmp;
//    return tmp;
//
//}
@end
