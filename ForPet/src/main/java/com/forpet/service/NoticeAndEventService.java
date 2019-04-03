package com.forpet.service;

import java.util.List;

import com.forpet.model.vo.BoardSearch;
import com.forpet.model.vo.Notice;

public interface NoticeAndEventService {
	
	int noticeCount(BoardSearch bs);
	List<Notice> noticeList(BoardSearch bs);
	
}