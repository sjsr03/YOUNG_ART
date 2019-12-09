package dto;

import java.util.Date;

public class OrderList {
	int orderNO;
	String customerID;
	String Address;
	String zipCD;
	String totalPrice;
	Date orderDate;
	String depositor;
	
	public OrderList() {
		this(0, "","","","",null,"");
		
	}
	
	
	public OrderList(int orderNO, String customerID, String address, String zipCD, String totalPrice, Date orderDate,
			 String depositor) {
		super();
		this.orderNO = orderNO;
		this.customerID = customerID;
		Address = address;
		this.zipCD = zipCD;
		this.totalPrice = totalPrice;
		this.orderDate = orderDate;
		this.depositor = depositor;
	}
	

	public int getOrderNO() {
		return orderNO;
	}


	public void setOrderNO(int orderNO) {
		this.orderNO = orderNO;
	}


	public String getCustomerID() {
		return customerID;
	}

	public void setCustomerID(String customerID) {
		this.customerID = customerID;
	}

	public String getAddress() {
		return Address;
	}

	public void setAddress(String address) {
		Address = address;
	}

	public String getZipCD() {
		return zipCD;
	}

	public void setZipCD(String zipCD) {
		this.zipCD = zipCD;
	}

	public String getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}


	public String getDepositor() {
		return depositor;
	}

	public void setDepositor(String depositor) {
		this.depositor = depositor;
	}



}
