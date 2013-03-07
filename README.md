# DMBlockUIKit

simple wrapper for UIAlertView & UIActionSheet to support block based call back.


I love [Blockit](https://github.com/pandamonia/BlocksKit), because it show me the power of block.

I hate Blockit, because:

- it crash my app
- it isn't compitable with ios4.3
- it use some magic which I can't understand soon.

So I implement the block based alertView & actionSheet in a simple way. the code is short and clear; even if there is something wrong, the defect should be easy to fix.


##usage

DMUIActionSheet

```
   DMUIActionSheet *sheet = [DMUIActionSheet actionSheetWithTitle:@"title"];
   
    [sheet addButtonWithTitle:@"button1" action:^{
        NSLog(@"button1");
    }];
    [sheet addButtonWithTitle:@"button2" action:^{
        NSLog(@"button2");
    }];
    [sheet addButtonWithTitle:@"button3" action:^{
        NSLog(@"button3");
    }];
    [sheet addButtonWithTitle:@"button4"];
    [sheet addDestructiveButtonWithTitle:@"cancel" action:^{
        NSLog(@"cancel");
    }];
   [sheet showInView:self.view];
```

DMUIAlertView:

```
    DMUIAlertView *alert = [DMUIAlertView alertViewWithTitle:@"title" message:@"message"];
    [alert addButtonWithTitle:@"button1" action:^{
        NSLog(@"button1");
    }];
    
    [alert addButtonWithTitle:@"button2"];
    [alert show];
```

