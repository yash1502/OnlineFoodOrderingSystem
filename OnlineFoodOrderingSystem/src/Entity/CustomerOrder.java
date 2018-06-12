/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;


import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;



public class CustomerOrder {

   
    private Integer orderId;
   
    private Date orderDate;
   
    private BigDecimal totalCharge;
   
    private Customer custId;
 
    public CustomerOrder() {
    }

   

    public CustomerOrder(Integer orderId, Date orderDate, BigDecimal totalCharge) {
        this.orderId = orderId;
        this.orderDate = orderDate;
        this.totalCharge = totalCharge;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public BigDecimal getTotalCharge() {
        return totalCharge;
    }

    public void setTotalCharge(BigDecimal totalCharge) {
        this.totalCharge = totalCharge;
    }

    public Customer getCustId() {
        return custId;
    }

    public void setCustId(Customer custId) {
        this.custId = custId;
    }



	@Override
	public String toString() {
		return "CustomerOrder [orderId=" + orderId + ", orderDate=" + orderDate + ", totalCharge=" + totalCharge
				+ ", custId=" + custId + "]";
	}

   
    
}
