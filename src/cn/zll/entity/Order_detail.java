package cn.zll.entity;


import java.io.Serializable;
/**
 * ���������
 * @author win7
 *
 */
public class Order_detail implements Serializable{
	private int id;//����
	private int orderId;//��������
	private int productId;//��Ʒ����
	private int quantity;//����
	private double cost;//����
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public double getCost() {
		return cost;
	}
	public void setCost(double cost) {
		this.cost = cost;
	}
}