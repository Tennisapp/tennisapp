package com.zambient.tennis.payu.exception;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;



@ControllerAdvice
public class PayUExceptionHandler {
	final static Logger logger = Logger.getLogger(PayUExceptionHandler.class.getSimpleName());
	
	@Autowired
	private ExceptionResponse exceptionResponse;
	
	/**
	 *  
	 * 
	 * @param embedChecklistException
	 * @param ResponseEntity
	 * @param ExceptionResponse
	 * @return ResponseEntity<ErrorResponse>
	 */
	@ExceptionHandler(ZambiPayuException.class)
	public ResponseEntity<ExceptionResponse> embedChecklistException(ZambiPayuException exc){
		logger.error("############### Exception :"+exc);
		exceptionResponse.setMessage(exc.getExc().getMessage());
		exceptionResponse.setStatus(ExceptionUtils.PAYU_EXPECTATION_FAILED);
		return new ResponseEntity<ExceptionResponse>(exceptionResponse,HttpStatus.INTERNAL_SERVER_ERROR);
		
	}

}
