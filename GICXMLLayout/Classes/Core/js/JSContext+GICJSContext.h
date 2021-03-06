//
//  JSContext+GICJSContext.h
//  GICXMLLayout
//
//  Created by 龚海伟 on 2018/11/12.
//

#import <JavaScriptCore/JavaScriptCore.h>
#import "GICJSElementDelegate.h"

@interface JSContext (GICJSContext)

-(void)registCoreAPI;

/**
 根数据源。一个页面只能有一个根数据源。根数据源的作用就是提供类似全局的数据源以及方法访问。类似VUE中的data 提供的功能
 */
@property JSValue *rootDataContext;

@property GICJSElementDelegate *rootElement;


/**
 是否设置了跟数据源
 */
@property (nonatomic,readonly)BOOL isSetRootDataContext;

-(JSValue *)excuteJSString:(NSString *)jsString withArguments:(NSArray *)arguments;
@end
