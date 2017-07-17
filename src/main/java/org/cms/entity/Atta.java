package org.cms.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 附件类
 * 
 * @author a
 *
 */
@Entity
@Table(name = "t_atta")
public class Atta {

	@Id
	@GeneratedValue
	private Integer id;
	/**
	 * 附件名称
	 */
	private String name;
	/**
	 * 附件地址
	 */
	private String path;
	/**
	 * 附件类型名称
	 */
	private String typeName;
	/**
	 * 附件类型id
	 */
	private Integer typeId;

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

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

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public Integer getTypeId() {
		return typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

}
