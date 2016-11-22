<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>

<head>

<title>TWCN —— 推特中国</title>
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="css/twitter_index.css" />
<link rel="stylesheet" href="css/bundle-twitter.css" />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="css/twitter_core.bundle.css">
<link rel="stylesheet" href="css/twitter_more_1.bundle.css">
<link rel="stylesheet" href="css/twitter_more_2.bundle.css">
<link rel="stylesheet" href="js/validate/validationEngine.jquery.css">
<link rel="stylesheet" href="js/respons/slide.css">
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript"
	src="js/validate/jquery.validationEngine.min.js"></script>
<script type="text/javascript"
	src="js/validate/jquery.validationEngine-zh_CN.js"></script>
<script type="text/javascript" src="js/respons/responsiveslides.min.js"></script>
<script type="text/javascript">
	$(function() {
		//点击注册表单时，关闭登录验证frontpage-signup-form
		$(".zuce").focus(function(){
			
			$("#login").validationEngine(
					'detach');
		$('#frontpage-signup-form')
				.validationEngine(
						'attach',
						{
							addPromptClass : 'formError-noArrow formError-small formError-white',
							autoHidePrompt : "true",
							autoHideDelay : 3000
						});
		});
		//点击登录表单时，开启登录验证,关闭注册验证
		$('.denglu').focus(function(){

			$('#login')
				.validationEngine(
						'attach',
						{
							addPromptClass : 'formError-noArrow formError-small formError-white',
							autoHidePrompt : "true",
							autoHideDelay : 2000
						});
			$("#frontpage-signup-form").validationEngine(
			'detach');
			
		});
		//启用图片轮播	
		$("#slider4").responsiveSlides();
		
	});
</script>
</head>
<style>
	.front-image {
		display: block;
	}
	h5,#fff{
		display:inline-block;
	}
	h5 {
		color:red;
		content: "";
	}
</style>
<body
	class="three-col logged-out ms-windows asian zh-cn front-page-photo-set front-page"
	data-fouc-class-names="swift-loading" dir="ltr">

	<div id="doc">
		<div class="topbar js-topbar">
			<div class="global-nav global-nav--newLoggedOut"
				data-section-term="top_nav">
				<div class="global-nav-inner">
					<div class="container">
						<ul class="nav js-global-actions" role="navigation"
							id="global-actions">
							<li id="global-nav-home" class="home" data-global-action="home">
								<a class="js-nav js-tooltip js-dynamic-tooltip"
								data-placement="bottom" href="/"
								data-component-context="home_nav" data-nav="home"
								data-original-title=""> <span
									class="Icon Icon--bird Icon--large"></span> <span class="text">主页</span>
							</a>
							</li>
							<li id="global-nav-about" class="about"
								data-global-action="about"><a
								class="js-tooltip js-dynamic-tooltip" data-placement="bottom"
								href="javascript:void(0);" target="_blank"
								data-component-context="about_nav" data-nav="about"> <span
									class="text">关于</span>
							</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div id="page-outer">
			<div id="page-container" class="AppContent  wrapper-front">
				<div class="front-container front-container-full-signup"
					id="front-container">
					<div class="front-bg">
						<ul class="rslides" id="slider4">
							<li><img src="img/littledog.jpg" class="front-image" alt=""></li>
							<li><img class="front-image" src="img/usgreatagain.jpg" alt=""></li>
							<li><img class="front-image" src="img/bg1.jpg" alt=""></li>
						</ul>					
					</div>
						<!-- <img class="front-image" src="img/bg1.jpg" alt=""
							style="display: block;"> -->
					
					<div class="front-card">
						<div class="front-welcome">
							<div class="front-welcome-text">
								<h1>欢迎使用推特中国。</h1>
								<p>联系你的好友和更多精彩。获取你感兴趣的实时更新。并通过每个视角观看事件实时呈现。</p>
							</div>
						</div>
						<div class="front-signin js-front-signin">
							
							
							<!-- 登录 start-->
							<form action="usersAction!login.action" class="t1-form signin"
								id="login" method="post">
								<div class="username field">
									<input type="text" id="signin-email"
										class="validate[required,custom[onlyLetterNumber]] text-input email-input denglu"
										name="users.username" autocomplete="username"
										placeholder="手机、邮件地址或用户名">
								</div>
								<table class="flex-table password-signin">
									<tbody>
										<tr>
											<td class="flex-table-primary">
												<div class="password flex-table-form">
													<input type="password" id="signin-password"
														class="validate[required] text-input flex-table-input denglu"
														name="users.password" placeholder="密码"
														autocomplete="current-password">
												</div>
											</td>
											<td class="flex-table-secondary">
												<button type="submit"
													class="submit btn primary-btn flex-table-btn js-submit">登录</button>
											</td>
										</tr>
									</tbody>
								</table>
								<div class="remember-forgot">
									<label class="t1-label remember"><input type="checkbox"
										value="1" name="remember_me" checked="checked"><span>记住我</span></label>
									<span class="separator">·</span> <a class="forgot"
										href="https://twitter.com/account/begin_password_reset">忘记密码?</a>
										<span class="colorful">${msg }</span>
								</div>
							</form>
							<!-- 登录 end -->
							
							
						</div>
						<div class="front-signup js-front-signup">
							<h2 id="fff">
								<strong>新来 TWCN?</strong> 注册
							</h2>
							<h5 class="colorful">
								${msg }
							</h5>
							
							<!-- 注册  start-->
							<form action="signupAction!signup.action" class="t1-form signup"
								id="frontpage-signup-form" method="post">
								<div class="field">
									<input type="text" class="validate[required,custom[onlyLetterNumber],minSize[3],maxSize[30]] text-input zuce" autocomplete="off"
										name="users.username" maxlength="20" placeholder="全名">
								</div>
								<div class="field">
									<input type="text" class="validate[required,custom[email]] text-input email-input zuce"
										autocomplete="off" name="users.email" placeholder="邮件地址">
								</div>
								<div class="field">
									<input type="password" class="validate[required,custom[onlyLetterNumber],minSize[3],maxSize[25]] text-input zuce"
										name="users.password" placeholder="密码">
								</div>
								<button type="submit" class="btn signup-btn u-floatRight">注册
									TWCN</button>
							</form>
							<!-- 注册  end-->
							
							
						</div>
					</div>
					<div class="footer inline-list">
						<ul>
							<li><a href="javascript:void(0);">关于</a><span
								class="dot divider"> ·</span></li>
							<li><a href="javascript:void(0);">帮助</a><span
								class="dot divider"> ·</span></li>
							<li><a href="javascript:void(0);">博客</a><span
								class="dot divider"> ·</span></li>
							<li><span class="copyright">© 2016 TWCN</span></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
	$(function(){
		//当点击注册或者登录时候报错文字切换颜色
		$("button[type=submit]").click(function(){
			var rgb="rgb(";
			for ( var int = 0; int < 3; int++) {
				rgb+=parseInt(Math.random()*256);
				if(int<2)
					rgb+=",";
			} 
			rgb+=")";
			$(".colorful").css("color",rgb);
		});
	});
</script>
</body>

</html>