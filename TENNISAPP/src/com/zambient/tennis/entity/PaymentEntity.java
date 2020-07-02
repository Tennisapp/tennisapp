package com.zambient.tennis.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.zambient.tennis.entity.CategoryMasterEntity;

/**
 * @Author : Durga Rao Maruboina
 * @since : 07-05-2020
 * @version 1
 * 
 * */


@Entity
@Table(name="payment")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"}) 

public class PaymentEntity  implements Serializable{

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="payment_id")
	private long paymentId;
	
	@OneToOne
	@JoinColumn(name="category_id")
	private CategoryMasterEntity categoryId;
	
	@OneToOne
	@JoinColumn(name="tournment_id")
	private TournamentEntity tournmentIdEntity;
	
	@Column(name="card_holder_name")
	private String cardHolderName;
	
	@Column(name="card_number")
	private String cardNumber;
	
	@Column(name="card_type")
	private String cardType;
	
	@Column(name="transaction_status")
	private String transactionStatus;
	
	@Column(name="amount")
	private int amount;
	
	@Column(name="card_or_cash")
	private String cardOrCash;

	public long getPaymentId() {
		return paymentId;
	}

	public void setPaymentId(long paymentId) {
		this.paymentId = paymentId;
	}

	public CategoryMasterEntity getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(CategoryMasterEntity categoryId) {
		this.categoryId = categoryId;
	}

	public TournamentEntity getTournmentIdEntity() {
		return tournmentIdEntity;
	}

	public void setTournmentIdEntity(TournamentEntity tournmentIdEntity) {
		this.tournmentIdEntity = tournmentIdEntity;
	}

	public String getCardHolderName() {
		return cardHolderName;
	}

	public void setCardHolderName(String cardHolderName) {
		this.cardHolderName = cardHolderName;
	}

	public String getCardNumber() {
		return cardNumber;
	}

	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}

	public String getCardType() {
		return cardType;
	}

	public void setCardType(String cardType) {
		this.cardType = cardType;
	}

	public String getTransactionStatus() {
		return transactionStatus;
	}

	public void setTransactionStatus(String transactionStatus) {
		this.transactionStatus = transactionStatus;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getCardOrCash() {
		return cardOrCash;
	}

	public void setCardOrCash(String cardOrCash) {
		this.cardOrCash = cardOrCash;
	}
}
