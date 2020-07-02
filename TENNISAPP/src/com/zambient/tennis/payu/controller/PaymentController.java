package com.zambient.tennis.payu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.zambient.tennis.payu.exception.ZambiPayuException;
import com.zambient.tennis.payu.model.PaymentCallback;
import com.zambient.tennis.payu.model.PaymentDetail;
import com.zambient.tennis.payu.model.PaymentMode;
import com.zambient.tennis.payu.service.PaymentService;
import com.zambient.tennis.payu.util.Audit;
import com.zambient.tennis.payu.util.PaymentAuditUtil;

import org.apache.log4j.Logger;
import javax.inject.Provider;


@RestController
@RequestMapping("/payment")
public class PaymentController {
	
	final static Logger logger= Logger.getLogger(PaymentController.class.getSimpleName());

    @Autowired
    private PaymentService paymentService;
    
    @Autowired
    private PaymentCallback paymentCallback ;
    
    @Autowired
    private Provider<Audit> audit;

    @RequestMapping(value = "/payment-details")
    public ResponseEntity<PaymentDetail> proceedPayment(@RequestBody PaymentDetail paymentDetail){
    	try {
    		audit.get().setStage1(PaymentAuditUtil.STAGE1);
    		logger.info("################# Request Entered into payment-details api : "+paymentDetail.getEmail());
        return new ResponseEntity<PaymentDetail>(paymentService.proceedPayment(paymentDetail),HttpStatus.OK);
    	}catch(Exception exc) {
    		logger.error(exc);
    	 throw new ZambiPayuException(exc);
    	}
    }

    @RequestMapping(value = "/payment-response", method = RequestMethod.POST)
    public ResponseEntity<String> payuCallback(@RequestParam String mihpayid, @RequestParam String status, @RequestParam PaymentMode mode, @RequestParam String txnid, @RequestParam String hash){
      try {
    	// below commented is example complete response of payu after transaction
    //	mihpayid=109734&mode=CC&status=failure&unmappedstatus=failed&key=gtKFFx&txnid=QDSb57a12610be90a46&amount=5000.00&cardCategory=domestic&discount=0.00&net_amount_debit=0.00&addedon=2018-07-19+20%3A47%3A24&productinfo=dataSupport&firstname=Dhiraj&lastname=&address1=&address2=&city=&state=&country=&zipcode=&email=only2dhir%40gmail.com&phone=8884377251&udf1=&udf2=&udf3=&udf4=&udf5=&udf6=&udf7=&udf8=&udf9=&udf10=&hash=9044307d31d092e99a729710b2fedd387f31ee0d3f1dcb55dd3fc68eda1c1b6ae1d7382eb9a4c565a0c08fd6caea16544c2bc7106a68fcb602f15e3c878f67c7&field1=152536&field2=971578&field3=20180719&field4=MC&field5=794708900428&field6=45&field7=1&field8=3DS&field9=+Verification+of+Secure+Hash+Failed%3A+E700+--+Unspecified+Failure+--+Unknown+Error+--+Unable+to+be+determined--E500&payment_source=payu&PG_TYPE=AXISPG&bank_ref_num=152536&bankcode=CC&error=E500&error_Message=Bank+failed+to+authenticate+the+customer&name_on_card=Test&cardnum=401200XXXXXX1112&cardhash=This+field+is+no+longer+supported+in+postback+params.&issuing_bank=AXIS&card_type=VISAnull querystring
    	logger.info("######################## Request Entered into payment-response api : "+txnid);
    	audit.get().setStage6(PaymentAuditUtil.STAGE6);
        paymentCallback.setMihpayid(mihpayid);
        paymentCallback.setTxnid(txnid);
        paymentCallback.setMode(mode);
        paymentCallback.setHash(hash);
        paymentCallback.setStatus(status);
        
        return new ResponseEntity<String>(paymentService.payuCallback(paymentCallback),HttpStatus.OK);
      }catch(Exception exc) {
    	  logger.error(exc);
    	  throw new ZambiPayuException(exc);
      }
    }
}