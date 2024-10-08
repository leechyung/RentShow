package my.model;

import java.util.Date;

public class Qboard {
	private int qboardId;
	private String qtitle;
	private String qcontent;
	private String quserId;
	private Date qdate;
	
	public Qboard() {}
	
	public Qboard(String qtitle, String qcontent, String quserId, Date qdate) {
		super();
		this.qtitle = qtitle;
		this.qcontent = qcontent;
		this.quserId = quserId;
		this.qdate = qdate;
	}

	public Qboard(int qboardId, String qtitle, String qcontent, String quserId, Date qdate) {
		super();
		this.qboardId = qboardId;
		this.qtitle = qtitle;
		this.qcontent = qcontent;
		this.quserId = quserId;
		this.qdate = qdate;
	}//method overriding

	public int getQboardId() {
		return qboardId;
	}

	public void setQboardId(int qboardId) {
		this.qboardId = qboardId;
	}

	public String getQtitle() {
		return qtitle;
	}

	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}

	public String getQcontent() {
		return qcontent;
	}

	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}

	public String getQuserId() {
		return quserId;
	}

	public void setQuserId(String quserId) {
		this.quserId = quserId;
	}

	public Date getQdate() {
		return qdate;
	}

	public void setQdate(Date qdate) {
		this.qdate = qdate;
	}

	
	
	
}
