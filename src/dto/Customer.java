package dto;

public class Customer {
	private String id;
	private String zipCode;
	private String address;
	private String phoneNumber;
	
	public Customer() {
		this("","","","");
	}

	public Customer(String id, String zipCode, String address, String phoneNumber) {
		super();
		this.id = id;
		this.zipCode = zipCode;
		this.address = address;
		this.phoneNumber = phoneNumber;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	@Override
	public String toString() {
		return "Customer [id=" + id + ", zipCode=" + zipCode + ", address=" + address + ", phoneNumber=" + phoneNumber
				+ "]";
	}
	

}
