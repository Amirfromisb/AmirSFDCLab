/*
Author: Amir Shahzad
On 2nd November, 2019
Build this Class as part of the Case study assignment
This is the Test coverage class for the class ProductInformationController
*/
@isTest 
public class ProductInformationController_Test {
    static testMethod void myUnitTest() {

        Account acc = OrgTestDataFectory.PrepareAccount();   
        insert acc;        //insert Account
        
        Contact con = OrgTestDataFectory.PrepareContact(acc.Id);
        con.Home_Country__C = 'UK';
        con.Product__C = 'Standard';
        insert con;        //insert Contact

        Case myCase = OrgTestDataFectory.PrepareCase(con.Id);    
        insert myCase; // Insert Case
        
        Product_Information__c myProdInfo = OrgTestDataFectory.PrepareProductInfo();
        insert myProdInfo; // Insert Product Information



    }
}