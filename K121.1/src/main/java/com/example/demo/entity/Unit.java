package com.example.demo.entity;

public class Unit {
	private String unit;
	private int unitOrder;
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public int getUnitOrder() {
		return unitOrder;
	}
	public void setUnitOrder(int unitOrder) {
		this.unitOrder = unitOrder;
	}
	@Override
	public String toString() {
		return "Unit [unit=" + unit + ", unitOrder=" + unitOrder + "]";
	}
	
}
