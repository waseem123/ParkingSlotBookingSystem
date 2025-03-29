package models;
public class Slot{
	int slotId;
	String slotName;
	String slotLocation;
	Boolean slotAvailability;
	Double slotPrice;
	String slotVehicleType;

	
	public Slot() {
		super();
	}

	public Slot(String slotName, String slotLocation, Boolean slotAvailability, Double slotPrice,
			String slotVehicleType) {
		super();
		this.slotName = slotName;
		this.slotLocation = slotLocation;
		this.slotAvailability = slotAvailability;
		this.slotPrice = slotPrice;
		this.slotVehicleType = slotVehicleType;
	}



	public Slot(int slotId, String slotName, String slotLocation, Boolean slotAvailability, Double slotPrice,
			String slotVehicleType) {
		super();
		this.slotId = slotId;
		this.slotName = slotName;
		this.slotLocation = slotLocation;
		this.slotAvailability = slotAvailability;
		this.slotPrice = slotPrice;
		this.slotVehicleType = slotVehicleType;
	}



	public int getSlotId() {
		return slotId;
	}


	public void setSlotId(int slotId) {
		this.slotId = slotId;
	}


	public String getSlotName() {
		return slotName;
	}


	public void setSlotName(String slotName) {
		this.slotName = slotName;
	}


	public String getSlotLocation() {
		return slotLocation;
	}


	public void setSlotLocation(String slotLocation) {
		this.slotLocation = slotLocation;
	}


	public Boolean getSlotAvailability() {
		return slotAvailability;
	}


	public void setSlotAvailability(Boolean slotAvailability) {
		this.slotAvailability = slotAvailability;
	}


	public Double getSlotPrice() {
		return slotPrice;
	}


	public void setSlotPrice(Double slotPrice) {
		this.slotPrice = slotPrice;
	}


	public String getSlotVehicleType() {
		return slotVehicleType;
	}


	public void setSlotVehicleType(String slotVehicleType) {
		this.slotVehicleType = slotVehicleType;
	}
}