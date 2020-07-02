package com.zambient.tennis.payu.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="paymentaudit")
public class PaymentAudit {
	 @Id
	    @Column
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private int id;
	    
	    
	    @Column
	    private String paymentId;
	    
	  
		@Column
	    private String stage1;
	    @Column
	    private String stage2;
	    @Column
	    private String stage3;
	    @Column
	    private String stage4;
	    @Column
	    private String stage5;
	    @Column
	    private String stage6;
	    @Column
	    private String stage7;
	    @Column
	    private String stage8;
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		
		public String getStage1() {
			return stage1;
		}
		public void setStage1(String stage1) {
			this.stage1 = stage1;
		}
		public String getStage2() {
			return stage2;
		}
		public void setStage2(String stage2) {
			this.stage2 = stage2;
		}
		public String getStage3() {
			return stage3;
		}
		public void setStage3(String stage3) {
			this.stage3 = stage3;
		}
		public String getStage4() {
			return stage4;
		}
		public void setStage4(String stage4) {
			this.stage4 = stage4;
		}
		public String getStage5() {
			return stage5;
		}
		public void setStage5(String stage5) {
			this.stage5 = stage5;
		}
		public String getStage6() {
			return stage6;
		}
		public void setStage6(String stage6) {
			this.stage6 = stage6;
		}
		public String getStage7() {
			return stage7;
		}
		public void setStage7(String stage7) {
			this.stage7 = stage7;
		}
		public String getStage8() {
			return stage8;
		}
		public void setStage8(String stage8) {
			this.stage8 = stage8;
		}
		public String getPaymentId() {
			return paymentId;
		}
		public void setPaymentId(String paymentId) {
			this.paymentId = paymentId;
		}
	 
}
