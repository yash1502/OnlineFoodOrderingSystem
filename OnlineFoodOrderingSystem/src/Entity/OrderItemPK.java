/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;


public class OrderItemPK  {

  
    private int orderId;
   
   private int itemId;

    public OrderItemPK() {
    }

    public OrderItemPK(int orderId, int itemId) {
        this.orderId = orderId;
        this.itemId = itemId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

	@Override
	public String toString() {
		return "OrderItemPK [orderId=" + orderId + ", itemId=" + itemId + "]";
	}

  
    
}
