package org.cms.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.ForeignKey;

/**
 * 栏目
 * 
 * @author a
 *
 */
@Entity
@Table(name = "t_channel")
public class Channel {
	/**
	 * 主键
	 */
	@Id
	@GeneratedValue
	private Integer id;
	/**
	 * 栏目名称
	 */
	private String name;
	/**
	 * 栏目的类型别名
	 */
	private String sn;
	/**
	 * 栏目排序
	 */
	private Integer orders;
	/**
	 * 对应的父栏目
	 */
	@ManyToOne
	@JoinColumn(name = "pid")
	@ForeignKey(name = "none")
	private Channel parent;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getOrders() {
		return orders;
	}

	public void setOrders(Integer orders) {
		this.orders = orders;
	}

	public Channel getParent() {
		return parent;
	}

	public void setParent(Channel parent) {
		this.parent = parent;
	}
}
