//
//  GICPanel.m
//  GICXMLLayout
//
//  Created by 龚海伟 on 2018/7/2.
//

#import "GICPanel.h"
#import "UIView+GICExtension.h"
#import "GICXMLLayout.h"
#import "GICDirective.h"
#import "NSObject+GICDirective.h"

@implementation GICPanel
+(NSString *)gic_elementName{
    return @"panel";
}

-(void)gic_parseSubElements:(NSArray<GDataXMLElement *> *)children{
    for(GDataXMLElement *child in children){
        id childElement = [GICXMLLayout createElement:child];
        if(childElement == nil)
            continue;
        [self gic_addSubElement:childElement];
    }
}

-(NSArray *)gic_subElements{
    return self.subviews;
}

-(CGFloat)gic_calcuActualHeight{
    [self setNeedsLayout];//必须添加这样代码，确保在计算子元素高度的时候，子元素已经正确计算，这样一来肯定会有性能影响。
    if(self.subviews.count==0)
        return self.gic_Height;
    CGFloat maxHeight  = 0;
    for(UIView *v in self.subviews){
        if([v respondsToSelector:@selector(gic_calcuActualHeight)]){
            maxHeight = [(id)v gic_calcuActualHeight] + v.gic_margin.bottom + v.gic_margin.top;
        }else{
            maxHeight = MAX(maxHeight, CGRectGetMaxY(v.frame) + v.gic_margin.bottom);
        }
    }
    return maxHeight;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    if(self.subviews.count>0){
        CGFloat h = 0;
        if(self.gic_Height>0){
            h = self.gic_Height;
        }else{
            h = [self gic_calcuActualHeight];
        }
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(h);
        }];
    }
}

-(void)gic_addSubElement:(id)subElement{
    if([subElement isKindOfClass:[UIView class]]){
        [self addSubview:subElement];
    }else if ([subElement isKindOfClass:[GICDirective class]]){//如果是指令，那么交给指令自己执行
        [self gic_addDirective:subElement];
    }
}

-(void)addSubview:(UIView *)view{
    [super addSubview:view];
    [self layoutView:view];
}

-(void)layoutView:(UIView *)view{
    UIEdgeInsets margin = view.gic_margin;
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(margin.left);
        make.top.mas_offset(margin.top);
        
        if(view.gic_Height>0)
            make.height.mas_equalTo(view.gic_Height);
        else{
            // NOTE:对于UILabel来说，当底部边距显示不为0的时候才会去设置bottom，否则采用自适应高度的方式
            if(margin.bottom!=0 || ![view isKindOfClass:[UILabel class]]){
                make.bottom.mas_offset(-margin.bottom);
            }
        }
        
        if(view.gic_Width > 0)
            make.width.mas_equalTo(view.gic_Width);
        else
            make.right.mas_offset(-margin.right);
    }];
}
@end
