/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.math.BigDecimal;

public class Restaurant {

  
    private Integer restId;
   
    private String name;
  
    private String street;
 
    private String stateLoc;
   
    private String city;
   
    private int zip;
  
    private String phone;
  
    private BigDecimal minimumOrder;

    public Restaurant() {
    }

	public Restaurant(Integer restId, String name, String street, String stateLoc, String city, int zip, String phone,
			BigDecimal minimumOrder) {
		super();
		this.restId = restId;
		this.name = name;
		this.street = street;
		this.stateLoc = stateLoc;
		this.city = city;
		this.zip = zip;
		this.phone = phone;
		this.minimumOrder = minimumOrder;
	}

	public Integer getRestId() {
		return restId;
	}

	public void setRestId(Integer restId) {
		this.restId = restId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getStateLoc() {
		return stateLoc;
	}

	public void setStateLoc(String stateLoc) {
		this.stateLoc = stateLoc;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public int getZip() {
		return zip;
	}

	public void setZip(int zip) {
		this.zip = zip;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public BigDecimal getMinimumOrder() {
		return minimumOrder;
	}

	public void setMinimumOrder(BigDecimal minimumOrder) {
		this.minimumOrder = minimumOrder;
	}

	@Override
	public String toString() {
		return "Restaurant [restId=" + restId + ", name=" + name + ", street=" + street + ", stateLoc=" + stateLoc
				+ ", city=" + city + ", zip=" + zip + ", phone=" + phone + ", minimumOrder=" + minimumOrder + "]";
	}

   
}
