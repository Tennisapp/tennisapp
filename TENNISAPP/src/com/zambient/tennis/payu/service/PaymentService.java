package com.zambient.tennis.payu.service;

import org.springframework.stereotype.Service;

import com.zambient.tennis.payu.model.PaymentCallback;
import com.zambient.tennis.payu.model.PaymentDetail;



public interface PaymentService {
	
	public PaymentDetail proceedPayment(PaymentDetail paymentDetail);
	public String payuCallback(PaymentCallback paymentResponse);

}
