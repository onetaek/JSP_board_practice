<%@page import="model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
%>	
	<jsp:useBean id = "mbean" class="model.MemberBean">
		<jsp:setProperty name="mbean" property="*"/>
		<!-- *쓴다고 모든 데이터를 사용할 필요없다. 사용하지 않는 데이터는 null로 있을 뿐이다. -->
	</jsp:useBean>
<%
	//MemberDeleteProc.jsp하면서 찾은건데 위에서 mbean객체로 받아서 getParameter로 굳이 따로 가져올 필요없음
	String id = request.getParameter("id");
	
	MemberDAO mdao = new MemberDAO();
	//스트립타입으로 저장되어있는 패스워드를 가져옴(데이터 베이스에서 가져온 pass값이 저장)
	String pass = mdao.getPass(id);
	
	//수정하기 위해서 작성한 패스워드값과 기존 데이터 베이스에서 가져온 패스워드값을 비교
	if(mbean.getPass1().equals(pass)){//기존 패스와 데이터베이스패스가 같다면 member테이블을 수정
		
		//MemberDao클래스의 회원수정 메소드를 호출
		mdao.updateMember(mbean);
		response.sendRedirect("MemberList.jsp");
		
	}else{
%>
	<script type="text/javascript">
		alert("패스워드가 맞지 않습니다. 다시 확인해주세요");
		history.go(-1);
	</script>
<%		
	}
%>
</body>
</html>