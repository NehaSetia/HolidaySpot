package pkg;

public class Hotel {
	private String hotel_id;
	private String name;
	private String address;
	private String phone;
	private String website;
	
	public Hotel() {
		this.hotel_id = null;
		this.name = null;
		this.address = null;
		this.phone = null;
		this.website = null;
	}

	public String getHotel_id() {
		return hotel_id;
	}

	public void setHotel_id(String hotel_id) {
		this.hotel_id = hotel_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}
}
