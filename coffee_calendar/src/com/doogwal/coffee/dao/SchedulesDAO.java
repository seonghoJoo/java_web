package com.doogwal.coffee.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.doogwal.coffee.util.SqlSessionUtil;
import com.doogwal.coffee.vo.CrewCalendar;
import com.doogwal.coffee.vo.Gathering;
import com.doogwal.coffee.vo.Meeting;

public class SchedulesDAO {
	
	//정진하 20210117 2210 메인에서 업커밍 모임 가져오기 위해 작성함
		public static List<Gathering> selectUpcomingGatheringList() {
			SqlSession session = null;
			try {
				session = SqlSessionUtil.getSession();
				return session.selectList("schedules.selectUpcomingGatheringList");
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(session!=null) session.close();
			}//try~catch~finally end 
			return null;
		}//selectUpcomingGatheringList() end 
		
			//정진하 20210121 1500 일정캘린더에서 일별일정 가져오기 위해 작성함
			public static List<Meeting> selectDailySchedules(Map<String,Object> map) {
			SqlSession session = null;
				try {
						session = SqlSessionUtil.getSession();
						return session.selectList("schedules.selectDailySchedules",map);
			    } catch (Exception e) {
						e.printStackTrace();
				} finally {
						if(session!=null) session.close();
				}//try~catch~finally end 
				return null;
				}//selectDailySchedules() end 
			
				//정진하 20210123 1416 일정캘린더에서 모든일정 가져오기 위해 작성함
				public static List<Meeting> selectAllSchedules(int crewNo) {
					SqlSession session = null;
				try {
						session = SqlSessionUtil.getSession();
						return session.selectList("schedules.selectAllSchedules",crewNo);
			    } catch (Exception e) {
						e.printStackTrace();
				} finally {
						if(session!=null) session.close();
				}//try~catch~finally end 
				return null;
				}//selectAllSchedules() end 
		
				//정진하 20210121 1500 일정캘린더에서 월간일정 가져오기 위해 작성함
				public static List<Meeting> selectMonthlySchedules(int crewNo) {
					SqlSession session = null;
						try {
								session = SqlSessionUtil.getSession();
								return session.selectList("schedules.selectMonthlySchedules",crewNo);
					    } catch (Exception e) {
								e.printStackTrace();
						} finally {
								if(session!=null) session.close();
						}//try~catch~finally end 
						return null;
				}//selectDailySchedules() end 
				
				
				//정진하 20210124 1127 밋팅메인에서 테마 번호에 따라 밋팅 리스트 가져올기 위해 작성함
				public static List<Meeting> selectMeetingListByThemeNo(int themeNo) {
					SqlSession session = null;
						try {
								session = SqlSessionUtil.getSession();
								return session.selectList("schedules.selectMeetingListByThemeNo",themeNo);
					    } catch (Exception e) {
								e.printStackTrace();
						} finally {
								if(session!=null) session.close();
						}//try~catch~finally end 
						return null;
				}//selectDailySchedules() end 
				
				
				//정진하 20210121 1500 일정캘린더에서 일별일정 가져오기 위해 작성함
				public static List<Meeting> selectMeetingListByDateRange(Map<String,String> map) {
				SqlSession session = null;
					try {
							session = SqlSessionUtil.getSession();
							return session.selectList("schedules.selectMeetingListByDateRange",map);
				    } catch (Exception e) {
							e.printStackTrace();
					} finally {
							if(session!=null) session.close();
					}//try~catch~finally end 
					return null;
					}//selectDailySchedules() end 
				
				public static List<Meeting> selectMeetingListByUsingLocationInfo(String locationInfo) {
					SqlSession session = null;
						try {
								session = SqlSessionUtil.getSession();
								return session.selectList("schedules.selectMeetingListByUsingLocationInfo",locationInfo);
					    } catch (Exception e) {
								e.printStackTrace();
						} finally {
								if(session!=null) session.close();
						}//try~catch~finally end 
						return null;
						}//selectMeetingListByUsingLocationInfo() end 
				
				public static List<Meeting> selectMeetingListFromToday() {
					SqlSession session = null;
						try {
								session = SqlSessionUtil.getSession();
								return session.selectList("schedules.selectMeetingListFromToday");
					    } catch (Exception e) {
								e.printStackTrace();
						} finally {
								if(session!=null) session.close();
						}//try~catch~finally end 
						return null;
						}//selectMeetingListFromToday() end 

			}
