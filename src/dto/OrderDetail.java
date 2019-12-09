package dto;

public class OrderDetail {
	int orderNO;
	int orderDetailNO;
	int productCD;
	String orderState;
	
	public OrderDetail() {
		this(0,0,0,"");
	}
	
	

	


	public OrderDetail(int orderNO, int orderDetailNO, int productCD, String orderState) {
		super();
		this.orderNO = orderNO;
		this.orderDetailNO = orderDetailNO;
		this.productCD = productCD;
		this.orderState = orderState;
	}






	public int getOrderNO() {
		return orderNO;
	}

	public void setOrderNO(int orderNO) {
		this.orderNO = orderNO;
	}

	public int getOrderDetailNO() {
		return orderDetailNO;
	}

	public void setOrderDetailNO(int orderDetailNO) {
		this.orderDetailNO = orderDetailNO;
	}

	public int getProductCD() {
		return productCD;
	}

	public void setProductCD(int productCD) {
		this.productCD = productCD;
	}
	
	
	public String getOrderState() {
		return orderState;
	}

	public void setOrderState(String orderState) {
		this.orderState = orderState;
	}






	@Override
	public String toString() {
		return "OrderDetail [orderNO=" + orderNO + ", orderDetailNO=" + orderDetailNO + ", productCD=" + productCD
				+ "]";
	}
	
	
	
}
