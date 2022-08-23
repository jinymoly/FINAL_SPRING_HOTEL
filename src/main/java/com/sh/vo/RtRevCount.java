package com.sh.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString @Alias("RtRevCount")
public class RtRevCount {

	private int revCount;
	@JsonFormat(pattern = "yyyy-M-d", timezone = "Asia/Seoul")
	private Date countDate;
	private Dn dn;
	private String mealTime;
	private String seatType;
	
}
