import { LightningElement,api,track,wire } from 'lwc';
import findProdInfo from '@salesforce/apex/ProductInformationController.findRelatedProductInfo';

export default class ProdInfo extends LightningElement {
    @api recordId;
    @track props;
    @track prodName;
    @track CountryCode;
    @track errorMsg;

    @wire(findProdInfo, { 
        recordId: '$recordId'      
    })
    wiredProps(value) {
        this.wiredRecords = value;
        if (value.error) {
            this.errorMsg = value.error;
            console.log("ERROR: ", this.errorMsg);
        } else if (value.data) {
            this.props = value.data;
            this.prodName = value.data[0].Product__c;
            this.CountryCode = value.data[0].Home_Country__c;           
        }
    }
}