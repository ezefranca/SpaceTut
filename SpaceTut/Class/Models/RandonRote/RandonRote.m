//
//  RandonRote.m
//  SpaceTut
//
//  Created by GABRIEL VIEIRA on 23/04/14.
//  Copyright (c) 2014 ios. All rights reserved.
//

#import "RandonRote.h"

@implementation RandonRote

+(CGMutablePathRef)returnRote : (int)rand
{
    
    CGMutablePathRef cgpath = CGPathCreateMutable();
    CGPoint s ;
    CGPoint e ;
    CGPoint cp1 ;
    CGPoint cp2 ;
    
    
    switch (rand) {
        case 1:
             s = CGPointMake(600.0, 160);
             e = CGPointMake(0.0, 320);
             cp1 = CGPointMake(450, 320);
             cp2 = CGPointMake(250, -320);
            
            break;
          
        case 2:
            
            s = CGPointMake(600.0, 320);
            e = CGPointMake(0.0, 0);
            cp1 = CGPointMake(450, 100);
            cp2 = CGPointMake(90, 150);
            
            break;
            
        case 3:
            
            s = CGPointMake(600.0, 0);
            e = CGPointMake(0.0, 320);
            cp1 = CGPointMake(100, 50);
            cp2 = CGPointMake(90, 320);
            
            break;
            
        case 4:
            
            s = CGPointMake(600.0, 160);
            e = CGPointMake(0.0, 120);
            cp1 = CGPointMake(30, 0);
            cp2 = CGPointMake(250, 150);
            
            break;
            
        case 5:
            
            s = CGPointMake(600.0, 50);
            e = CGPointMake(0.0, 320);
            cp1 = CGPointMake(200, 200);
            cp2 = CGPointMake(400, -320);
            
            break;
            
        default:
            break;
    }
    
    
    CGPathMoveToPoint(cgpath,NULL, s.x, s.y);
    CGPathAddCurveToPoint(cgpath, NULL, cp1.x, cp1.y, cp2.x, cp2.y, e.x, e.y);

    
    return cgpath;
}

@end
