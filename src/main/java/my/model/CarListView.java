package my.model;

import java.util.List;

public class CarListView {
	private int carTotalCount;
	private int currentPageNumber;
	private List<Car> carList;
	private int pageTotalCount;
	private int carCountPerPage;
	
	public CarListView(int carTotalCount, int currentPageNumber, List<Car> carList, int carCountPerPage) {
		super();
		this.carTotalCount = carTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.carList = carList;
		this.carCountPerPage = carCountPerPage;
		calculatePageTotalCount();
	}
	
	private void calculatePageTotalCount() {
		if (carTotalCount == 0) {
			pageTotalCount = 0;
		} else {
			pageTotalCount = carTotalCount / carCountPerPage;
			if (carTotalCount % carCountPerPage > 0) {
				pageTotalCount++;
			}
		}
	}

	public int getCarTotalCount() {
		return carTotalCount;
	}

	public void setCarTotalCount(int carTotalCount) {
		this.carTotalCount = carTotalCount;
	}

	public int getCurrentPageNumber() {
		return currentPageNumber;
	}

	public void setCurrentPageNumber(int currentPageNumber) {
		this.currentPageNumber = currentPageNumber;
	}

	public List<Car> getCarList() {
		return carList;
	}

	public void setCarList(List<Car> carList) {
		this.carList = carList;
	}

	public int getPageTotalCount() {
		return pageTotalCount;
	}

	public void setPageTotalCount(int pageTotalCount) {
		this.pageTotalCount = pageTotalCount;
	}

	public int getCarCountPerPage() {
		return carCountPerPage;
	}

	public void setCarCountPerPage(int carCountPerPage) {
		this.carCountPerPage = carCountPerPage;
	}
	
	

}
