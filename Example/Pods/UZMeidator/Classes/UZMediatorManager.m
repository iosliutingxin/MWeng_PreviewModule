//
//  UZMediator.m
//  UzaiModuleApp
//
//  Created by leijian on 16/6/30.
//  Copyright © 2016年 Uzai. All rights reserved.
//

#import "UZMediatorManager.h"
@implementation UZMediatorManager
#pragma mark - public methods
+ (instancetype)sharedInstance
{
    static UZMediatorManager *mediator;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mediator = [[UZMediatorManager alloc] init];
    });
    return mediator;
}

/*
 scheme://[target]/[action]?[params]
 
 url sample:
 aaa://targetA/actionB?id=1234
 */

- (id)performActionWithUrl:(NSURL *)url completion:(void (^)(NSDictionary *))completion
{
    
    if (![url.scheme isEqualToString:@"uzai"]) {
        // 这里就是针对远程app调用404的简单处理了，根据不同app的产品经理要求不同，你们可以在这里自己做需要的逻辑
        return @(NO);
    }

    NSString *decodeUrl = [url.absoluteString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSString *encodeUrl = [decodeUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    url = [NSURL URLWithString:encodeUrl];
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    NSString *urlString = [url query];
    for (NSString *param in [urlString componentsSeparatedByString:@"&"]) {
        NSArray *urlElts = [param componentsSeparatedByString:@"?"];
        if (urlElts.count>=2) {
            NSArray *elts = [param componentsSeparatedByString:@"="];
            if([elts count] >= 2)
            {
                NSString *value = @"";
                for (int i=1; i<elts.count; i++) {
                    if (value.length==0) {
                        value = elts[i];
                    }else
                    {
                        value = [NSString stringWithFormat:@"%@=%@",value,elts[i]];
                    }
                }
                value = [value stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
                NSString *key = [[elts firstObject] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
                [params setObject:value forKey:key];
                continue;
            }
            
        }
        NSArray *elts = [param componentsSeparatedByString:@"="];
        if([elts count] < 2)
        {
            continue;
        }
        NSString *value = [[elts lastObject] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSString *key = [[elts firstObject] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        [params setObject:value forKey:key];
    }
    
    // 这里这么写主要是出于安全考虑，防止黑客通过远程方式调用本地模块。这里的做法足以应对绝大多数场景，如果要求更加严苛，也可以做更加复杂的安全逻辑。
    NSString *actionName = [url.path stringByReplacingOccurrencesOfString:@"/" withString:@""];

    
    // 这个demo针对URL的路由处理非常简单，就只是取对应的target名字和method名字，但这已经足以应对绝大部份需求。如果需要拓展，可以在这个方法调用之前加入完整的路由逻辑
    id result = [self performTarget:url.host action:actionName params:params];
    if (completion) {
        if (result) {
            completion(@{@"result":result});
        } else {
            completion(nil);
        }
    }
    return result;
}

- (id)performTarget:(NSString *)targetName action:(NSString *)actionName params:(NSDictionary *)params
{
    
    NSString *targetClassString = [NSString stringWithFormat:@"Target_%@", targetName];
    NSString *actionString = [NSString stringWithFormat:@"Action_%@:", actionName];
    Class targetClass = NSClassFromString(targetClassString);
    id target = [[targetClass alloc] init];
    SEL action = NSSelectorFromString(actionString);
    
    if (target == nil) {
        // 这里是处理无响应请求的地方之一，这个demo做得比较简单，如果没有可以响应的target，就直接return了。实际开发过程中是可以事先给一个固定的target专门用于在这个时候顶上，然后处理这种请求的
        return nil;
    }
    
    if ([target respondsToSelector:action]) {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[target methodSignatureForSelector:action]];
        
        invocation.target = target;
        invocation.selector = action;
        [invocation setArgument:&params atIndex:2];
        [invocation invoke];
        
        // http://www.cnblogs.com/pengyingh/articles/2359199.html
        //获得返回值类型
        const char *methodReturnType = invocation.methodSignature.methodReturnType;
        
        //如果没有返回值，也就是消息声明为void，那么returnValue=nil
        if (!strcmp(methodReturnType, @encode(void))) {
            return nil;
        }
        //如果返回值为对象，那么为变量赋值
        else if (!strcmp(methodReturnType, @encode(id))) {
            // http://stackoverflow.com/questions/22018272/nsinvocation-returns-value-but-makes-app-crash-with-exc-bad-access
            void *returnValue;
            [invocation getReturnValue:&returnValue];
            
            id newReturnValue = (__bridge id)(returnValue);
            return newReturnValue;
        }
        else {
            //如果返回值为普通类型NSInteger  BOOL
            //返回值长度
            NSUInteger methodReturnLength = invocation.methodSignature.methodReturnLength;
            
            //根据长度申请内存
            void *buffer = (void *)malloc(methodReturnLength);
            id returnValue;
            //为变量赋值
            [invocation getReturnValue:buffer];
            if (!strcmp(methodReturnType, @encode(BOOL))) {
                returnValue = [NSNumber numberWithBool:*((BOOL *)buffer)];
            }
            else if (!strcmp(methodReturnType, @encode(NSInteger))){
                returnValue = [NSNumber numberWithInteger:*((NSInteger *)buffer)];
            }
            else {
                returnValue = [NSValue valueWithBytes:buffer objCType:methodReturnType];
            }
            free(buffer);
            return returnValue;
        }
//#pragma clang diagnostic push
//#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
//        return [target performSelector:action withObject:params];
//#pragma clang diagnostic pop
    } else {
        // 这里是处理无响应请求的地方，如果无响应，则尝试调用对应target的notFound方法统一处理
        SEL action = NSSelectorFromString(@"notFound:");
        if ([target respondsToSelector:action]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            return [target performSelector:action withObject:params];
#pragma clang diagnostic pop
        } else {
            // 这里也是处理无响应请求的地方，在notFound都没有的时候，这个demo是直接return了。实际开发过程中，可以用前面提到的固定的target顶上的。
            return nil;
        }
    }
}
@end
