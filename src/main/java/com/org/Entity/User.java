package com.org.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Entity
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(nullable = false)
	private String name;
	@Column(nullable = false)
	private int age;
	@Column(nullable = false, unique = true)
	private long number;
	@Column(nullable = false, unique = true)
	private String email;
	@Column(nullable = false, unique = true)
	private String password;

}
