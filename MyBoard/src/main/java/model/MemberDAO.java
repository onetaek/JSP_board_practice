package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


//데이터 베이스에 연결하고 select, insert,update,delete작업을 실행해주는 클래스입니다.
public class MemberDAO {
	
	//데이터 베이스에 접속하는 소스를 작성
//	String url="jdbc:mariadb://localhost:3306/myboard";//접속 url
//	String driver = "org.mariadb.jdbc.Driver";
//	String id = "root";//접속아이디
//	String pwd = "dpdlvldzm419!";
	Connection con;//데이터베이스에 접근할수있도록 설정
	PreparedStatement pstmt; //데이터베이스에서 쿼리를 실행시켜주는 객체
	ResultSet rs; //데이터베이스의 테이블의 결과를 리턴받아 자바에 저장해주는 객체
	
	//데이터 베이스에 접근할수 있다록 도와주는 메소드
	public void getCon() {
		
		//커넥션풀을 이용하여 데이터 베이스에 접근
		try {
			//외부에서 데이터를 읽어드려야 하기에
			Context initctx = new InitialContext();
			//톰캣 서버에 정보를담아 놓은 곳으로 이동
			Context envctx = (Context)initctx.lookup("java:comp/env");
			//데이터 소스 객체를 선언
			DataSource ds = (DataSource) envctx.lookup("jdbc/pool");
			//데이터 소스를 기준으로 커넥션을 연결해주시오
			con = ds.getConnection();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
//		try {
//			//1.해당 데이터 베이스를 사용한다고 선언
//			Class.forName(driver);
//			//2.해당 데이터 베이스에 접속
//			con = DriverManager.getConnection(url,id,pwd);
//		} catch (Exception e) {
//			// TODO: handle exception
//		}
	}
	
	//데이터 베이스에 한사람의 회원 정보를 저장해주는 메소드
	public void insertMember(MemberBean mbean) {
		try{
			getCon();
			//3. 접속후 쿼리준비하여
			String sql = "INSERT INTO MEMBER VALUES(?,?,?,?,?,?,?,?)";
			//쿼리를 사용하도록 설정
			PreparedStatement pstmt = con.prepareStatement(sql);//jsp���� ������ ����ϵ��� ����
			//?에 맞게 데이터를 맵핑
			pstmt.setString(1, mbean.getId());
			pstmt.setString(2, mbean.getPass1());
			pstmt.setString(3, mbean.getEmail());
			pstmt.setString(4, mbean.getTel());
			pstmt.setString(5, mbean.getHobby());
			pstmt.setString(6, mbean.getJob());
			pstmt.setString(7, mbean.getAge());
			pstmt.setString(8, mbean.getInfo());
			//4.데이터에이스에서 쿼리를 실행하시오
			pstmt.executeUpdate();//insert,update,delete시 사용하는 메소드
			//5.자원 반납
			con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
	}
	
	//모든회원의 정보를 리턴해주는 메소드 호출
	public Vector<MemberBean> allSelectMember() {
		//가변길이로 데이터를 저장
		Vector<MemberBean> v = new Vector<>();
		
		//무조건 데이터 베이스는 예외처리를 반드시 해야 합니다.
		try {
			//커넥션 연결
			getCon();
			//쿼리 준비
			String sql = "select * from member";
			//쿼리를 실행시켜주는 객체 선언
			pstmt = con.prepareStatement(sql);
			//쿼리를실행 시킨 결과를 리턴해서 받아줌(데이터베이스의 검색된 결과를 자바객체에 저장)
			rs = pstmt.executeQuery();
			//반복문을 사용해서 rs에 저장된 데이터를 추출해 놓아야함
			while(rs.next()) {//저장된 데이터 만큼까지 반복문을 돌리겠다라는 뜻입니다.
				MemberBean bean = new MemberBean();//컬럼으로 나뉘어진 데이터를 빈클래스에 저장
				bean.setId(rs.getString(1));//1번째 열의 값을 가져온다는 의미
				bean.setPass1(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setTel(rs.getString(4));
				bean.setHobby(rs.getString(5));
				bean.setJob(rs.getString(6));
				bean.setAge(rs.getString(7));
				bean.setInfo(rs.getString(8));
				//패키징된 memberbean클래스를 벡터에 저장
				v.add(bean);//0번지부터 순서대로 데이터가 저장
			}
			//�ڿ� �ݳ�
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		//������� ���͸� ����
		return v;
		
	}
	
	//한사람에 대한 정보를 리턴하는 메소드 작성
	public MemberBean oneSelectMember(String id) {
		//한사람에 대한 정보만 리턴하기에 빈클래스 객체 생성
		MemberBean bean = new MemberBean();
		try {
			//커넥션연결
			getCon();
			String sql = "select * from member where id = ?";
			pstmt = con.prepareStatement(sql);
			//쿼리실행
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {//레코드가 있다면
				bean.setId(rs.getString(1));//1번째 컬럼의 값을 가지고온다는 뜻
				bean.setPass1(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setTel(rs.getString(4));
				bean.setHobby(rs.getString(5));
				bean.setJob(rs.getString(6));
				bean.setAge(rs.getString(7));
				bean.setInfo(rs.getString(8));
			}
			//자원반납
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		//리턴
		return bean;
	}
	
	//한회원의 패스워드를 리턴하는 메소드
	public String getPass(String id) {
		String pass="";
		try {
			getCon();
			//쿼리준비
			String sql = "select pass1 from member where id = ?";
			pstmt = con.prepareStatement(sql);
			//?에 값을 맵핑
			pstmt.setString(1, id);
			//쿼리실행
			rs = pstmt.executeQuery();
			if(rs.next()) {
				pass = rs.getString(1);
			}
			//자원반납
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return pass;
	}
	
	//한회원의 정보를 수정하는 메소드
	public void updateMember(MemberBean bean) {
		getCon();
		try {
			String sql = "update member set email =?,tel=? where id =?";
			//쿼리실행 객체 선언
			pstmt = con.prepareStatement(sql);
			//?에 값을 맵핑
			pstmt.setString(1, bean.getEmail());
			pstmt.setString(2, bean.getTel());
			pstmt.setString(3, bean.getId());
			pstmt.executeUpdate();
			//자원 반납
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	//한회원을 삭제하는 메소드
	public void deleteMember(String id) {
		getCon();
		try {
			String sql = "delete from member where id = ?";
			pstmt = con.prepareStatement(sql);
			//?에 값을 맵핑
			pstmt.setString(1, id);
			//쿼리실행
			pstmt.executeUpdate();
			//자원 반납
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
