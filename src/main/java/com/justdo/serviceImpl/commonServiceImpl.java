package com.justdo.serviceImpl;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Service;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.justdo.domain.BoardVO;
import com.justdo.domain.MemberVO;
import com.justdo.mapper.BoardMapper;
import com.justdo.mapper.commonMapper;
import com.justdo.service.commonService;

import lombok.AllArgsConstructor;


@AllArgsConstructor
@Service("commonService")
public class commonServiceImpl implements commonService {
	
	private commonMapper mapper;
	private BoardMapper boardMapper;
	
	//로그인
	@Override
	public MemberVO login(MemberVO vo) {
		return mapper.login(vo);
	}
	
	@Override
	public BoardVO read(int bno) {
		// TODO Auto-generated method stub
		return mapper.selectBoard(bno);
	}

	@Override
	public int likeBoard(int bno) {
		// TODO Auto-generated method stub
		boardMapper.like(bno);
	      return boardMapper.selectLikeCount(bno);
      }

	@Override
	public int unlikeBoard(int bno) {
		// TODO Auto-generated method stub
		boardMapper.unlike(bno);
	      return boardMapper.selectUnlikeCount(bno);
	}
	
	//회원가입 
	@Override
	public void join(MemberVO vo) {
		System.out.println("회원가입을 처러하기 위한 mapper를 호출합니다.");
		mapper.insertUser(vo);
		mapper.insertUserAuth(vo.getUserid());
	}

	//아이디 중복체크
	@Override
	public boolean isUniqueID(String userId) {
		if(mapper.checkID(userId) == 0) {
			System.out.println("중복된 아이디가 없습니다. 사용가능합니다.");
			return true;
		}
		System.out.println(" *Warning!!! 아이디가 중복되었습니다!!! ***********");
		return false;
	}

	//닉네임 중복체크
	@Override
	public boolean isUniqueNickName(String nickName) {
		if(mapper.checkNickName(nickName) == 0) {
			System.out.println("중복된 닉네임이 없습니다. 사용가능합니다.");
			return true;
		}
		System.out.println(" *Warning!!! 닉네임이 중복되었습니다!!! ***********");
		return false;
	}

	@Override
	public boolean isUniqueEmail(String email) {
		if(mapper.checkEmail(email) == 0) {
			System.out.println("중복된 이메일이 없습니다. 사용가능합니다.");
			return true;
		}
		System.out.println(" *Warning!!! 이메일이 중복되었습니다!!! ***********");
		return false;
	}

	@Override
	public int selectMessageReadCount(String userid) {
		return mapper.selectMessageReadCount(userid);
	}

	@Override
	public String getWeather() throws IOException {
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyMMdd");
		String today = dateFormat.format(date);
		String apiUrl = "http://apis.data.go.kr/1360000/VilageFcstInfoService/getVilageFcst";
		// 홈페이지에서 받은 키
		String serviceKey = "0a%2BsATcqfSi69BN%2Fz4gXhd%2BVbPgLPenFhWceGZGW5KImNgeyJ%2Bv27NhAOEqNXRHEvmBPLXzDaZ0sBTDHNplZIQ%3D%3D";
		String nx = "60";	//위도
		String ny = "125";	//경도

		String baseDate = today;	//조회하고싶은 날짜
		String baseTime = "1100";	//조회하고싶은 시간
		String type = "json";	//타입 xml, json 등등 ..
		
		
        StringBuilder urlBuilder = new StringBuilder(apiUrl);
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "="+serviceKey);
        urlBuilder.append("&" + URLEncoder.encode("nx","UTF-8") + "=" + URLEncoder.encode(nx, "UTF-8")); //경도
        urlBuilder.append("&" + URLEncoder.encode("ny","UTF-8") + "=" + URLEncoder.encode(ny, "UTF-8")); //위도
        urlBuilder.append("&" + URLEncoder.encode("base_date","UTF-8") + "=" + URLEncoder.encode(baseDate, "UTF-8")); /* 조회하고싶은 날짜*/
        urlBuilder.append("&" + URLEncoder.encode("base_time","UTF-8") + "=" + URLEncoder.encode(baseTime, "UTF-8")); /* 조회하고싶은 시간 AM 02시부터 3시간 단위 */
        urlBuilder.append("&" + URLEncoder.encode("dataType","UTF-8") + "=" + URLEncoder.encode(type, "UTF-8"));	/* 타입 */
        
        /*
         * GET방식으로 전송해서 파라미터 받아오기
         */
        URL url = new URL(urlBuilder.toString());
        //어떻게 넘어가는지 확인하고 싶으면 아래 출력분 주석 해제
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        //System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        String result= sb.toString();
        

        
        //jsonparser로 문자열 객체화
        JsonParser parser = new JsonParser();
        JsonObject obj = (JsonObject) parser.parse(result);
        
        JsonObject parseResponse = (JsonObject) obj.get("response");
        JsonObject parseBody = (JsonObject) parseResponse.get("body");
        JsonObject parseItems = (JsonObject) parseBody.get("items");
        
        //items에서 item 배열로 받아옴
        JsonArray parseItem = (JsonArray) parseItems.get("item");
        
        
        JsonObject weather = (JsonObject) parseItem.get(3);
        JsonObject temperature = (JsonObject) parseItem.get(4);
        
        int[] weatherData = {1,2};
        /*
         * POP	강수확률	 %
         * PTY	강수형태	코드값
         * R06	6시간 강수량	범주 (1 mm)
         * REH	습도	 %
         * S06	6시간 신적설	범주(1 cm)
         * SKY	하늘상태	코드값
         * T3H	3시간 기온	 ℃
         * TMN	아침 최저기온	 ℃
         * TMX	낮 최고기온	 ℃
         * UUU	풍속(동서성분)	 m/s
         * VVV	풍속(남북성분)	 m/s
         */
        
        return result;
	}
	
	@Override
	public boolean remove(int bno) {
		return boardMapper.delete(bno)==1;
	}

}
