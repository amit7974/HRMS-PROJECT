package com.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Leave_List {
	private String leave_type;
	private String status;
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	private Date applied_date;
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	private Date from_date;
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	private Date to_date;
	
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	private Date approved_date;
	private String applied_by;
	private int leave_application_id;
	private String approver2;
	private String approver1;
	private String user_name;
	private String first_name;
	private String last_name;
	private int no_of_days;
	private String approved_by;
	
	public String getLeave_type() {
		return leave_type;
	}
	public void setLeave_type(String leave_type) {
		this.leave_type = leave_type;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getApplied_date() {
		return applied_date;
	}
	public void setApplied_date(Date applied_date) {
		this.applied_date = applied_date;
	}
	public Date getFrom_date() {
		return from_date;
	}
	public void setFrom_date(Date from_date) {
		this.from_date = from_date;
	}
	public Date getTo_date() {
		return to_date;
	}
	public void setTo_date(Date to_date) {
		this.to_date = to_date;
	}
	public String getApplied_by() {
		return applied_by;
	}
	public void setApplied_by(String applied_by) {
		this.applied_by = applied_by;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getFirst_name() {
		return first_name;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public String getLast_name() {
		return last_name;
	}
	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}
	public int getLeave_application_id() {
		return leave_application_id;
	}
	public void setLeave_application_id(int leave_application_id) {
		this.leave_application_id = leave_application_id;
	}
	public int getNo_of_days() {
		return no_of_days;
	}
	public void setNo_of_days(int no_of_days) {
		this.no_of_days = no_of_days;
	}
	public String getApprover2() {
		return approver2;
	}
	public void setApprover2(String approver2) {
		this.approver2 = approver2;
	}
	public String getApprover1() {
		return approver1;
	}
	public void setApprover1(String approver1) {
		this.approver1 = approver1;
	}
	public Date getApproved_date() {
		return approved_date;
	}
	public void setApproved_date(Date approved_date) {
		this.approved_date = approved_date;
	}
	public String getApproved_by() {
		return approved_by;
	}
	public void setApproved_by(String approved_by) {
		this.approved_by = approved_by;
	}

}
