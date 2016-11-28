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
		<link rel="stylesheet" href="js/validate/validationEngine.jquery.css">
		<link rel="stylesheet" href="css/twitter_core.bundle.css">
		<link rel="stylesheet" href="css/twitter_more_1.bundle.css">
		<link rel="stylesheet" href="css/twitter_more_2.bundle.css">
		<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
		<script type="text/javascript" src="js/validate/jquery.validationEngine.min.js"></script>
		<script type="text/javascript" src="js/validate/jquery.validationEngine-zh_CN.js"></script>
		<script type="text/javascript" src="js/sendTwitter.js"></script>
		<script type="text/javascript">
		//初始化jquery validate
		$(function(){
			$("#user_screen_name").focus(function(){
				$("#account-form").validationEngine('attach',{
				addPromptClass : 'formError-noArrow formError-small formError-white',
				autoHidePrompt : "true",
				autoHideDelay : 3000,
			});
			$("#password-form").validationEngine("detach");	
			});
			$("#current_password").focus(function(){
				$("#password-form").validationEngine('attach',{
					addPromptClass : 'formError-noArrow formError-small formError-white',
					autoHidePrompt : "true",
					autoHideDelay : 3000,
				});
				$("#account-form").validationEngine("detach");	
				
			});
		});	
		
			
	</script>
	</head>
		<style>
			h5 {
				color:red;
			}
		</style>
	<body>

		<div class="global-nav" data-section-term="top_nav">
			<div class="global-nav-inner">
				<div class="container">
					<div role="navigation" style="display: inline-block;">
						<ul class="nav js-global-actions" id="global-actions">
							<li id="global-nav-home" class="home active new" data-global-action="home">
								<a class="js-nav js-tooltip js-dynamic-tooltip" data-placement="bottom" href="signupAction!homepage.action" data-component-context="home_nav" data-nav="home" data-original-title="">
									<span class="Icon Icon--home Icon--large"></span>
									<span class="text">主页</span>
								</a>
							</li>
							<li class="people notifications" data-global-action="connect">
								<a class="js-nav js-tooltip js-dynamic-tooltip" data-placement="bottom" href="/i/notifications" data-component-context="connect_nav" data-nav="connect" data-original-title="">
									<span class="Icon Icon--notifications Icon--large"></span>
									<span class="text">通知</span>
									<span class="count">
              <span class="count-inner">0</span>
									</span>
								</a>
							</li>
							<li class="dm-nav">
								<a role="button" href="#" class="js-tooltip js-dynamic-tooltip global-dm-nav" data-placement="bottom" data-original-title="">
									<span class="Icon Icon--dm Icon--large"></span>
									<span class="text">私信</span>
									<span class="dm-new"><span class="count-inner"></span></span>
								</a>
							</li>
						</ul>
					</div>
					<div class="pull-right" style="display: inline-block;">
						<div role="search">
							<form class="t1-form form-search js-search-form" action="/search" id="global-nav-search">
								<label class="visuallyhidden" for="search-query">搜索询问</label>
								<input class="search-input" type="text" id="search-query" placeholder="搜索 Twitter" name="q" autocomplete="off" spellcheck="false" aria-autocomplete="list" aria-expanded="false" aria-owns="typeahead-dropdown-1">
								<span class="search-icon js-search-action">
      <button type="submit" class="Icon Icon--search nav-search" tabindex="-1">
        <span class="visuallyhidden">搜索 Twitter</span>
								</button>
								</span>
							</form>
						</div>
						<ul class="nav right-actions">
							<li class="me dropdown session js-session" data-global-action="t1me" id="user-dropdown">
								<a href="/settings/account" class="btn js-tooltip settings dropdown-toggle js-dropdown-toggle" id="user-dropdown-toggle" data-placement="bottom" role="button" aria-haspopup="true" data-original-title="个人资料与账号"><img class="avatar size32" src="${users.avatar }" alt="Profile and settings" data-user-id="116652192"></a>
								<div class="dropdown-menu">
									<div class="dropdown-caret">
										<span class="caret-outer"></span>
										<span class="caret-inner"></span>
									</div>
									<ul>

										<li class="current-user" data-name="profile">

											<a href="/Rainsho" class="account-summary account-summary-small js-nav" data-nav="view_profile">
												<div class="content">
													<div class="account-group js-mini-current-user" data-user-id="116652192" data-screen-name="Rainsho"><b class="fullname">Rainsho</b><span class="screen-name hidden" dir="ltr">@Rainsho</span><small class="metadata">查看个人资料</small></div>
												</div>
											</a>

										</li>

										<li class="dropdown-divider"></li>

										<li>
											<a href="/settings/account" data-nav="settings" class="js-nav">设置</a>
										</li>

										<li class="js-signout-button" id="signout-button" data-nav="logout">
											<button type="button" class="dropdown-link">登出</button>
											<form class="t1-form dropdown-link-form signout-form" id="signout-form" action="/logout" method="POST">
											</form>
										</li>
									</ul>
								</div>

							</li>
							<li role="complementary" aria-labelledby="global-new-tweet-button" class="topbar-tweet-btn">
								<button id="global-new-tweet-button" type="button" class="js-global-new-tweet js-tooltip btn primary-btn tweet-btn js-dynamic-tooltip" data-placement="bottom" data-component-context="new_tweet_button" data-original-title="">
          <span class="Icon Icon--tweet Icon--large"></span>
          <span class="text">发推</span>
        </button>
							</li>
						</ul>
					</div>

				</div>
			</div>
		</div>

		<div id="page-outer">
			<div id="page-container" class="AppContent wrapper wrapper-settings">
				<div class="dashboard">
					<div class="DashboardProfileCard DashboardProfileCard--withoutStats module">

						<a class="DashboardProfileCard-bg u-bgUserColor u-block" href="/RainshoTwcn" tabindex="-1" aria-hidden="true">
						</a>

						<div class="DashboardProfileCard-content">

							<a class="DashboardProfileCard-avatarLink u-inlineBlock" href="/RainshoTwcn" title="twcn" tabindex="-1" aria-hidden="true">
								<img class="DashboardProfileCard-avatarImage js-action-profile-avatar" src="${users.avatar }" alt="">
							</a>

							<div class="DashboardProfileCard-userFields">
								<div class="DashboardProfileCard-name u-textTruncate">
									<a class="u-textInheritColor" href="/RainshoTwcn">${users.nickname }</a>
								</div>
								<span class="DashboardProfileCard-screenname u-inlineBlock u-dir" dir="ltr">
          <a class="DashboardProfileCard-screennameLink u-linkComplex u-linkClean" href="/RainshoTwcn">@<span class="u-linkComplex-target">${users.username }</span></a>
								</span>
							</div>

						</div>
					</div>

					<div id="settings_nav" role="navigation" class="module">
						<ul class="js-nav-links">
							<li class="active">
								<a class="list-link js-nav" href="/settings/account" data-nav="account">账号 <span class="Icon Icon--caretRight"></span></a>
							</li>

							<li class="">
								<a class="list-link js-nav" href="/settings/security" data-nav="security">安全与隐私 <span class="Icon Icon--caretRight"></span></a>
							</li>
							<li class="">
								<a class="list-link js-nav" href="/settings/password" data-nav="password">密码<span class="Icon Icon--caretRight"></span></a>
							</li>

							<li class="">
								<a class="list-link js-nav" href="/settings/payments" data-nav="payments">信用卡和配送<span class="Icon Icon--caretRight"></span></a>
							</li>
							<li class="">
								<a class="list-link js-nav" href="/settings/orders" data-nav="orders">订单历史<span class="Icon Icon--caretRight"></span></a>
							</li>

							<li class="">
								<a class="list-link js-nav" href="/settings/add_phone" data-nav="devices">移动设备 <span class="Icon Icon--caretRight"></span></a>
							</li>

							<li class="">
								<a class="list-link js-nav" href="/settings/notifications" data-nav="notifications">邮件通知 <span class="Icon Icon--caretRight"></span></a>
							</li>

							<li class="">
								<a class="list-link js-nav" href="/settings/notifications_timeline" data-nav="notifications_timeline">通知 <span class="Icon Icon--caretRight"></span></a>
							</li>

							<li class="">
								<a class="list-link js-nav" href="/settings/web_notifications" data-nav="web_notifications">网页通知 <span class="Icon Icon--caretRight"></span></a>
							</li>

							<li class="">
								<a class="list-link js-nav" href="/who_to_follow/import" data-nav="find_friends">查找好友 <span class="Icon Icon--caretRight"></span></a>
							</li>

							<li class="">
								<a class="list-link js-nav" href="/settings/muted_following" data-nav="muted_following">被隐藏的账号 <span class="Icon Icon--caretRight"></span></a>
							</li>

							<li class="">
								<a class="list-link js-nav" href="/settings/blocked" data-nav="blocked_page">你屏蔽的账号 <span class="Icon Icon--caretRight"></span></a>
							</li>

							<li class="">
								<a class="list-link js-nav" href="/settings/applications" data-nav="connections">应用<span class="Icon Icon--caretRight"></span></a>
							</li>

							<li class="">
								<a class="list-link" href="/settings/widgets" data-nav="widgets">小工具 <span class="Icon Icon--caretRight"></span></a>
							</li>

							<li id="user_data_dashboard_nav" class="">
								<a id="user_data_dashboard_nav_link" class="list-link js-nav" href="/settings/your_twitter_data" data-nav="user_data_dashboard">你的Twitter数据 <span class="Icon Icon--caretRight"></span></a>
							</li>

							<li class="">
								<a class="list-link js-nav" href="/settings/accessibility" data-nav="accessibility">无障碍 <span class="Icon Icon--caretRight"></span></a>
							</li>
						</ul>
					</div>
					<div class="Footer module roaming-module
            
            ">
						<div class="flex-module">
							<div class="flex-module-inner js-items-container">
								<ul class="u-cf">
									<li class="Footer-item Footer-copyright copyright">© 2016 Twitter</li>
									<li class="Footer-item">
										<a class="Footer-link" href="/about">关于</a>
									</li>
									<li class="Footer-item">
										<a class="Footer-link" href="//support.twitter.com">帮助</a>
									</li>
									<li class="Footer-item">
										<a class="Footer-link" href="/tos">条款</a>
									</li>
									<li class="Footer-item">
										<a class="Footer-link" href="/privacy">隐私</a>
									</li>
									<li class="Footer-item">
										<a class="Footer-link" href="//support.twitter.com/articles/20170514">Cookies</a>
									</li>
									<li class="Footer-item">
										<a class="Footer-link" href="//support.twitter.com/articles/20170451">广告信息</a>
									</li>
									<li class="Footer-item">
										<a class="Footer-link" href="//about.twitter.com/press/brand-assets">商标</a>
									</li>
									<li class="Footer-item">
										<a class="Footer-link" href="https://blog.twitter.com">博客</a>
									</li>
									<li class="Footer-item">
										<a class="Footer-link" href="http://status.twitter.com">状态</a>
									</li>
									<li class="Footer-item">
										<a class="Footer-link" href="https://about.twitter.com/products">应用</a>
									</li>
									<li class="Footer-item">
										<a class="Footer-link" href="https://about.twitter.com/careers">工作机会</a>
									</li>
									<li class="Footer-item">
										<a class="Footer-link" href="//ads.twitter.com/start?ref=gl-tw-tw-twitter-advertise">广告</a>
									</li>
									<li class="Footer-item">
										<a class="Footer-link" href="https://business.twitter.com">企业</a>
									</li>
									<li class="Footer-item">
										<a class="Footer-link" href="//media.twitter.com">媒体</a>
									</li>
									<li class="Footer-item">
										<a class="Footer-link" href="//dev.twitter.com">开发者</a>
									</li>
								</ul>
							</div>
						</div>
					</div>

				</div>
				<div id="user_data_dashboard_password_dialog" class="modal-container">
					<div class="close-modal-background-target"></div>
					<div class="modal modal-small draggable">
						<div class="modal-content">
							<button type="button" class="modal-btn modal-close js-close">
  <span class="Icon Icon--close Icon--medium">
    <span class="visuallyhidden">关闭</span>
  </span>
