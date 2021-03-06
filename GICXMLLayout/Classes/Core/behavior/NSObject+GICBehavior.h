//
//  NSObject+GICBehavior.h
//  GICXMLLayout
//
//  Created by gonghaiwei on 2018/7/12.
//

#import <Foundation/Foundation.h>
#import "GICBehaviors.h"

@interface NSObject (GICBehavior)

/**
 行为列表
 */
@property (nonatomic,readonly)GICBehaviors *gic_Behaviors;

/**
 添加行为
 @param behavior
 */
-(void)gic_addBehavior:(GICBehavior *)behavior;
@end
