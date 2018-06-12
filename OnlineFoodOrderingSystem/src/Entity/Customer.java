/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;


public class Customer  {

  
    private Integer custId;
 
    private String fName;
 
    private String lName;
   
    private String street;
   
    private String stateLoc;
  
    private int zip;
  
    private String phone;
  
    private Account accountID;
   
    public Customer() {
    }

    public Customer(Integer custId) {
        this.custId = custId;
    }

    public Customer(Integer custId, String fName, String lName, String street, String stateLoc, int zip, String phone) {
        this.custId = custId;
        this.fName = fName;
        this.lName = lName;
        this.street = street;
        this.stateLoc = stateLoc;
        this.zip = zip;
        this.phone = phone;
    }

    public Integer getCustId() {
        return custId;
    }

    public void setCustId(Integer custId) {
        this.custId = custId;
    }

    public String getFName() {
        return fName;
    }

    public void setFName(String fName) {
        this.fName = fName;
    }

    public String getLName() {
        return lName;
    }

    public void setLName(String lName) {
        this.lName = lName;
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

    public Account getAccountID() {
        return accountID;
    }

    public void setAccountID(Account accountID) {
        this.accountID = accountID;
    }

	@Override
	public String toString() {
		return "Customer [custId=" + custId + ", fName=" + fName + ", lName=" + lName + ", street=" + street
				+ ", stateLoc=" + stateLoc + ", zip=" + zip + ", phone=" + phone + ", accountID=" + accountID + "]";
	}

   
}
