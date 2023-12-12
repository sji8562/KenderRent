package com.tenco.toyproject.dto.response;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

/* 
   {
	   "id":3202854061,
	   "connected_at":"2023-11-30T02:27:01Z",
	   "properties":{
	      "nickname":"전우진",
	      "profile_image":"http://k.kakaocdn.net/dn/cgQWUs/btsxghhturP/oU7IUbCB50C1WKfD8n9Fwk/img_640x640.jpg",
	      "thumbnail_image":"http://k.kakaocdn.net/dn/cgQWUs/btsxghhturP/oU7IUbCB50C1WKfD8n9Fwk/img_110x110.jpg"
	   },
	   "kakao_account":{
	      "profile_nickname_needs_agreement":false,
	      "profile_image_needs_agreement":false,
	      "profile":{
	         "nickname":"전우진",
	         "thumbnail_image_url":"http://k.kakaocdn.net/dn/cgQWUs/btsxghhturP/oU7IUbCB50C1WKfD8n9Fwk/img_110x110.jpg",
	         "profile_image_url":"http://k.kakaocdn.net/dn/cgQWUs/btsxghhturP/oU7IUbCB50C1WKfD8n9Fwk/img_640x640.jpg",
	         "is_default_image":false
	      }
	   }
	}
*/

@Data
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class NaverProfile {

	private Long id;
	private String connectedAt;
	private Properties properties;

	@Data
	public class Properties {
		private String nickname;
	}

}
