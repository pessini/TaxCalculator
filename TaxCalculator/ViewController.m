//
//  ViewController.m
//  TaxCalculator
//
//  Created by Leandro Pessini on 2/12/15.
//  Copyright (c) 2015 Brazuca Labs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *priceTextField;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *cityTaxSegmentedControl;
@property (weak, nonatomic) IBOutlet UILabel *errorLabel;


@property double caTax;
@property double chiTax;
@property double nyTax;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Setting up the cities taxes
    self.caTax = .075;
    self.chiTax = .0925;
    self.nyTax = .045;

}

- (IBAction)onCalculateButtonTapped:(id)sender {


    // error message to help user
    self.errorLabel.text = @"";

    if ([self.priceTextField.text isEqualToString:@""]) {
        self.errorLabel.text = @"You must enter a price.";
    } else {

        NSString *valueTextField = self.priceTextField.text;
        double valueEntered = valueTextField.intValue;
        double result=0.00;

        if (self.cityTaxSegmentedControl.selectedSegmentIndex == 0) {

            result = valueEntered * self.caTax;

        } else if (self.cityTaxSegmentedControl.selectedSegmentIndex == 1){

            result = valueEntered * self.chiTax;

        } else if (self.cityTaxSegmentedControl.selectedSegmentIndex == 2) {

            result = valueEntered * self.nyTax;

            // if UISegmentedControl is -1 (not selected)
        } else {

            self.errorLabel.text = @"You must choose a city.";
            
        }
        
        self.resultLabel.text = [NSString stringWithFormat:@"%.2f", result];
        
    }
    
}

@end
