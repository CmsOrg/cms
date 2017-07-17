package org.cms.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 角色
 * @author a
 *
 */
@Entity
@Table(name = "t_role")
public class Role {

	/**
	 * 主键
	 */
	@Id
	@GeneratedValue
	private Integer id;
	/**
	 * 名称
	 */
	private String name;

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

}
