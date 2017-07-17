package org.cms.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 关键字
 * @author a
 *
 */
@Entity
@Table(name = "t_keyword")
public class Keyword {

	/**
	 * 主键
	 */
	@Id
	@GeneratedValue
	private Integer id;
	/**
	 * 关键字
	 */
	private String word;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
	}

}
