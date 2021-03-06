package cn.zll.entity;


import java.io.Serializable;
/**
 * 订单详情表
 * @author win7
 *
 */
public class Order_detail implements Serializable{
	private int id;//主键
	private int orderId;//订单主键
	private int productId;//商品主键
	private int quantity;//数量
	private double cost;//消费
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
