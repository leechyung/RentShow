package my.model;

public class Car {
	private int carId;
	private String name;
	private int price;
	private String mainimage;
	private String catalogimage;
	private String detailimage;
	private String origin;
	private String oil;
	private String size;
	private int person;
	
	public Car() {}
	
	
	public Car(int carId, String name, int price, String mainimage, String catalogimage, String detailimage, String origin, String oil, String size, int person) {
		super();
		this.carId = carId;
		this.name = name;
		this.price = price;
		this.mainimage = mainimage;
		this.catalogimage = catalogimage;
		this.detailimage = detailimage;
		this.origin = origin;
		this.oil = oil;
		this.size = size;
		this.person = person;
	}


	public Car(String name, int price, String mainimage, String catalogimage, String detailimage, String origin, String oil, String size, int person) {
		super();
		this.name = name;
		this.price = price;
		this.mainimage = mainimage;
		this.catalogimage = catalogimage;
		this.detailimage = detailimage;
		this.origin = origin;
		this.oil = oil;
		this.size = size;
		this.person = person;
	}


	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getCarId() {
		return carId;
	}


	public void setCarId(int carId) {
		this.carId = carId;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getMainimage() {
		return mainimage;
	}


	public void setMainimage(String mainimage) {
		this.mainimage = mainimage;
	}


	public String getCatalogimage() {
		return catalogimage;
	}


	public void setCatalogimage(String catalogimage) {
		this.catalogimage = catalogimage;
	}


	public String getDetailimage() {
		return detailimage;
	}


	public void setDetailimage(String detailimage) {
		this.detailimage = detailimage;
	}


	public String getOrigin() {
		return origin;
	}


	public void setOrigin(String origin) {
		this.origin = origin;
	}


	public String getOil() {
		return oil;
	}


	public void setOil(String oil) {
		this.oil = oil;
	}


	public String getSize() {
		return size;
	}


	public void setSize(String size) {
		this.size = size;
	}


	public int getPerson() {
		return person;
	}


	public void setPerson(int person) {
		this.person = person;
	}
	
	
	
}


