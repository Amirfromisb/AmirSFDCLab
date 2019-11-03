/*
Author: Amir Shahzad
On 2nd November, 2019
Build this Class as part of the Case study assignment
This is class is used to create test records
*/
@isTest 
public class OrgTestDataFectory {

    Public static Account PrepareAccount()
    {
         Account a = new Account();            
            a.Name = 'TestProdUserCount';            
            a.BillingStreet = '1 Road';            
            a.BillingCity = 'City';           
            a.BillingCountry = 'France';            
            a.BillingPostalCode = '11501';
            a.CurrencyIsoCode='USD';  
         return a;  
       }
    
    Public static Contact PrepareContact(ID accId)
    {      
        //Prepare a contact, 
        Contact c = new Contact();
            c.AccountId = accId;
            c.FirstName = 'Test';
            c.LastName = 'ProdUserCount';
            c.Email = 'PUtest@test.com';
        return c;      
    }
    public static Case  PrepareCase(ID contId)
    {
        //Prepare the Case
        Case myCase = new Case();
            myCase.Subject = 'Test Subject';
            myCase.Status = 'New';
            myCase.Description = 'Test Description';
            myCase.Subject = 'My Test Subject';
            myCase.ContactId = contId;
            myCase.Support_Type__c = 'Data Collection';
            myCase.Business_Impact__c = 'Information/Enhancement Request';
            myCase.Application__c = 'New Salesforcce User Required';
            myCase.Functional_Area__c = 'Accounts';
        return myCase;
    }
    public static Product_Information__c PrepareProductInfo()
    {
        //Prepare the Product Information
        Product_Information__c PI = New Product_Information__c();
            PI.Home_Country__C = 'UK';
            PI.Product__C = 'Standard';
            PI.Type_of_Charges__c = 'Cost per Calendar Month';
            PI.Charges__c = '100.75';
        return PI;
    }
    
}