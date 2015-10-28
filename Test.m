//
//  Test.m
//  LifeOfTheBuddha
//
//  Created by Admin on 10/28/2558 BE.
//  Copyright (c) 2558 BE Phuong Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <ifaddrs.h>
#include "Test.h"

@implementation Test
- (BOOL)isVPNConnected
{
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    
    // retrieve the current interfaces - returns 0 on success
    success = getifaddrs(&interfaces);
    if (success == 0) {
        // Loop through linked list of interfaces
        temp_addr = interfaces;
        while (temp_addr != NULL) {
            NSString *string = [NSString stringWithFormat:@"%s" ,
                                temp_addr->ifa_name];
            if ([string rangeOfString:@"tap"].location != NSNotFound ||
                [string rangeOfString:@"tun"].location != NSNotFound ||
                [string rangeOfString:@"ppp"].location != NSNotFound){
                return YES;
            }
            
            temp_addr = temp_addr->ifa_next;
        }
    }
    
    // Free memory
    freeifaddrs(interfaces);
    return NO;
}


//
//-(void) TestVPN{
//
//    NSDictionary *dict = (__bridge NSDictionary *)(CFNetworkCopySystemProxySettings());
//}

@end

