<%@page import="model.MemberBean"%>
<%@page import="model.MemberDAO"%>
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
	String id = request.getParameter("id");

	MemberDAO mdao = new MemberDAO();
	MemberBean mbean = mdao.oneSelectMember(id);//해당하는 id의 회원정보를 리턴
	%>
	<h2 class="bg-secondary text-light" style="margin: 0;">회원 수정 하기</h2>
	
		<table class="table table-hover table-dark table-striped-columns">
			<!-- form구조가 조금이상한건 button을 form태그 바깥에 빼줘야하기 때문임
			그런데 강사님도 처음에 안에 넣어도 되는줄알고 넣었다 당황하심 왜바깥에 빼줘야하는걸까? -->
			<form action="MemberUpdateProc.jsp" method="post">
			<tr>
				<td>아이디</td>
				<td><%=mbean.getId()%></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="email" name="email" value="<%= mbean.getEmail() %>"/></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="tel" name ="tel" value="<%=mbean.getTel()%>"/></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass1"/></td>
			</tr>
			<tr>
				<td>
					<!-- 수정폼에는 id말고 다른 값도 필요하지만 id만보내서 자바코드로 다른 값들을 db에서 가져올 것이다. --> 
					<input type="hidden" name="id" value="<%=mbean.getId() %>"/>
					<input type="submit" value="회원 정보 수정" /></form>
					<button onclick="location.href='MemberList.jsp'">회원전체 보기</button>
				</td>
			</tr>
		</table>
	
</body>
</html>