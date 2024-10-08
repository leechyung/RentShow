package my.model;

import java.util.List;

public class NboardListView {
	
	private int nboardTotalCount;
	private int currentPageNumber;
	private List<Nboard> nboardList;
	private int pageTotalCount;
	private int nboardCountPerPage;
	
	
	public NboardListView(int nboardTotalCount, int currentPageNumber, List<Nboard> nboardList,
			int nboardCountPerPage) {
		super();
		this.nboardTotalCount = nboardTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.nboardList = nboardList;
		this.nboardCountPerPage = nboardCountPerPage;
		calculatePageTotalCount(); //객체 생성시 메소드 콜해서 pagetotalcount 값 할당
	}
	
	private void calculatePageTotalCount() {
		if (nboardTotalCount == 0) {
			pageTotalCount = 0;
		} else {
			pageTotalCount = nboardTotalCount / nboardCountPerPage;
			if (nboardTotalCount % nboardCountPerPage > 0) {
				pageTotalCount++;
			}
		}
	}



	public int getNboardTotalCount() {
		return nboardTotalCount;
	}


	public void setNboardTotalCount(int nboardTotalCount) {
		this.nboardTotalCount = nboardTotalCount;
	}


	public int getCurrentPageNumber() {
		return currentPageNumber;
	}


	public void setCurrentPageNumber(int currentPageNumber) {
		this.currentPageNumber = currentPageNumber;
	}


	public List<Nboard> getNboardList() {
		return nboardList;
	}


	public void setNboardList(List<Nboard> nboardList) {
		this.nboardList = nboardList;
	}


	public int getPageTotalCount() {
		return pageTotalCount;
	}


	public void setPageTotalCount(int pageTotalCount) {
		this.pageTotalCount = pageTotalCount;
	}


	public int getNboardCountPerPage() {
		return nboardCountPerPage;
	}


	public void setNboardCountPerPage(int nboardCountPerPage) {
		this.nboardCountPerPage = nboardCountPerPage;
	}

}
