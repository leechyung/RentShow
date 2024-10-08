package my.model;

import java.util.Date;

public class Purchase {
	private int purchaseId;
	private String buyerId;
	private String name;
	private int phonenum;
	private String address;
	private int cid;
	private int price;	
	private Date sdate;
	private Date edate;
	
	public Purchase() {}

	public Purchase(String buyerId, String name, int phonenum, String address, int cid, int price, Date sdate, Date edate) {
		super();
		this.buyerId = buyerId;
		this.name = name;
		this.phonenum = phonenum;
		this.cid = cid;
		this.address = address;
		this.price = price;
		this.sdate = sdate;
		this.edate = edate;
	}

	public int getPurchaseId() {
		return purchaseId;
	}

	public void setPurchaseId(int purchaseId) {
		this.purchaseId = purchaseId;
	}

	public String getBuyerId() {
		return buyerId;
	}

	public void setBuyerId(String buyerId) {
		this.buyerId = buyerId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPhonenum() {
		return phonenum;
	}

	public void setPhonenum(int phonenum) {
		this.phonenum = phonenum;
	}
	
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getSdate() {
		return sdate;
	}

	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}

	public Date getEdate() {
		return edate;
	}

	public void setEdate(Date edate) {
		this.edate = edate;
	}
	
	
}


