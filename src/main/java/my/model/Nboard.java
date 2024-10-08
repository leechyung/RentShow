package my.model;

import java.util.Date;

public class Nboard {
	private int nboardId;
	private String ntitle;
	private String ncontent;
	private String nuserId;
	private Date ndate;
	
	public Nboard() {}
	
	public Nboard(String ntitle, String ncontent, String nuserId, Date ndate) {
		super();
		this.ntitle = ntitle;
		this.ncontent = ncontent;
		this.nuserId = nuserId;
		this.ndate = ndate;
	}

	public Nboard(int nboardId, String ntitle, String ncontent, String nuserId, Date ndate) {
		super();
		this.nboardId = nboardId;
		this.ntitle = ntitle;
		this.ncontent = ncontent;
		this.nuserId = nuserId;
		this.ndate = ndate;
	}//method overriding

	public int getNboardId() {
		return nboardId;
	}

	public void setNboardId(int nboardId) {
		this.nboardId = nboardId;
	}

	public String getNtitle() {
		return ntitle;
	}

	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}

	public String getNcontent() {
		return ncontent;
	}

	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}

	public String getNuserId() {
		return nuserId;
	}

	public void setNuserId(String nuserId) {
		this.nuserId = nuserId;
	}

	public Date getNdate() {
		return ndate;
	}

	public void setNdate(Date ndate) {
		this.ndate = ndate;
	}

	
	
	
	
}
