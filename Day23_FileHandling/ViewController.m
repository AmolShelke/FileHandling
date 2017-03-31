//
//  ViewController.m
//  Day23_FileHandling
//
//  Created by Student P_04 on 30/03/17.
//  Copyright © 2017 Felix-v. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self printFile:@"PropertyList.plist"];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)printFile:(NSString *)fileName
{
    
    NSString *destinationPath=[(NSHomeDirectory())stringByAppendingFormat:@"/Documents/%@",fileName];
    bool isDestinationPathExists=[[NSFileManager defaultManager] fileExistsAtPath:destinationPath];
    NSLog(@"dest:%@",destinationPath);
    if(isDestinationPathExists)
    {
        NSDictionary *myDictionary=[NSDictionary dictionaryWithContentsOfFile:destinationPath];
        NSLog(@"%@",myDictionary);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
