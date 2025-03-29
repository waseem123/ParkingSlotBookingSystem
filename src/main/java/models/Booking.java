package models;

public class Booking {
    private int bookingId;
    private int userId;
    private int slotId;
    private String vehicleNumber;
    private String bookingDate;
    private String bookingTime;
    private String parkTime;
    private String unparkTime;
    private String bookingStatus;
    private String slotName;
	public Booking() {
		super();
	}

	public Booking(int userId, int slotId, String vehicleNumber, String bookingDate, String bookingTime,
			String parkTime, String unparkTime, String bookingStatus) {
		super();
		this.userId = userId;
		this.slotId = slotId;
		this.vehicleNumber = vehicleNumber;
		this.bookingDate = bookingDate;
		this.bookingTime = bookingTime;
		this.parkTime = parkTime;
		this.unparkTime = unparkTime;
		this.bookingStatus = bookingStatus;
	}

	public Booking(int bookingId, int userId, int slotId, String vehicleNumber, String bookingDate, String bookingTime,
			String parkTime, String unparkTime, String bookingStatus) {
		super();
		this.bookingId = bookingId;
		this.userId = userId;
		this.slotId = slotId;
		this.vehicleNumber = vehicleNumber;
		this.bookingDate = bookingDate;
		this.bookingTime = bookingTime;
		this.parkTime = parkTime;
		this.unparkTime = unparkTime;
		this.bookingStatus = bookingStatus;
	}

	public Booking(int bookingId, int userId, int slotId, String vehicleNumber, String bookingDate, String bookingTime,
			String parkTime, String unparkTime, String bookingStatus, String slotName) {
		super();
		this.bookingId = bookingId;
		this.userId = userId;
		this.slotId = slotId;
		this.vehicleNumber = vehicleNumber;
		this.bookingDate = bookingDate;
		this.bookingTime = bookingTime;
		this.parkTime = parkTime;
		this.unparkTime = unparkTime;
		this.bookingStatus = bookingStatus;
		this.slotName = slotName;
	}

	public int getBookingId() {
		return bookingId;
	}

	public void setBookingId(int bookingId) {
		this.bookingId = bookingId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getSlotId() {
		return slotId;
	}

	public void setSlotId(int slotId) {
		this.slotId = slotId;
	}

	public String getVehicleNumber() {
		return vehicleNumber;
	}

	public void setVehicleNumber(String vehicleNumber) {
		this.vehicleNumber = vehicleNumber;
	}

	public String getBookingDate() {
		return bookingDate;
	}

	public void setBookingDate(String bookingDate) {
		this.bookingDate = bookingDate;
	}

	public String getBookingTime() {
		return bookingTime;
	}

	public void setBookingTime(String bookingTime) {
		this.bookingTime = bookingTime;
	}

	public String getParkTime() {
		return parkTime;
	}

	public void setParkTime(String parkTime) {
		this.parkTime = parkTime;
	}

	public String getUnparkTime() {
		return unparkTime;
	}

	public void setUnparkTime(String unparkTime) {
		this.unparkTime = unparkTime;
	}

	public String getBookingStatus() {
		return bookingStatus;
	}

	public void setBookingStatus(String bookingStatus) {
		this.bookingStatus = bookingStatus;
	}

	public String getSlotName() {
		return slotName;
	}

	public void setSlotName(String slotName) {
		this.slotName = slotName;
	}

	@Override
	public String toString() {
		return "Booking [bookingId=" + bookingId + ", userId=" + userId + ", slotId=" + slotId + ", vehicleNumber="
				+ vehicleNumber + ", bookingDate=" + bookingDate + ", bookingTime=" + bookingTime + ", parkTime="
				+ parkTime + ", unparkTime=" + unparkTime + ", bookingStatus=" + bookingStatus + "]";
	}	
}

