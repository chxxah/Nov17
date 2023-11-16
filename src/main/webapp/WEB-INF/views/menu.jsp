<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="./css/menu.css">


</head>
<body>
<body>
	<div class="menuContainer">
		<div class="menuSubContainer">


			<div class="ham-header">
				<i class="xi-close-thin xi-x ham-close"></i>
			</div>
			<div class="ham-container">

				<c:choose>
					<c:when
						test="${sessionScope.mgrade eq 5 || sessionScope.mgrade eq 6 }">
						<div class="ham-menu">
							<div class="ham-userImg">
								<img src="${userInfo.dimg}">
							</div>
							<div class="ham-userInfo">
								<div class="ham-userName">닥터 ${userInfo.mname}님</div>
								<div class="ham-userNickname">${userInfo.mnickname}</div>
								<div class="ham-userBirth">${userInfo.mbirth}</div>
							</div>
							<div class="ham-userEdit" onclick="noCheckLink('logout')">
								<i class="xi-log-out"></i>
							</div>
						</div>
						<div class="ham-menuButton-doctor">
							<div class="ham-buttonImg-doctor">
								<img style="width: 70%"
									src="https://cdn-icons-png.flaticon.com/512/5996/5996051.png">
							</div>
							<div class="ham-noUser">
								<button
									onclick="link('docReception/${sessionScope.mno}/${sessionScope.dno}')"
									style="width: 133px;">비대면 진료 관리</button>
							</div>
						</div>
					</c:when>
					<c:when
						test="${sessionScope.mgrade eq 7 || sessionScope.mgrade eq 8 }">
						<div class="ham-menu">
							<div class="ham-userImg">
								<img
									src="https://cdn-icons-png.flaticon.com/512/6024/6024190.png">
							</div>
							<div class="ham-userInfo">
								<div class="ham-userName">${userInfo.mname}님</div>
								<div class="ham-userNickname">${userInfo.mnickname}</div>
								<div class="ham-userBirth">${userInfo.mbirth}</div>
							</div>
							<div class="ham-userEdit" onclick="noCheckLink('logout')">
								<i class="xi-log-out"></i>
							</div>
						</div>
						<div class="ham-menuButton-doctor">
							<div class="ham-buttonSubItem-admin">
								<div class="ham-buttonImg-doctor">
									<img style="width: 90%"
										src="https://cdn-icons-png.flaticon.com/512/9005/9005933.png">
								</div>
								<div class="ham-admin-button">
									<button onclick="link('admin/newHospital')">병원 관리</button>
								</div>
							</div>
							<div class="ham-buttonSubItem-admin">
								<div class="ham-buttonImg-doctor">
									<img style="width: 90%"
										src="https://cdn-icons-png.flaticon.com/512/3280/3280979.png">
								</div>
								<div class="ham-admin-button">
									<button onclick="link('admin/member')">회원 관리</button>
								</div>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when
								test="${sessionScope.mid eq null || sessionScopte.mid eq ''}">
								<div class="ham-menu ham-noLogin">
									<div class="ham-userImg">
										<img src="/img/user.png">
									</div>
									<div class="ham-noUser">
										<button onclick="noCheckLink('login')">로그인 하기</button>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="ham-menu ham-noUser">
									<div class="ham-userImg">
										<img src="${userInfo.mimg}">
									</div>
									<div class="ham-userInfo">
										<div class="ham-userName">${userInfo.mname}님</div>
										<div class="ham-userNickname">${userInfo.mnickname}</div>
										<div class="ham-userBirth">${userInfo.mbirth}</div>
									</div>
									<div class="ham-userEdit" onclick="noCheckLink('logout')">
										<i class="xi-log-out"></i>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
						<div class="ham-menuButton">
							<div class="ham-buttonSubItem"
								onclick="link('hospitalLike/${sessionScope.mno}')">
								<div class="ham-buttonImg" style="background-color: #FDF5D7">
									<img
										src="https://cdn-icons-png.flaticon.com/512/616/616489.png">
								</div>
								<div class="ham-buttonText">즐겨찾기</div>
							</div>
							<div class="ham-buttonSubItem"
								onclick="link('healthRecord/${sessionScope.mno}')">
								<div class="ham-buttonImg" style="background-color: #fce4e4">
									<img
										src="https://cdn-icons-png.flaticon.com/512/881/881760.png ">
								</div>
								<div class="ham-buttonText">건강관리</div>
							</div>
							<div class="ham-buttonSubItem"
								onclick="link('myWriting/${sessionScope.mno}')">
								<div class="ham-buttonImg" style="background-color: #EDF3FD">
									<img
										src="https://cdn-icons-png.flaticon.com/512/2674/2674841.png">
								</div>
								<div class="ham-buttonText">나의 게시글</div>
							</div>
							<div class="ham-buttonSubItem"
								onclick="link('medicalHistory/${sessionScope.mno}')">
								<div class="ham-buttonImg" style="background-color: #FBF0E8">
									<img
										src="https://cdn-icons-png.flaticon.com/512/11411/11411453.png">
								</div>
								<div class="ham-buttonText">예약 내역</div>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="graySeperate"></div>


			<div>
				<!-- 나의 관리 -->
				<div class="ham-menuSection">
					<div class="ham-sectionTitle">
						<img src="https://cdn-icons-png.flaticon.com/512/1144/1144709.png"
							style="width: 28px; margin-right: 8px;">나의 관리
					</div>
					<div class="ham-sectionList">
						<div class="ham-listRow"
							onclick="link('myInfo/${sessionScope.mno}')">
							<div class="ham-listTitle">내 정보</div>
							<div class="xi-angle-right-min"></div>
						</div>
						<div class="ham-listRow"
							onclick="link('hospitalLike/${sessionScope.mno}')">
							<div class="ham-listTitle">즐겨찾는 병원</div>
							<div class="xi-angle-right-min"></div>
						</div>
						<div class="ham-listRow"
							onclick="link('healthRecord/${sessionScope.mno}')">
							<div class="ham-listTitle">건강 기록 내역</div>
							<div class="xi-angle-right-min"></div>
						</div>
						<div class="ham-listRow"
							onclick="link('myWriting/${sessionScope.mno}')">
							<div class="ham-listTitle">나의 게시글 내역</div>
							<div class="xi-angle-right-min"></div>
						</div>
					</div>
				</div>

				<!-- 진료 -->
				<div class="ham-menuSection">
					<div class="ham-sectionTitle">
						<img src="https://cdn-icons-png.flaticon.com/512/4006/4006511.png"
							style="width: 28px; margin-right: 8px;">진료
					</div>
					<div class="ham-sectionList">
						<div class="ham-listRow"
							onclick="link('medicalHistory/${sessionScope.mno}')">
							<div class="ham-listTitle">진료 내역</div>
							<div class="xi-angle-right-min"></div>
						</div>
						<div class="ham-listRow" onclick="noCheckLink('search')">
							<div class="ham-listTitle">병원 예약</div>
							<div class="xi-angle-right-min"></div>
						</div>
						<div class="ham-listRow" onclick="noCheckLink('telehealthSearch')">
							<div class="ham-listTitle">비대면 진료</div>
							<div class="xi-angle-right-min"></div>
						</div>
						<div class="ham-listRow" onclick="link('chatting')">
							<div class="ham-listTitle">실시간 상담</div>
							<div class="xi-angle-right-min"></div>
						</div>
						<div class="ham-listRow" onclick="noCheckLink('hospitalMap')">
							<div class="ham-listTitle">주변 병원</div>
							<div class="xi-angle-right-min"></div>
						</div>
					</div>
				</div>

				<!-- 기타 -->
				<div class="ham-menuSection">
					<div class="ham-sectionTitle">
						<img src="https://cdn-icons-png.flaticon.com/512/248/248924.png"
							style="width: 28px; margin-right: 8px;">기타
					</div>
					<div class="ham-sectionList">
						<div class="ham-listRow" onclick="noCheckLink('qnaBoard')">
							<div class="ham-listTitle">Q&A 게시판</div>
							<div class="xi-angle-right-min"></div>
						</div>
						<div class="ham-listRow" onclick="noCheckLink('hospitalOpen')">
							<div class="ham-listTitle">신규 병원 등록</div>
							<div class="xi-angle-right-min"></div>
						</div>
					</div>
				</div>
			</div>
		</div>


	</div>

</body>
