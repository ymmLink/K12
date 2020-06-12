package com.example.demo.before.controller.api;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;

import com.example.demo.dao.MDAO;
import com.example.demo.entity.GetCoinRecord;
import com.example.demo.utils.TimeUtil;

/**
 * 
 * @author ymm
 * 币商城
 *
 */
public class CoinController {
	@Autowired
	private MDAO mdao;
	public boolean addCoin(int uid,int type) {
		String today=TimeUtil.getStringShort();
		try {
			if(type==1) {//签到
				int conSign=0;
				if(mdao.getCoinRecord(uid,type,TimeUtil.getPreDay(new Date(), 1))!=null) {
					conSign++;
					if(mdao.getCoinRecord(uid,type,TimeUtil.getPreDay(new Date(), 2))!=null) {
						conSign++;
						if(mdao.getCoinRecord(uid,type,TimeUtil.getPreDay(new Date(), 3))!=null) {
							conSign++;
							if(mdao.getCoinRecord(uid,type,TimeUtil.getPreDay(new Date(), 4))!=null) {
								conSign++;
								if(mdao.getCoinRecord(uid,type,TimeUtil.getPreDay(new Date(), 5))!=null) {
									conSign++;
									if(mdao.getCoinRecord(uid,type,TimeUtil.getPreDay(new Date(), 6))!=null) {
										conSign++;
									}
								}
							}
						}
					}
				}
				if(conSign>=6) {//连续签到7天
					GetCoinRecord gcr=new GetCoinRecord();
					gcr.setType(type);
					gcr.setUid(uid);
					gcr.setNumber(40);
					gcr.setCreateDate(TimeUtil.getThisTime());
					int re= mdao.addGetCoinRecord(gcr);
					if(re>0) {
						mdao.addCoin(uid,40);
					}
				}else if(conSign>=2) {//3-6
					GetCoinRecord gcr=new GetCoinRecord();
					gcr.setType(type);
					gcr.setUid(uid);
					gcr.setNumber(30);
					gcr.setCreateDate(TimeUtil.getThisTime());
					int re= mdao.addGetCoinRecord(gcr);
					if(re>0) {
						mdao.addCoin(uid,40);
					}
				}else if(conSign>=1) {//2
					GetCoinRecord gcr=new GetCoinRecord();
					gcr.setType(type);
					gcr.setUid(uid);
					gcr.setNumber(25);
					gcr.setCreateDate(TimeUtil.getThisTime());
					int re= mdao.addGetCoinRecord(gcr);
					if(re>0) {
						mdao.addCoin(uid,40);
					}
				}else{
					GetCoinRecord gcr=new GetCoinRecord();
					gcr.setType(type);
					gcr.setUid(uid);
					gcr.setNumber(20);
					gcr.setCreateDate(TimeUtil.getThisTime());
					int re= mdao.addGetCoinRecord(gcr);
					if(re>0) {
						mdao.addCoin(uid,40);
					}
				}
			}else if(type==2) {
				
			}else if(type==3) {//被收藏
				int coinCount=mdao.getCoinCount(uid,type,today);
				if(coinCount<10) {
					GetCoinRecord gcr=new GetCoinRecord();
					gcr.setType(type);
					gcr.setUid(uid);
					gcr.setNumber(2);
					gcr.setCreateDate(TimeUtil.getThisTime());
					int re= mdao.addGetCoinRecord(gcr);
					if(re>0) {
						mdao.addCoin(uid,2);
					}
				}
			}else if(type==4) {//被点赞
				int coinCount=mdao.getCoinCount(uid,type,today);
				if(coinCount<30) {
					GetCoinRecord gcr=new GetCoinRecord();
					gcr.setType(type);
					gcr.setUid(uid);
					gcr.setNumber(1);
					gcr.setCreateDate(TimeUtil.getThisTime());
					int re= mdao.addGetCoinRecord(gcr);
					if(re>0) {
						mdao.addCoin(uid,1);
					}
				}
			}else if(type==5) {//被打印
				int coinCount=mdao.getCoinCount(uid,type,today);
				if(coinCount<150) {
					GetCoinRecord gcr=new GetCoinRecord();
					gcr.setType(type);
					gcr.setUid(uid);
					gcr.setNumber(3);
					gcr.setCreateDate(TimeUtil.getThisTime());
					int re= mdao.addGetCoinRecord(gcr);
					if(re>0) {
						mdao.addCoin(uid,3);
					}
				}
			}
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
}
