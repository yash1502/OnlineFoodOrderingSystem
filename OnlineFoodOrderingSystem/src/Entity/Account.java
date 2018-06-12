/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;


public class Account  {

   
    private Integer accountID;
   
    private String email;
   
    private String password;
  
    private String acctType;

    
    public Account() {}
    
    
	public Account(Integer accountID, String email, String password, String acctType) {
		super();
		this.accountID = accountID;
		this.email = email;
		this.password = password;
		this.acctType = acctType;
	}


	public Integer getAccountID() {
		return accountID;
	}

	public void setAccountID(Integer accountID) {
		this.accountID = accountID;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAcctType() {
		return acctType;
	}

	public void setAcctType(String acctType) {
		this.acctType = acctType;
	}


	@Override
	public String toString() {
		return "Account [accountID=" + accountID + ", email=" + email + ", password=" + password + ", acctType="
				+ acctType + "]";
	}
 
   

    
    
}
