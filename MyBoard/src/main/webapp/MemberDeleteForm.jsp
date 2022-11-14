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
	<h2 class="bg-secondary text-light" style="margin: 0;">회원 삭제 하기</h2>
	
		<table class="table table-hover table-dark table-striped-columns">
			<!-- form구조가 조금이상한건 button을 form태그 바깥에 빼줘야하기 때문임
			그런데 강사님도 처음에 안에 넣어도 되는줄알고 넣었다 당황하심 왜바깥에 빼줘야하는걸까? -->
			<form action="MemberDeleteProc.jsp" method="post">
			<tr>
				<td>아이디</td>
				<td><%=request.getParameter("id")%></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass1"/></td>
			</tr>
			<tr>
				<td>
					<!-- 수정폼에는 id말고 다른 값도 필요하지만 id만보내서 자바코드로 다른 값들을 db에서 가져올 것이다. --> 
					<input type="hidden" name="id" value="<%=request.getParameter("id")%>"/>
					<input type="submit" value="삭제하기" /></form>
					<button onclick="location.href='MemberList.jsp'">회원 전체 보기</button>
				</td>
			</tr>
		</table>
</body>
</html>