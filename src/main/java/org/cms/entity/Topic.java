package org.cms.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.ForeignKey;

/**
 * 文章
 * @author a
 *
 */
@Entity
@Table(name = "t_topic")
public class Topic {

	/**
	 * 主键
	 */
	@Id
	@GeneratedValue
	private Integer id;
	/**
	 * 标题
	 */
	private String title;
	/**
	 * 内容
	 */
	private String Content;
	/**
	 * 创建时间
	 */
	private Date createDate;
	/**
	 * 对应的栏目
	 */
	@ManyToOne
	@JoinColumn(name = "cid")
	@ForeignKey(name = "none")
	private Channel channel;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return Content;
	}

	public void setContent(String content) {
		Content = content;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

}
