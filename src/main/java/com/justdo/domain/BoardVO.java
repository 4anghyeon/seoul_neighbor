package com.justdo.domain;

import lombok.Data;

@Data
public class BoardVO {
   private Long bno;
   private String userid;
   private String title;
   private String content;
   private String regdate;
   private String updatedate;
   private int reply_cnt;
   private String category;
   private int like_count;
   private int unlike_count;
   private String location;
   private int view_count;}