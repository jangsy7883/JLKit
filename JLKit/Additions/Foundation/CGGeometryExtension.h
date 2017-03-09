//
//  CGGeometryExtension.h
//  JLKitDemo
//
//  Created by Woody on 2017. 3. 9..
//  Copyright © 2017년 Dalkomm. All rights reserved.
//

#ifndef CGGeometryExtension_h
#define CGGeometryExtension_h

CG_INLINE CGRect CGRectSetX(CGRect rect, CGFloat x) {
    rect.origin.x = x;
    return rect;
}

CG_INLINE CGRect CGRectSetY(CGRect rect, CGFloat y) {
    rect.origin.y = y;
    return rect;
}

CG_INLINE CGRect CGRectSetWidth(CGRect rect, CGFloat width) {
    rect.size.width = width;
    return rect;
}

CG_INLINE CGRect CGRectSetHeight(CGRect rect, CGFloat height) {
    rect.size.height = height;
    return rect;
}


#endif /* CGGeometryExtension_h */
