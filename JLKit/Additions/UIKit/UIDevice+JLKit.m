//
//  UIDevice+IdentifierAddition.m
//  JLKit
//
//  Created by Jangsy7883 on 11. 9. 5..
//  Copyright © 2012년 Dalkomm Apps. All rights reserved.
//

#import "UIDevice+JLKit.h"

#include <sys/socket.h> // Per msqr
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>
#include <ifaddrs.h>
#include <arpa/inet.h>

@implementation UIDevice (Additions)

#pragma mark - getters

- (unsigned long long)systemTotalSize {
    NSError *error = nil;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSDictionary *dictionary = [[NSFileManager defaultManager] attributesOfFileSystemForPath:paths.lastObject error: &error];
    
	if (error) {
		NSLog(@"Error Obtaining System Memory Info: Domain = %@, Code = %ld", error.domain, (long)error.code);
	}else{
		if (dictionary) {
			NSNumber *sizeInBytes = dictionary[NSFileSystemSize];
			return sizeInBytes.unsignedLongLongValue;
		}
	}
	return 0;
}

- (unsigned long long)systemFreeSize {
    NSError *error = nil;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSDictionary *dictionary = [[NSFileManager defaultManager] attributesOfFileSystemForPath:paths.lastObject error: &error];
    
	if (error) {
		NSLog(@"Error Obtaining System Memory Info: Domain = %@, Code = %ld", error.domain, (long)error.code);
	}else{
		if (dictionary) {
			NSNumber *sizeInBytes = dictionary[NSFileSystemFreeSize];
			return sizeInBytes.unsignedLongLongValue;
		}
	}
	return 0;
}

#pragma mark - ip Address

- (NSString *)ipAddressForInterface:(NSString *)interface ipVersion:(NSInteger)ipVersion {
    NSString *address = nil;
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    struct sockaddr_in *s4;
    struct sockaddr_in6 *s6;
    char buf[64];
    int success = 0;
    
    // retrieve the current interfaces - returns 0 on success
    success = getifaddrs(&interfaces);
    if (success == 0)
 	  {
          // Loop through linked list of interfaces
          temp_addr = interfaces;
          while(temp_addr != NULL)
          {
              if( (ipVersion == 4 && temp_addr->ifa_addr->sa_family == AF_INET) ||
                 (ipVersion == 6 &&  temp_addr->ifa_addr->sa_family == AF_INET6))
              {
//                  NSLog(@"Network Interface: %@",[NSString stringWithUTF8String:temp_addr->ifa_name]);
                  
                  // Check if interface is en0 which is the wifi connection on the iPhone
                  if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:interface])
                  {
                      if(ipVersion == 4)
                      {
                          s4 = (struct sockaddr_in *)temp_addr->ifa_addr;
                          
                          if (inet_ntop(temp_addr->ifa_addr->sa_family, (void *)&(s4->sin_addr), buf, sizeof(buf)) == NULL)
                          {
                              NSLog(@"%s: inet_ntop failed for v4!\n",temp_addr->ifa_name);
                          }
                          else{
                              address = [NSString stringWithUTF8String:buf];
                          }
                      }
                      if (ipVersion == 6)
                      {
                          s6 = (struct sockaddr_in6 *)(temp_addr->ifa_addr);
                          
                          if (inet_ntop(temp_addr->ifa_addr->sa_family, (void *)&(s6->sin6_addr), buf, sizeof(buf)) == NULL)
                          {
                              NSLog(@"%s: inet_ntop failed for v6!\n",temp_addr->ifa_name);
                          }
                          else{
                              address = [NSString stringWithUTF8String:buf];
                          }
                      }
                  }
              }
              
              temp_addr = temp_addr->ifa_next;
          }
      }
    
    // Free memory
    freeifaddrs(interfaces);
    return address;
}

- (NSString *)ipAddressForWiFi {
    NSString *address = [self ipAddressForInterface:@"en0" ipVersion:6];
    if (address == nil) {
        address = [self ipAddressForInterface:@"en0" ipVersion:4];
    }
    return address;
}

- (NSString *)ipAddressForCellular {
    NSString *address = [self ipAddressForInterface:@"pdp_ip0" ipVersion:6];
    if (address == nil) {
        address = [self ipAddressForInterface:@"pdp_ip0" ipVersion:4];
    }
    return address;
}

@end
