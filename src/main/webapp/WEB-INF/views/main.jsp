<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel=" shortcut icon" href="resources/images/logo2.png">
<link rel="icon" href="resources/images/logo2.png">
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>

	<jsp:include page="user/userLoginForm.jsp"/>
	
	<a id="kakao-link-btn" href="javascript:sendLink()">
  <img
    src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png"
  />
</a>
<script type="text/javascript">
  // input your appkey
  Kakao.init('69b0a9018799ca073e6a3156072740a5')
  function sendLink() {
    Kakao.Link.sendDefault({
      objectType: 'location',
      address: '서울시 강동구 천호동 315-14',
      addressTitle: '오시는길',
      content: {
        title: '진료접수처리 되었습니다.',
        description: '',
        imageUrl:
          '',
        link: {
          mobileWebUrl: 'https://developers.kakao.com',
          webUrl: 'https://developers.kakao.com',
        },
      },
      social: {
        likeCount: 0,
        commentCount: 0,
        sharedCount: 0,
      },
      buttons: [
        {
          title: '웹으로 보기',
          link: {
            mobileWebUrl: 'https://developers.kakao.com',
            webUrl: 'https://developers.kakao.com',
          },
        },
      ],
    })
  }
</script>
	
</body>

</html>





