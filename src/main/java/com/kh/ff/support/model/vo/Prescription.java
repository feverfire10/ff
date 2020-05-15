package com.kh.ff.support.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Prescription {
	private String prescripUserCode;
	private String prescripCode;
	private String prescripType;
	private String prescripName;
	private int prescripInsup;
	private int prescripGenep;
	private String prescripInsuOffice;
}
