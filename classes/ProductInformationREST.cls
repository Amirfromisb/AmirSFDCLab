/*
Author: Amir Shahzad
On 2nd November, 2019
Build this Class as part of the Case study assignment
This Class will be invoked in response to a REST call with Berrer token,
this will return the Product Information based on the Information gather from Contact, 
and a unique ID will be provided by the service to reach the contact
*/
@RestResource(urlMapping='/Productinfo/*')
global with sharing class ProductInformationREST {

    @HttpGet
    global static List<Product_Information__c> getProductInfo() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        //Extract the iput parameter snet in REST call
        String ExtnalID =  RestContext.request.params.get('ExtID');
        //Extract the Contact by the External ID provided by the External system
        Contact thisCon = [SELECT  Home_Country__c, Product__c FROM Contact WHERE External_System_ID__c = :ExtnalID];

         List<Product_Information__c> lprodInfo = New List<Product_Information__c>();
         if(thisCon!=null)
                lprodInfo = [SELECT Name, Type_of_Charges__c, Product__c, Home_Country__c, Charges__c FROM Product_Information__c where Product__c= :thisCon.Product__c  And Home_Country__C = :thisCon.Home_Country__C Order by Type_of_Charges__c];
         
         //Return the result from from Product Information object
         return lprodInfo;
    }
}