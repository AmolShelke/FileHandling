//
//  AppDelegate.m
//  Day23_FileHandling
//
//  Created by Student P_04 on 30/03/17.
//  Copyright © 2017 Felix-v. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
-(void)copyFileName:(NSString *)fileName
{
    NSArray *fileComponents=[fileName componentsSeparatedByString:@"."];
    NSString *nameOfFile=[fileComponents objectAtIndex:0];
    NSString *extensionOfFile=[fileComponents objectAtIndex:1];
    NSString *sourcePath=[[NSBundle mainBundle]pathForResource:nameOfFile ofType:extensionOfFile];
    NSFileManager *fileManager=[NSFileManager defaultManager];
    bool isSourcePathExist=[fileManager fileExistsAtPath:sourcePath];
    NSString *destinationPath=[(NSHomeDirectory())stringByAppendingFormat:@"/Documents/%@",fileName];
    bool isDestinationPathExists=[fileManager fileExistsAtPath:destinationPath];
    if(isSourcePathExist)
    {
        if(isDestinationPathExists)
        {
            NSLog(@"File Already copied");
        }
        else
        {
            NSError  *error;
            [fileManager copyItemAtPath:sourcePath toPath:destinationPath error:&error];
            if(error)
            {
                NSLog(@"%@",error.localizedDescription);
            }
            else
            {
                NSLog(@"File Successfully copied");
            }
        }
    }
    else
    {
        NSLog(@"Source File Doesnot Exists");
    }
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    [self copyFileName:@"PropertyList.plist"];
    
    // Override point for customization after application launch.
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
