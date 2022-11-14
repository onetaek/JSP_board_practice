<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<!-- 1. memberlist에서 넘긴 id를 받아줌 -->
	<!-- 2. 데이터 베이스에서 한회원의 정보를 가져옴 -->
	<!-- 3. table태그를 이용하여 화면에 (한사람)회원의 정보를 출력 -->
<%
	String id = request.getParameter("id");	

	MemberDAO mdao = new MemberDAO();
	MemberBean mbean = mdao.oneSelectMember(id);//해당하는 id의 회원정보를 리턴
%>
	<h2 class="bg-secondary text-light" style="margin:0;">회원 정보 보기</h2>
	<table class="table table-hover table-dark table-striped-columns">
		<tr>
			<td>아이디</td>
			<td><%=mbean.getId() %></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><%=mbean.getEmail() %></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><%=mbean.getTel() %></td>
		</tr>
		<tr>
			<td>취미</td>
			<td><%=mbean.getHobby() %></td>
		</tr>
		<tr>
			<td>직업</td>
			<td><%=mbean.getJob() %></td>
		</tr>
		<tr>
			<td>나이</td>
			<td><%=mbean.getAge() %>대</td>
		</tr>
		<tr>
			<td>정보</td>
			<td><%=mbean.getInfo() %></td>
		</tr>
		<tr>
			<td>
				<!-- 수정폼에는 id말고 다른 값도 필요하지만 id만보내서 자바코드로 다른 값들을 db에서 가져올 것이다. -->
				<button onclick="location.href='MemberUpdateForm.jsp?id=<%=mbean.getId()%>'">수정</button>
				<button onclick="location.href='MemberDeleteForm.jsp?id=<%=mbean.getId()%>'">삭제</button>
				<button onclick="location.href='MemberList.jsp'">목록보기</button>
				<button onclick="location.href='MemberJoin.jsp'">회원가입</button>
			</td>
		</tr>
	</table>

</body>
</html>