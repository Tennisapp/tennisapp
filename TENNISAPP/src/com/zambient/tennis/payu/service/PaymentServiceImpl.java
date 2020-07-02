package com.zambient.tennis.payu.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.zambient.tennis.payu.entity.PaymentAudit;
import com.zambient.tennis.payu.model.PaymentCallback;
import com.zambient.tennis.payu.model.PaymentDetail;
import com.zambient.tennis.payu.model.PaymentStatus;
import com.zambient.tennis.payu.model.PayuPayment;
import com.zambient.tennis.payu.util.Audit;
import com.zambient.tennis.payu.util.PaymentAuditUtil;
import com.zambient.tennis.payu.util.PaymentUtil;

import javax.inject.Provider;

@Service
public class PaymentServiceImpl implements PaymentService{

	final static Logger log = Logger.getLogger(PaymentServiceImpl.class);
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	@Lazy
	private  PaymentUtil paymentUtil;
	
	@Autowired
	private Provider<Audit> audit;
	
	
	@Override
	public PaymentDetail proceedPayment(PaymentDetail paymentDetail) {
		 
	        paymentDetail = paymentUtil.populatePaymentDetail(paymentDetail);
	        audit.get().setStage2(PaymentAuditUtil.STAGE2);
	        savePaymentDetail(paymentDetail);
	        return paymentDetail;
	}

	@Override
	public String payuCallback(PaymentCallback paymentResponse) {
		String msg = "Transaction failed.";
  
        String sql = "select id from payment_payu where txn_id=?";
        long paymentId=0L;

		List<Map<String, Object>> templatesObj = jdbcTemplate.queryForList(sql, new Object[] { paymentResponse.getTxnid() });
		if (templatesObj != null && templatesObj.size() > 0) {
			for (Map<String, Object> templateObj : templatesObj) {

			 paymentId = (((Integer) templateObj.get("ID")).longValue());
				
			}
		}
        
        if(paymentId !=0) {
            //TODO validate the hash
            PaymentStatus paymentStatus = null;
            if(paymentResponse.getStatus().equals("failure")){
                paymentStatus = PaymentStatus.Failed;
                audit.get().setStage7(PaymentAuditUtil.STAGE7_FAIL);
            }else if(paymentResponse.getStatus().equals("success")) {
                paymentStatus = PaymentStatus.Success;
                audit.get().setStage7(PaymentAuditUtil.STAGE7_SUCCESS);
                msg = "Transaction success";
            }
            audit.get().setStage8(PaymentAuditUtil.STAGE8);
            
            int result = this.jdbcTemplate.update("update payment_payu set payment_status=?,mihpay_id=?,mode=? where id = ? AND txn_id = ?", 
					new Object[]{paymentStatus.toString(), paymentResponse.getMihpayid(), paymentResponse.getMode().toString(),paymentId,paymentResponse.getTxnid()});
					
            //Save audit status
	    	if(result > 0) {
	        
	       this.jdbcTemplate.update(
					"update paymentaudit set stage6=?, stage7=?,stage8=? where payment_id=?",
		 			new Object[] { audit.get().getStage6(),audit.get().getStage7(),audit.get().getStage8(),paymentResponse.getTxnid()});
	    	}
        }
        return msg;
	}
	
	   private void savePaymentDetail(PaymentDetail paymentDetail) {
		
	    	int result = this.jdbcTemplate.update(
					"insert into payment_payu (amount, email,name, payment_date, payment_status,phone,product_info, txn_id) values (?, ?, ?, ?, ?,?,?,?)",
		 			new Object[] { Double.parseDouble(paymentDetail.getAmount())
		 					, paymentDetail.getEmail()
		 					, paymentDetail.getName()
		 					,  new Date()
		 					,PaymentStatus.Pending.toString()
		 					,paymentDetail.getPhone()
		 					, paymentDetail.getProductInfo()
		 					, paymentDetail.getTxnId()});
					
	
	        
	        //Save audit status
	    	if(result > 0) {
	        
	       this.jdbcTemplate.update(
					"insert into paymentaudit (stage1, stage2,payment_id) values (?, ?,?)",
		 			new Object[] { audit.get().getStage1(),audit.get().getStage2(),paymentDetail.getTxnId()});
	    	}
	    }

}
