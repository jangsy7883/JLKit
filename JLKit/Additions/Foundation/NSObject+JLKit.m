//
//  NSObject+JLKit.m
//  JLKit
//
//  Created by Jangsy7883 on 2015. 12. 31..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "NSObject+JLKit.h"

@implementation NSObject (JLKit)

- (id)performSelector:(SEL)aSelector withObjects:(id)object, ...
{
    NSMethodSignature *signature = [self methodSignatureForSelector:aSelector];
    if (signature)
    {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
        invocation.target = self;
        invocation.selector = aSelector;
        
        va_list args;
        va_start(args, object);
        
        [invocation setArgument:&object atIndex:2];
        
        id arg = nil;
        int index = 3;
        while ((arg = va_arg(args, id))) {
            [invocation setArgument:&arg atIndex:index];
            index++;
        }
        
        va_end(args);
        
        [invocation invoke];
        if (signature.methodReturnLength)
        {
            id anObject;
            [invocation getReturnValue:&anObject];
            return anObject;
        }
        else
        {
            return nil;
        }
    }
    else
    {
        return nil;
    }
}

@end
