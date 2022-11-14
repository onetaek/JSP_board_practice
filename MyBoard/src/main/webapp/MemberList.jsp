<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<!-- 1.데이터 베이스에서 모든회원의 정보를 가져옴 -->
	<!-- 2.table태그를 이용하여 화면에 회원들의 정보를 출력 -->
<%
	MemberDAO mdao = new MemberDAO();
	/*
	회원들의 정보가 얼마나 저장되어있는지 모르기에 가변길이인 Vector를 이용하여 데이터를 저장해줌
	Vector는 타입을 지정해주지 않으면 object로 들어간다. MemberBean을 object에 넣을 때는 상위요소에 하위요소를
	넣는 것이기때문에 문제가 생기지 않는다. 하지만 꺼낼때는 캐스팅을 해줘야하는 문제가 생기기때문에 처음부터
	MemberBean타입으로 지정해 주는 것이다.
	*/
	Vector<MemberBean> vec = mdao.allSelectMember();
%>	
	<h2 class="bg-secondary text-light" style="margin:0;">모든 회원 보기</h2>
	<table class="table table-hover table-dark table-striped-columns">
		<tr>
			<th>아이디</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>취미</th>
		</tr>
		<%
			for(int i = 0 ; i < vec.size() ; i++){
				MemberBean bean = vec.get(i);//벡터에 담긴 빈클래스를 하나씩 추출
		%>		
		<tr>
			<td><a href="MemberInfo.jsp?id=<%=bean.getId()%>"><%= bean.getId() %></a></td>	
			<td><%= bean.getEmail() %></td>
			<td><%= bean.getTel() %></td>
			<td><%= bean.getHobby() %></td>
		</tr>
		<%
			}
		%>
		
	</table>
</body>
</html>