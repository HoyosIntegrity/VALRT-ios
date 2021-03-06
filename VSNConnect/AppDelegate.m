//
//  AppDelegate.m
//  VSNConnect
//
//  Created by Ed Gilmore on 8/12/14.
//  Copyright (c) 2014 Ed Gilmore - Onn, Inc. All rights reserved.
//  www.onncreative.com
//
//  This is version 1.0 of the VSNConnect sample code
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    //app was relaunched to manage
    if([launchOptions objectForKey:UIApplicationLaunchOptionsBluetoothCentralsKey])
    {
        //set bool to Yes for isLaunchedForBluetoothRestore if restore from bluetooth central key
        //Get the array of central managers restored by iOS
        NSArray *centralManagerIdentifiers = launchOptions[UIApplicationLaunchOptionsBluetoothCentralsKey];
        
        // Setup manageDevicesViewController so we can restore the Central Manager
        /*if (manageDevice == nil) {
            manageDevice = [storyboard instantiateViewControllerWithIdentifier:@"ManageDevicesViewController"];
            manageDevice.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        }*/
        if (self.ObjBLEConnection == nil) {
            self.ObjBLEConnection = [[BLEConnectionClass alloc]init];
        }
        
        //Restore the Central Manager
        for (NSString *centralManagerIdentifier in centralManagerIdentifiers) {
            self.ObjBLEConnection.CM = [[CBCentralManager alloc] initWithDelegate:self.ObjBLEConnection queue:nil options:@{CBCentralManagerOptionRestoreIdentifierKey : centralManagerIdentifier, CBCentralManagerOptionShowPowerAlertKey:[NSNumber numberWithBool:YES]}];
            self.ObjBLEConnection.delegate = self;
        }
    }
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
