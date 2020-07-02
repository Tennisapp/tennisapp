package com.zambient.tennis.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;


/**
 * @Author : Durga Rao Maruboina
 * @since : 07-05-2020
 * @version 1
 * 
 * */

@Entity
@Table(name="category_master")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"}) 

public class CategoryMasterEntity  implements Serializable{
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="category_id")
	private long categoryId;
	
	@Column(name="category_name")
	private String categoryName;
	
	@Column(name="category_desc")
	private String categoryDesc;
	
	@Column(name="category_age")
	private int categoryAge;
	
	@Column(name="category_gender")
	private int categoryGender;

	public long getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(long categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getCategoryDesc() {
		return categoryDesc;
	}

	public void setCategoryDesc(String categoryDesc) {
		this.categoryDesc = categoryDesc;
	}

	public int getCategoryAge() {
		return categoryAge;
	}

	public void setCategoryAge(int categoryAge) {
		this.categoryAge = categoryAge;
	}

	public int getCategoryGender() {
		return categoryGender;
	}

	public void setCategoryGender(int categoryGender) {
		this.categoryGender = categoryGender;
	}

}
