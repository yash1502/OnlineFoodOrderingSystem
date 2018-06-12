/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.math.BigDecimal;

public class Item {

	private Integer itemId;

	private String itemName;

	private BigDecimal price;

	private String description;

	private String category;

	private Restaurant restId;

	public Item() {
	}

	public Item(Integer itemId, String itemName, BigDecimal price, String description, String category,
			Restaurant restId) {
		super();
		this.itemId = itemId;
		this.itemName = itemName;
		this.price = price;
		this.description = description;
		this.category = category;
		this.restId = restId;
	}

	public Integer getItemId() {
		return itemId;
	}

	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Restaurant getRestId() {
		return restId;
	}

	public void setRestId(Restaurant restId) {
		this.restId = restId;
	}

	@Override
	public String toString() {
		return "Item [itemId=" + itemId + ", itemName=" + itemName + ", price=" + price + ", description=" + description
				+ ", category=" + category + ", restId=" + restId + "]";
	}

}
