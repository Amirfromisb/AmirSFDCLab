/*
Author: Amir Shahzad
On 2nd November, 2019
Build this Class as part of the Case study assignment
This is the Test coverage class for the class ProductInformationController
*/
@isTest 
public class ProductInformationREST_Test {
    static testMethod void VerifyProductInfoByContact() {

        Account acc = OrgTestDataFectory.PrepareAccount();   
        insert acc;        //insert Account
        
        Contact con = OrgTestDataFectory.PrepareContact(acc.Id);
        con.Home_Country__C = 'UK';
        con.Product__C = 'Standard';
        con.External_System_ID__c = 'ID001Ext01';
        insert con;        //insert Contact
        
        Product_Information__c ObjProdInfo = OrgTestDataFectory.PrepareProductInfo();
        insert ObjProdInfo; // Insert Product Information

        RestRequest req = new RestRequest(); 
        RestResponse res = new RestResponse();
//Set the REST request with Parameter
        req.requestURI = '/services/apexrest/Productinfo'; 
        req.addParameter('ExtID', 'ID001Ext01');
        req.httpMethod = 'GET';
        RestContext.request = req;
        RestContext.response = res;
//Call the REST Get Enabled function
        ProductInformationREST.getProductInfo();

    }
}