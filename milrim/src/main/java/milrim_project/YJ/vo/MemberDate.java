package milrim_project.YJ.vo;


import java.text.SimpleDateFormat;
import java.util.Date;

public class MemberDate {
	private String membershipID;
	private String id;
	private Date startDate;
	private Date endDate;
	public MemberDate() {
		super();
		// TODO Auto-generated constructor stub
	}
    public String getStartDate() {
        if (startDate != null) {
            SimpleDateFormat dateFormat = new SimpleDateFormat("MM-dd");
            return dateFormat.format(startDate);
        }
        return null;
    }
	@Override
	public String toString() {
	    return "MemberDate[membershipID=" + membershipID + ", id=" + id + ", startDate=" + startDate + ", endDate"+endDate+"]";
	}
	public MemberDate(String membershipID, String id, Date startDate, Date endDate) {
		super();
		this.membershipID = membershipID;
		this.id = id;
		this.startDate = startDate;
		this.endDate = endDate;
	}
    public String getEndDate() {
    	if (endDate != null) {
    		SimpleDateFormat dateFormat = new SimpleDateFormat("MM-dd");
    		return dateFormat.format(endDate);
    	}
    	return null;
    }
	public String getMembershipID() {
		return membershipID;
	}
	public void setMembershipID(String membershipID) {
		this.membershipID = membershipID;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
    
	
}