</button>

							<div class="modal-header">
								<h3 class="modal-title">确认密码</h3>
							</div>
							<div class="modal-body">
								<p>此网页含有个人信息。确认你的密码以继续。</p>
								<div class="input-wrapper password-wrapper">
									<input class="input-block" id="user_data_dashboard_auth_password" name="auth_password" type="password" placeholder="密码">
									<small>
            <a href="/account/access_password_reset" id="user_data_dashboard_forgot_password" class="js-static-forgot-password">忘记密码了?</a>
          </small>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn js-close" id="user_data_dashboard_cancel_password_button">取消</button>
								<button type="submit" id="user_data_dashboard_verify_password" class="btn primary-btn modal-submit">确认</button>
							</div>
						</div>
					</div>
				</div>

				<div role="main" aria-labelledby="content-main-heading" class="content-main">
					<div class="content-header">
						<div class="header-inner">
							<h2 id="content-main-heading">账号</h2>
							<p class="subheader">修改你的基本账号和语言设置。</p>
						</div>
					</div>
					<div class="content-inner no-stream-end">
						
						
						<!-- 第一个form表单   start -->
						<form id="account-form" class="t1-form form-horizontal requires-password" autocomplete="off" method="POST" action="form_unameEmail!unameEmail.action">
							<div id="settings-alert-box" class="alert hidden">
								<span id="settings-alert-close" class="icon close"></span>
							</div>

							<input type="hidden" value="PUT" name="_method">
							<input type="hidden" name="authenticity_token" value="7f78bfd71a1dc92872551b7633dbdac2c04d92c4">

							<input type="hidden" id="orig_uname" name="orig_uname" value="${users.nickname }">
							<input type="hidden" id="orig_email" name="orig_email" value="${users.email }">
							<input type="hidden" id="orig_uid" name="users.uid" value="${users.uid }">
							<div id="username_fieldset" class="control-group">
								<label for="user_screen_name" class="t1-label control-label">用户名</label>
								<div class="controls">
									<p id="username_notification" class="notification"></p>
									<input id="user_screen_name" class="required,validate[ajax[nickname]]" maxlength="15" name="users.nickname" type="text" value="${users.nickname }">
									<p class="notification">https://twitter.com/<span id="username_path">RainshoTwcn</span></p>
								</div>
							</div>

							<div id="email_fieldset" class="control-group">
								<label for="user_email" class="t1-label control-label">邮件地址</label>
								<div class="controls">
									<p id="email_notification" class="notification"></p>
									<input id="user_email" class="required,customed[email],validate[ajax[ajaxEmail]] email-input" name="users.email" type="text" value="${users.email }">
									<p>邮件地址不会公开显示。
										<a href="https://support.twitter.com/articles/15356" target="_blank">了解更多</a>。</p>
									<p></p>
								</div>
							</div>

							<hr>

							<div class="form-actions">
								<button id="settings_save" class="btn primary-btn" type="submit" >保存更改</button>
								<span class="spinner-small settings-save-spinner"></span>
							</div>

						</form>
						<!-- 第一个form表单   end -->
						
						
						
						
						
					</div>
				</div>

				<div role="main" aria-labelledby="content-main-heading" class="content-main">
					<div class="content-header">
						<div class="header-inner">
							<h2 id="content-main-heading">密码</h2>
							<p class="subheader">更改你的密码或找回当前密码。</p>
						</div>
					</div>
					<div class="content-inner no-stream-end">
					
					
					<!-- 更改登录密码  start-->
						<form class="t1-form form-horizontal" id="password-form" method="POST" action="form_pwd!pwd.action">
							<div id="settings-alert-box" class="alert hidden">
								<span id="settings-alert-close" class="icon close"></span>
							</div>
							<input type="hidden" value="${users.uid }" name="users.uid" >
							<input type="hidden" value="PUT" name="_method">
							<input type="hidden" name="authenticity_token" value="7f78bfd71a1dc92872551b7633dbdac2c04d92c4">
							<div class="control-group">
								<label for="current_password" class="t1-label control-label">当前密码</label>
								<div class="controls">
								<!-- 原密码 -->
									<input id="current_password" class="validate[required]" type="password" name="oldPwd">
									<p>
										<a href="/account/access_password_reset" id="forgot_password" class="js-static-forgot-password">忘记密码了?</a>
										<h5 >${twt_RltNumBean.pwdStatus }</h5>
									</p>
								</div>
							</div>
							<div id="password-match-pair">
								<div class="control-group">
									<label for="user_password" class="t1-label control-label">新密码</label>
									<div id="password_strength" class="controls">
										<input id="user_password" class="validate[required]"type="password" name="users.password">
										<small id="password_strength_feedback" class="help-inline help-error" style="display: none;"></small>
									</div>
								</div>
								<div class="control-group">
									<label for="user_password_confirmation" class="t1-label control-label">确认密码</label>
									<div class="controls">
										<input id="user_password_confirmation" class="validate[required,equals[user_password]]" type="password" name="user_password_confirmation">
										<small id="password_match" class="help-inline help-error" style="display: none;">密码不匹配</small>
									</div>
								</div>
							</div>

							<hr>
							<div class="form-actions">
								<button id="settings_save" class="btn primary-btn" type="submit" >保存更改</button>
								<span class="spinner-small settings-save-spinner"></span>
							</div>

						</form>
						<!-- 更改登录密码  end-->
						
						
						
						
					</div>
				</div>

			</div>
		</div>
		
	</body>
	<script type="text/javascript">
	$.validationEngineLanguage.allRules.nickname={
	  		url: "ajaxUsername!ajaxUsername.action",
			  extraData: "times="+Math.random(),
			  alertTextOk: '<strong style="color:#090;">可以使用√<strong>',
			  alertText: "<strong>不能使用×</strong>",
			  alertTextLoad: "正在验证"
		},ajaxEmail={
			url: "ajaxUsername!ajaxUsername.action",
			extraData: "times="+Math.random(),
			alertTextOk: '<strong style="color:#090;">可以使用√<strong>',
			alertText: "<strong>不能使用×</strong>",
			alertTextLoad: "正在验证"
		};
	</script>
</html>