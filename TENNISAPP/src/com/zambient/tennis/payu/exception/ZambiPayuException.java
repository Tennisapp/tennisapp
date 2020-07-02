package com.zambient.tennis.payu.exception;

import org.springframework.stereotype.Component;

public class ZambiPayuException extends RuntimeException{
	
	private Exception exc;
	public ZambiPayuException(Exception exc) {
		this.exc=exc;
	}

	public Exception getExc() {
		return exc;
	}
	public void setExc(Exception exc) {
		this.exc = exc;
	}

}
