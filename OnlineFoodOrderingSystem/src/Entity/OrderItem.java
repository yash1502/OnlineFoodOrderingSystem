/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;


public class OrderItem  {

	
 
    private int quantity;
   
    private String customization;
  
    private CustomerOrder customerOrder;
   
    private Item item;

    public OrderItem() {
    }

	public OrderItem(int quantity, String customization, CustomerOrder customerOrder, Item item) {
		super();
		this.quantity = quantity;
		this.customization = customization;
		this.customerOrder = customerOrder;
		this.item = item;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getCustomization() {
		return customization;
	}

	public void setCustomization(String customization) {
		this.customization = customization;
	}

	public CustomerOrder getCustomerOrder() {
		return customerOrder;
	}

	public void setCustomerOrder(CustomerOrder customerOrder) {
		this.customerOrder = customerOrder;
	}

	public Item getItem() {
		return item;
	}

	public void setItem(Item item) {
		this.item = item;
	}

	@Override
	public String toString() {
		return "OrderItem [quantity=" + quantity + ", customization=" + customization + ", customerOrder="
				+ customerOrder + ", item=" + item + "]";
	}

  
    
}
