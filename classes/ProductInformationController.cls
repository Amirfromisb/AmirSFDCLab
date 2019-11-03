/*
Author: Amir Shahzad
On 2nd November, 2019
Build this Class as part of the Case study assignment
*/
public with sharing class ProductInformationController {
//This method needs to be AURA Enabled, as this will be Called from LWC "ProductInformaiton"    
 @AuraEnabled(cacheable=true)
    public static List<Product_Information__c> findRelatedProductInfo (Id recordId) {
        List<Product_Information__c> lprodInfo = New List<Product_Information__c>();
         Case thisCase = [Select Id, ContactId, Contact.Product__c, Contact.Home_Country__c from Case where Id=: recordId];
         if(thisCase!=null)
                lprodInfo = [SELECT Name, Type_of_Charges__c, Product__c, Home_Country__c, Charges__c FROM Product_Information__c where Product__c= :thisCase.Contact.Product__c  And Home_Country__C = :thisCase.Contact.Home_Country__C Order by Type_of_Charges__c];
         return lprodInfo;
     }
}