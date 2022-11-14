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
	<h2 class="bg-secondary text-light" style="margin:0;">회원가입 </h2>
	<form action="MemberJoinProc.jsp" method="post">
		<table class="table table-hover table-dark table-striped-columns">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" size="40" placeholder="id를 입력하세요"></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type="password" name="pass1" size="40" placeholder="비밀번호는 영문과 숫자만 넣어주세요"></td>
			</tr>
			<tr>
				<td>패스워드확인</td>
				<td><input type="password" name="pass2" size="40"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="email" name="email" size="40"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="tel" name="tel" size="40"></td>
			</tr>
			<tr>
				<td>당신의 관심사</td>
				<td>
					<input type="checkbox" name="hobby" value="캠핑"/>캠핑&nbsp;&nbsp;
					<input type="checkbox" name="hobby" value="운동"/>운동&nbsp;&nbsp;
					<input type="checkbox" name="hobby" value="독서"/>독서&nbsp;&nbsp;
					<input type="checkbox" name="hobby" value="코딩"/>코딩&nbsp;&nbsp;
				</td>
			</tr>
			<tr>
				<td>당신의 직업은</td>
				<td>
					<select name = "job">
						<option value="교사">교사</option>
						<option value="판사">판사</option>
						<option value="의사">의사</option>
						<option value="기술사">기술사</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>당신의 연령</td>
				<td>
					<input type="radio" name="age" value="10"/>10대&nbsp;&nbsp;
					<input type="radio" name="age" value="20"/>20대&nbsp;&nbsp;
					<input type="radio" name="age" value="30"/>30대&nbsp;&nbsp;
					<input type="radio" name="age" value="40"/>40대&nbsp;&nbsp;
				</td>
			</tr>
			<tr>
				<td>하고싶은말</td>
				<td>
					<textarea name="info"></textarea>
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="회원가입"/>
					<input type="reset" value="취소">
				<td>
			</tr>
		</table>
	</form>
</body>
</html>