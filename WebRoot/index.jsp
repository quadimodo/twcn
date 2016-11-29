<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" href="js/uploadify/uploadify.css">
<script type="text/javascript" src="js/fileupload/jquery-2.1.0.js"></script>
<script type="text/javascript" src="js/sendTwitter.js"></script>
<script type="text/javascript" src="js/uploadify/jquery.uploadify.min.js"></script>


<script type="text/javascript">
$(function () {
	 $("button#twitter_send").click(function(){
		
		
		$.ajax({
            cache: true,
            type: "POST",
            url:"ajaxsendTweet!sendTweet.action",
            data:$("#fileupload").serialize(), // 你的formid
            async: false,
            error: function(request) {
                
            },
            success: function(data) {
                
            }
        });
		
	});
		/* $('#files').uploadifyUpload('upload');
		$("#files").uploadify({
	        uploader      : 'uploadAjax!uploadFile.action',  
	        method        : 'Post',
	        height        : 30,
	        swf           : 'js/uploadify/uploadify.swf',
	        width         : 200,
	        fileExt       : '*.png;*.gif;*.jpg;*.bmp;*.jpeg',
	        fileDesc      : '图片文件(*.png;*.gif;*.jpg;*.bmp;*.jpeg)',
	        simUploadLimit : 20,	//批量文件最多999
	        fileObjName   : 'uploadFile',
	        auto          : false,	//选择文件并确定后自动上传
	        multi         : true,   //多文件上传
	        //限制每次同时上传的文件数量 queueSizeLimit : 1,
	        removeCompleted : false,  // 设置为true上传后自动删除队列
	        onUploadSuccess   : function(file,data,response){
	        	//每次每个文件上传成功后
	        	$("#" + file.id).find(".data").html(" 上传完成");
	        },
	        onQueueComplete : function(data){
	        	//所有文件都上传完成
	        	$("#successCount").text(data.uploadsSuccessful);
	        	$("#errorCount").text(data.uploadsErrored);
	        	$("#info").show();
	        },
	        onFallback    : function (){
	        	alert("需要安装Flash控件");
	        }
		}); */
			
	

		
	
});
</script>
</head>

<body>
	<div class="global-nav" data-section-term="top_nav">
		<div class="global-nav-inner">
			<div class="container">
				<div role="navigation" style="display: inline-block;">
					<ul class="nav js-global-actions" id="global-actions">
						<li id="global-nav-home" class="home active new"
							data-global-action="home"><a
							class="js-nav js-tooltip js-dynamic-tooltip"
							data-placement="bottom" href="signupAction!homepage.action"
							data-component-context="home_nav" data-nav="home"
							data-original-title=""> <span
								class="Icon Icon--home Icon--large"></span> <span class="text">主页</span>
						</a></li>
						<li class="people notifications" data-global-action="connect">
							<a class="js-nav js-tooltip js-dynamic-tooltip"
							data-placement="bottom" href="/i/notifications"
							data-component-context="connect_nav" data-nav="connect"
							data-original-title=""> <span
								class="Icon Icon--notifications Icon--large"></span> <span
								class="text">通知</span> <span class="count"> <span
									class="count-inner">0</span>
							</span>
						</a>
						</li>
						<li class="dm-nav"><a role="button" href="#"
							class="js-tooltip js-dynamic-tooltip global-dm-nav"
							data-placement="bottom" data-original-title=""> <span
								class="Icon Icon--dm Icon--large"></span> <span class="text">私信</span>
								<span class="dm-new"><span class="count-inner"></span></span>
						</a></li>
					</ul>
				</div>
				<div class="pull-right" style="display: inline-block;">
					<div role="search">
						<form class="t1-form form-search js-search-form" action="/search"
							id="global-nav-search">
							<label class="visuallyhidden" for="search-query">搜索询问</label> <input
								class="search-input" type="text" id="search-query"
								placeholder="搜索 Twitter" name="q" autocomplete="off"
								spellcheck="false" aria-autocomplete="list"
								aria-expanded="false" aria-owns="typeahead-dropdown-1">
							<span class="search-icon js-search-action">
								<button type="submit" class="Icon Icon--search nav-search"
									tabindex="-1">
									<span class="visuallyhidden">搜索 Twitter</span>
								</button>
							</span>
						</form>
					</div>
					<ul class="nav right-actions">
						<li class="me dropdown session js-session"
							data-global-action="t1me" id="user-dropdown">
							<!-- 个人小头像 --> <a href="setting.jsp"
							class="btn js-tooltip settings dropdown-toggle js-dropdown-toggle"
							id="user-dropdown-toggle" data-placement="bottom" role="button"
							aria-haspopup="true" data-original-title="个人资料与账号"><img
								class="avatar size32" src="${users.avatar }"
								alt="Profile and settings" data-user-id="116652192"></a>
							<div class="dropdown-menu">
								<div class="dropdown-caret">
									<span class="caret-outer"></span> <span class="caret-inner"></span>
								</div>
								<ul>

									<li class="current-user" data-name="profile"><a
										href="/Rainsho"
										class="account-summary account-summary-small js-nav"
										data-nav="view_profile">
											<div class="content">
												<div class="account-group js-mini-current-user"
													data-user-id="116652192" data-screen-name="Rainsho">
													<b class="fullname">Rainsho</b><span
														class="screen-name hidden" dir="ltr">@Rainsho</span><small
														class="metadata">查看个人资料</small>
												</div>
											</div>
									</a></li>

									<li class="dropdown-divider"></li>

									<li><a href="/settings/account" data-nav="settings"
										class="js-nav">设置</a></li>

									<li class="js-signout-button" id="signout-button"
										data-nav="logout">
										<button type="button" class="dropdown-link">登出</button>
										<form class="t1-form dropdown-link-form signout-form"
											id="signout-form" action="/logout" method="POST"></form>
									</li>
								</ul>
							</div>

						</li>
						<li role="complementary" aria-labelledby="global-new-tweet-button"
							class="topbar-tweet-btn">
							<button id="global-new-tweet-button" type="button"
								class="js-global-new-tweet js-tooltip btn primary-btn tweet-btn js-dynamic-tooltip"
								data-placement="bottom"
								data-component-context="new_tweet_button" data-original-title="">
								<span class="Icon Icon--tweet Icon--large"></span> <span
									class="text">发推</span>
							</button>
						</li>
					</ul>
				</div>

			</div>
		</div>
	</div>

	<div id="page-outer">
		<div id="page-container" class="AppContent wrapper wrapper-home">

			<div class="dashboard dashboard-left">

				<div class="DashboardProfileCard  module">

					<a class="DashboardProfileCard-bg u-bgUserColor u-block"
						href="/Rainsho" tabindex="-1" aria-hidden="true"> </a>

					<div class="DashboardProfileCard-content">
						<!-- 用户头像 -->
						<a class="DashboardProfileCard-avatarLink u-inlineBlock"
							href="/Rainsho" title="${users.nickname }" tabindex="-1"
							aria-hidden="true"> <img
							class="DashboardProfileCard-avatarImage js-action-profile-avatar"
							src="${users.avatar }" alt="">
						</a>

						<div class="DashboardProfileCard-userFields">
							<div class="DashboardProfileCard-name u-textTruncate">
								<!-- 用户昵称 -->
								<a class="u-textInheritColor" href="/Rainsho">${users.nickname
									}</a>
							</div>
							<span class="DashboardProfileCard-screenname u-inlineBlock u-dir"
								dir="ltr"> <!-- 用户名 --> <a
								class="DashboardProfileCard-screennameLink u-linkComplex u-linkClean"
								href="/Rainsho">@<span class="u-linkComplex-target">${users.username
										}</span></a>
							</span>
						</div>

						<div class="ProfileCardStats">
							<ul
								class="ProfileCardStats-statList Arrange Arrange--bottom Arrange--equal">
								<li class="ProfileCardStats-stat Arrange-sizeFit"><a
									class="ProfileCardStats-statLink u-textUserColor u-linkClean u-block js-nav js-tooltip"
									href="/Rainsho" data-element-term="tweet_stats"
									data-original-title="21 推文"> <!-- 查看推文详情 --> <span
										class="ProfileCardStats-statLabel u-block">推文</span> <!-- 发送推特数目 -->
										<span class="ProfileCardStats-statValue"
										data-is-compact="false">${twt_RltNumBean.tweetNum }</span>
								</a></li>
								<li class="ProfileCardStats-stat Arrange-sizeFit"><a
									class="ProfileCardStats-statLink u-textUserColor u-linkClean u-block js-nav js-tooltip"
									href="/Rainsho/following" data-element-term="following_stats"
									data-original-title="16 正在关注"> <!-- 查看关注的人的详情 --> <span
										class="ProfileCardStats-statLabel u-block">正在关注</span> <!-- 关注人数 -->
										<span class="ProfileCardStats-statValue"
										data-is-compact="false">${twt_RltNumBean.relationNum-1
											}</span>
								</a></li>
							</ul>
						</div>

						<div id="dashboard-profile-prompt"></div>

					</div>
				</div>

				<div class="Trends module trends">
					<div class="trends-inner">
						<div class="flex-module trends-container context-trends-container">
							<div class="flex-module-header">

								<h3>
									<span class="trend-location js-trend-location">趋势</span>
								</h3>
								<span class="middot">·</span> <a role="button" href="#"
									data-modal="change-trends"
									class="change-trends js-trend-toggle">更改</a>
							</div>
							<div class="flex-module-inner">
								<ul class="trend-items js-trends">
									<li class="trend-item js-trend-item  context-trend-item"
										data-trend-name="#trickortreat"
										data-trends-id="2982244038083302278"
										data-trend-token=":tailored_request:hashtag_trend:taxi_worldwide_source:tweet_count_100000_1000000_metadescription:">

										<a class="pretty-link js-nav js-tooltip u-linkComplex "
										href="/hashtag/trickortreat?src=tren"
										data-query-source="trend_click"> <span
											class="u-linkComplex-target trend-name" dir="ltr">#trickortreat</span>

											<div class="js-nav trend-item-context"></div>
											<div class="js-nav trend-item-stats">10.5万 推文</div>
									</a>

									</li>

									<li class="trend-item js-trend-item  context-trend-item"
										data-trend-name="#halloween2016"
										data-trends-id="2982244038083302278"
										data-trend-token=":tailored_request:hashtag_trend:taxi_city_source:tweet_count_100000_1000000_metadescription:">

										<a class="pretty-link js-nav js-tooltip u-linkComplex "
										href="/hashtag/halloween2016?src=tren"
										data-query-source="trend_click"> <span
											class="u-linkComplex-target trend-name" dir="ltr">#halloween2016</span>

											<div class="js-nav trend-item-context"></div>
											<div class="js-nav trend-item-stats">11.2万 推文</div>
									</a>

									</li>

								</ul>
							</div>
						</div>
					</div>
				</div>

			</div>

			<!-- twitter contents begin -->

			<div role="main" aria-labelledby="content-main-heading"
				class="content-main top-timeline-tweetbox" id="timeline">

				<div id="above-timeline-prompt"></div>

				<div class="timeline-tweet-box ">
					<!--home-tweet-box-->
					<div class="home-tweet-box tweet-box component tweet-user">
						<img class="top-timeline-tweet-box-user-image avatar size32"
							src="${users.avatar }" alt="Rainsho">

                   <!--  推特表单提交 start -->
						<form id="fileupload" class="t1-form tweet-form" method="post"
							target="tweet-post-iframe"
							action="//upload.twitter.com/i/tweet/create_with_media.iframe"
							enctype="multipart/form-data" data-poll-composer-rows="3"
							data-poll-duration="true">

							<div class="tweet-content">
								<img class="inline-reply-user-image avatar size32"
									src="https://pbs.twimg.com/profile_images/1152020704/rainser__2__normal.jpg"
									alt="Rainsho">
								<div class="TweetBox-photoIntent"></div>
								<div class="tweet-drag-help tweet-drag-photo-here hidden"></div>
								<span class="visuallyhidden" id="tweet-box-home-timeline-label">推文文字</span>

								<div class="RichEditor is-fakeFocus">

									<div class="RichEditor-mozillaCursorWorkaround">&nbsp;</div>
									<div class="RichEditor-scrollContainer">
										<!-- 发送推特 -->
										<div aria-labelledby="tweet-box-home-timeline-label"
											name="tweets.tcontent" id="tweet-box-home-timeline"
											class="tweet-box rich-editor is-showPlaceholder"
											contenteditable="true" spellcheck="true" role="textbox"
											aria-multiline="true" dir="ltr" aria-autocomplete="list"
											aria-expanded="false" aria-owns="typeahead-dropdown-4">

										</div>
										<input type="hidden" name="tweets[uid]" value="${users.uid }" >
										<input type="hidden" id="tcontent"name="tweets[tcontent]" value="">

										<div class="RichEditor-pictographs" aria-hidden="true"></div>
									</div>
									<div class="RichEditor-mozillaCursorWorkaround">&nbsp;</div>
								</div>
								<div class="TweetBoxAttachments">

							      
							      <div class="thumbnail-container">
							  <div class="thumbnail-wrapper">
							    <div class="ComposerThumbnails">
							    <table role="presentation" class="table table-striped"><tbody class="files">
							    
							    </tbody></table>
							</div>
							    <div class="preview-message">
							        <button type="button" class="start-tagging js-open-user-select no-users u-borderUserColorLight u-textUserColor" disabled="">
							          <span class="Icon Icon--me Icon--smallest"></span>
							          <span class="tagged-users">谁在这张照片里?</span>
							        </button>
							    </div>
							    <div class="js-attribution attribution"></div>
							    <div class="ComposerVideoInfo u-hidden"></div>
							  </div>
							</div>
							  <div class="photo-tagging-container user-select-container hidden" style='display: none' >
							</div>
							<!--                                图片上传                                                                       start                              -->
							<div class="TweetBoxToolbar fileupload-buttonbar">
								<div class="TweetBoxExtras tweet-box-extras">
									<span class="TweetBoxExtras-item TweetBox-mediaPicker">
										<div class="photo-selector">
											<button aria-hidden="true" class="btn icon-btn js-tooltip" type="button" tabindex="-1" data-original-title="添加照片或视频">
												<span class="tweet-camera Icon Icon--camera"></span> <span
													class="text add-photo-label u-hiddenVisually">添加照片或视频</span>
											</button>
											<div class="image-selector">
												<input type="hidden" name="media_data_empty"
													class="file-data">
												<div class="multi-photo-data-container hidden"></div>
												<label class="t1-label"> <span
													class="visuallyhidden">添加照片或视频</span> 
													<input type="file" id="files"
													name="files[]"
													accept="image/gif,image/jpeg,image/jpg,image/png,video/mp4,video/x-m4v"
													multiple="" class="file-input js-tooltip"
													data-original-title="添加照片或视频" data-delay="150">
												</label>
											</div>
										</div>
									</span> <span class="TweetBoxExtras-item"><div
											class="FoundMediaSearch found-media-search dropdown">
											<button
												class="btn js-found-media-search-trigger js-dropdown-toggle icon-btn js-tooltip"
												type="button" title="添加 GIF" data-delay="150"
												aria-hidden="true" aria-haspopup="true">
												<span class="Icon Icon--gif Icon--large"></span> <span
													class="text u-hiddenVisually"> GIF </span>
											</button>
											<div class="FoundMediaSearch-dropdownMenu dropdown-menu"
												tabindex="-1">
												<div class="FoundMediaSearch-content Caret Caret--stroked">
													<div class="FoundMediaSearch-query">
														<input class="FoundMediaSearch-queryInput" type="text"
															autocomplete="off" placeholder="搜索 GIF"> <span
															class="Icon Icon--search"></span>
													</div>
													<div class="FoundMediaSearch-results">
														<div class="FoundMediaSearch-items"></div>
														<div class="FoundMediaSearch-pagination"></div>
													</div>
												</div>
											</div>
										</div> </span> <span class="TweetBoxExtras-item">
										<div class="PollCreator">
											<button class="btn icon-btn PollCreator-btn js-tooltip"
												type="button" data-delay="150" tabindex="0"
												data-original-title="添加投票">
												<span class="PollCreator-icon Icon Icon--pollBar"></span> <span
													class="text PollCreator-label u-hiddenVisually">投票</span>
											</button>
										</div> </span> <span class="TweetBoxExtras-item"><div class="geo-picker dropdown">
											<button
												class="btn js-geo-search-trigger geo-picker-btn icon-btn js-tooltip"
												type="button" data-delay="150" aria-haspopup="false"
												data-original-title="添加位置">
												<span class="Icon Icon--geo"></span> <span
													class="text geo-status u-hiddenVisually">添加位置</span>
											</button>
											<span class="dropdown-container dropdown-menu"></span> <input
												type="hidden" name="place_id" value="">
										</div> </span>

									<div class="TweetBoxUploadProgress">
										<div class="TweetBoxUploadProgress-uploading">
											正在上传
											<div class="TweetBoxUploadProgress-bar">
												<div class="TweetBoxUploadProgress-barPosition"></div>
											</div>
										</div>
										<div class="TweetBoxUploadProgress-processing">
											正在处理
											<div
												class="TweetBoxUploadProgress-spinner Spinner Spinner--size14"></div>
										</div>
									</div>
								</div>
								<div class="TweetBoxToolbar-tweetButton tweet-button">
									<span class="spinner"></span> <span class="tweet-counter">140</span>
									<button id="twitter_send"
										class="btn primary-btn tweet-action tweet-btn js-tweet-btn start"
										type="button" data-original-title="你也可以按 ctrl-enter">
										<span class="button-text tweeting-text"> <span
											class="Icon Icon--tweet"></span> 发推
										</span> <span class="button-text replying-text"> <span
											class="Icon Icon--reply"></span> 回复
										</span> <span class="button-text messaging-text"> <span
											class="Icon Icon--dm Icon--small"></span> 发送私信
										</span>
									</button>

								</div>
							</div>
							<!--                                图片上传                                                                       start                              -->
							<div style="position: absolute; visibility: hidden;">
								<div>
									<br>
								</div>
							</div>
						</form>
						<!--  推特表单提交           end -->
					</div>
					<!--home-tweet-box-->

				</div>

				<div class="content-header visuallyhidden">
					<div class="header-inner">
						<h2 id="content-main-heading" class="js-timeline-title">推文</h2>
					</div>
				</div>

				<div class="stream-container conversations-enabled "
					data-max-position="793263836312834053"
					data-min-position="793236616512888832">

					<div
						class="stream-item js-new-items-bar-container new-tweets-bar-visible"
						style="display: block;">
						<div class="new-tweets-bar js-new-tweets-bar" data-item-count="2">
							查看 2 条新推文</div>
					</div>

					<div class="stream">
						<ol class="stream-items js-navigable-stream" id="stream-items-id">

							<!-- --------------------------------------------------------------------------------------------------------------start -->
							<s:iterator var="list" value="tweetsList">
								<li class="js-stream-item stream-item stream-item
"
									data-item-id="793256326352822272"
									id="stream-item-tweet-793256326352822272"
									data-item-type="tweet">

									<div
										class="tweet js-stream-tweet js-actionable-tweet js-profile-popup-actionable
       original-tweet js-original-tweet
      
       has-cards dismissible-content has-content
"
										data-tweet-id="793256326352822272"
										data-item-id="793256326352822272"
										data-permalink-path="/NewYorker/status/793256326352822272"
										data-screen-name="NewYorker" data-name="The New Yorker"
										data-user-id="14677919" data-you-follow="true"
										data-follows-you="false" data-you-block="false"
										data-disclosure-type="" data-has-cards="true"
										data-component-context="suggest_ranked_timeline_tweet">

										<div class="context"></div>

										<div class="content">

											<div class="stream-item-header">
												<a
													class="account-group js-account-group js-action-profile js-user-profile-link js-nav"
													href="/NewYorker" data-user-id="14677919"> <img
													class="avatar js-action-profile-avatar"
													src="${list.users.avatar }" alt=""> <strong
													class="fullname js-action-profile-name show-popup-with-id"
													data-aria-label-part="">${list.users.nickname }</strong> <span>‏</span><span
													class="username js-action-profile-name"
													data-aria-label-part=""><s>@</s><b>${list.users.username
															}</b></span>

												</a> <small class="time"> <a
													href="/NewYorker/status/793256326352822272"
													class="tweet-timestamp js-permalink js-nav js-tooltip"
													title="上午9:00 - 2016年11月1日"><span
														class="_timestamp js-short-timestamp js-relative-timestamp"
														data-time="1477962020" data-time-ms="1477962020000"
														data-long-form="true" aria-hidden="true">${list.formateTime
															}</span><span class="u-hiddenVisually"
														data-aria-label-part="last">${list.tweettime }</span></a>
												</small>

												<button type="button"
													class="btn-link js-translate-tweet translate-button"
													data-nav="translate_tweet">
													<span class="translate-label">查看翻译</span><span
														class="Icon Icon--translator"></span>
												</button>

											</div>

											<div class="js-tweet-text-container">
												<p class="TweetTextSize  js-tweet-text tweet-text" lang="en"
													data-aria-label-part="0">${list.tcontent }</p>
											</div>

											<button type="button"
												class="btn-link js-translate-tweet translate-button"
												data-nav="translate_tweet">查看翻译</button>
											<div class="tweet-translation needs-translation"
												data-dest-lang="zh">
												<div class="translation-attribution">
													<span>通过<a class="attribution-logo"
														href="http://aka.ms/Twitter2BingTranslator"><span
															class="invisible">必应翻译</span></a>来翻译来自<span
														class="tweet-language">英文</span>的语言
													</span>
													<button type="button"
														class="btn-link js-translation-feedback-button"
														data-nav="">翻译出错了？</button>
												</div>
												<p class="tweet-translation-text"></p>
											</div>

											<div
												class="AdaptiveMedia
      
      
      is-square
      
      
      ">
												<div
													class="AdaptiveMedia-container
        js-adaptive-media-container
        ">
													<div class="AdaptiveMedia-singlePhoto">
														<div
															class="AdaptiveMedia-photoContainer js-adaptive-photo "
															data-image-url="https://pbs.twimg.com/media/CwI2bCuWAAAKY5L.jpg"
															data-element-context="platform_photo_card">

															<!-- 判断是否存在图片 -->
															<c:if test="${list.t2ps ne null }">
																<s:iterator var="lis" value="#list.t2ps">
																	<img data-aria-label-part="" src="${lis.pics.ppath }"
																		alt="" style="width: 100%; top: -0px;">
																</s:iterator>
															</c:if>


														</div>
													</div>

												</div>
											</div>

											<div class="stream-item-footer">

												<div class="ProfileTweet-actionCountList u-hiddenVisually">

													<span class="ProfileTweet-action--reply u-hiddenVisually">
														<span class="ProfileTweet-actionCount" aria-hidden="true"
														data-tweet-stat-count="0"> <span
															class="ProfileTweet-actionCountForAria">0回复</span>
													</span>
													</span> <span
														class="ProfileTweet-action--retweet u-hiddenVisually">
														<span class="ProfileTweet-actionCount"
														data-tweet-stat-count="14"> <span
															class="ProfileTweet-actionCountForAria"
															data-aria-label-part="">14 转推</span>
													</span>
													</span> <span
														class="ProfileTweet-action--favorite u-hiddenVisually">
														<span class="ProfileTweet-actionCount"
														data-tweet-stat-count="37"> <span
															class="ProfileTweet-actionCountForAria"
															data-aria-label-part="">37 赞</span>
													</span>
													</span>
												</div>

												<div class="ProfileTweet-actionList js-actions" role="group"
													aria-label="发推行为">
													<div class="ProfileTweet-action ProfileTweet-action--reply">
														<button
															class="ProfileTweet-actionButton u-textUserColorHover js-actionButton js-actionReply"
															data-modal="ProfileTweet-reply" type="button">
															<div class="IconContainer js-tooltip" title="回复">
																<span class="Icon Icon--reply"></span> <span
																	class="u-hiddenVisually">回复</span>
															</div>
															<div class="IconTextContainer">
																<span
																	class="ProfileTweet-actionCount ProfileTweet-actionCount--isZero ">
																	<span class="ProfileTweet-actionCountForPresentation"
																	aria-hidden="true"></span>
																</span>
															</div>
														</button>
													</div>
													<div
														class="ProfileTweet-action ProfileTweet-action--retweet js-toggleState js-toggleRt">
														<button
															class="ProfileTweet-actionButton  js-actionButton js-actionRetweet"
															data-modal="ProfileTweet-retweet" type="button">
															<div class="IconContainer js-tooltip" title="转推">
																<span class="Icon Icon--retweet"></span> <span
																	class="u-hiddenVisually">转推</span>
															</div>
															<div class="IconTextContainer">
																<span class="ProfileTweet-actionCount"> <span
																	class="ProfileTweet-actionCountForPresentation"
																	aria-hidden="true">14</span>
																</span>
															</div>
														</button>
														<button
															class="ProfileTweet-actionButtonUndo js-actionButton js-actionRetweet"
															data-modal="ProfileTweet-retweet" type="button">
															<div class="IconContainer js-tooltip" title="撤销转推">
																<span class="Icon Icon--retweet"></span> <span
																	class="u-hiddenVisually">已转推</span>
															</div>
															<div class="IconTextContainer">
																<span class="ProfileTweet-actionCount"> <span
																	class="ProfileTweet-actionCountForPresentation"
																	aria-hidden="true">14</span>
																</span>
															</div>
														</button>
													</div>

													<div
														class="ProfileTweet-action ProfileTweet-action--favorite js-toggleState">
														<button
															class="ProfileTweet-actionButton js-actionButton js-actionFavorite"
															type="button">
															<div class="IconContainer js-tooltip" title="喜欢">
																<div class="HeartAnimationContainer">
																	<div class="HeartAnimation"></div>
																</div>
																<span class="u-hiddenVisually">喜欢</span>
															</div>
															<div class="IconTextContainer">
																<span class="ProfileTweet-actionCount"> <span
																	class="ProfileTweet-actionCountForPresentation"
																	aria-hidden="true">37</span>
																</span>
															</div>
														</button>
														<button
															class="ProfileTweet-actionButtonUndo u-linkClean js-actionButton js-actionFavorite"
															type="button">
															<div class="IconContainer js-tooltip" title="撤销喜欢">
																<div class="HeartAnimationContainer">
																	<div class="HeartAnimation"></div>
																</div>
																<span class="u-hiddenVisually">喜欢</span>
															</div>
															<div class="IconTextContainer">
																<span class="ProfileTweet-actionCount"> <span
																	class="ProfileTweet-actionCountForPresentation"
																	aria-hidden="true">37</span>
																</span>
															</div>
														</button>
													</div>

													<div
														class="ProfileTweet-action ProfileTweet-action--more js-more-ProfileTweet-actions">
														<div class="dropdown">
															<button
																class="ProfileTweet-actionButton u-textUserColorHover dropdown-toggle js-dropdown-toggle"
																type="button" aria-haspopup="true">
																<div class="IconContainer js-tooltip" title="更多">
																	<span class="Icon Icon--dots"></span> <span
																		class="u-hiddenVisually">更多</span>
																</div>
															</button>
															<div class="dropdown-menu">
																<div class="dropdown-caret">
																	<div class="caret-outer"></div>
																	<div class="caret-inner"></div>
																</div>
																<ul>
																	<li class="share-via-dm js-actionShareViaDM"
																		data-nav="share_tweet_dm">
																		<button type="button" class="dropdown-link">私信分享</button>
																	</li>

																	<li class="copy-link-to-tweet js-actionCopyLinkToTweet">
																		<button type="button" class="dropdown-link">复制推文链接</button>
																	</li>
																	<li class="embed-link js-actionEmbedTweet"
																		data-nav="embed_tweet">
																		<button type="button" class="dropdown-link">嵌入推文</button>
																	</li>
																	<li class="mute-user-item pretty-link"><button
																			type="button" class="dropdown-link">静音
																			​@NewYorker</button></li>
																	<li class="unmute-user-item pretty-link"><button
																			type="button" class="dropdown-link">取消静音
																			@NewYorker</button></li>

																	<li class="block-link js-actionBlock" data-nav="block">
																		<button type="button" class="dropdown-link">屏蔽
																			@NewYorker</button>
																	</li>
																	<li class="unblock-link js-actionUnblock"
																		data-nav="unblock">
																		<button type="button" class="dropdown-link">取消屏蔽
																			@NewYorker</button>
																	</li>
																	<li class="report-link js-actionReport"
																		data-nav="report">
																		<button type="button" class="dropdown-link">


																			报告推文</button>
																	</li>
																	<li class="dropdown-divider"></li>
																	<li
																		class="js-actionMomentMakerAddTweetToOtherMoment MomentMakerAddTweetToOtherMoment">
																		<button type="button" class="dropdown-link">更多</button>
																	</li>
																	<li class="js-actionMomentMakerCreateMoment">
																		<button type="button" class="dropdown-link">新建瞬间</button>
																	</li>
																</ul>
															</div>

														</div>

													</div>

												</div>

											</div>

										</div>
									</div>

								</li>
							</s:iterator>
							<!-- --------------------------------------------------------------------------------------------------------------end -->
						</ol>
						<div class="stream-footer ">


							<div class="timeline-end has-items has-more-items">



								<div class="stream-end" style="display: block;">



									<div class="stream-end-inner">

										<h1>test info</h1>
										<h1>test info</h1>
										<h1>test info</h1>

										<span class="Icon Icon--large Icon--logo"></span>
										<p>
											<button type="button" class="btn-link back-to-top hidden"
												style="display: inline-block;">回到顶部 ↑</button>
										</p>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>

			</div>

			<!-- twitter contents end-->

			<div class="dashboard dashboard-right">
				<div
					class="module roaming-module wtf-module js-wtf-module  has-content">

					<div class="flex-module">
						<div class="flex-module-header">
							<h3>推荐关注</h3>
							<small>· </small>
							<button type="button" class="btn-link js-refresh-suggestions">
								<small>刷新</small>
							</button>
							<small class="view-all">· <a class="js-view-all-link"
								href="/who_to_follow/suggestions"
								data-element-term="view_all_link">查看全部</a></small>
						</div>

						<div
							class="js-recommended-followers dashboard-user-recommendations flex-module-inner"
							data-section-id="wtf" style="opacity: 1;">

							<div
								class="js-account-summary account-summary js-actionable-user "
								data-user-id="22369934" data-feedback-token="500"
								data-impression-id="">
								<div class="dismiss js-action-dismiss">
									<span class="Icon Icon--close"></span>
								</div>
								<div class="content">
									<a
										class="account-group js-recommend-link js-user-profile-link user-thumb"
										href="/jerryxenos" data-user-id="22369934"> <img
										class="avatar js-action-profile-avatar "
										src="https://pbs.twimg.com/profile_images/1408884061/twit_normal.jpg"
										alt=""> <span
										class="account-group-inner js-action-profile-name"
										data-user-id="22369934"> <b class="fullname">Jerry
												Xenos</b> <span class="username"><s>@</s><span
												class="js-username">jerryxenos</span></span>
									</span>
									</a>
									<div class="user-actions not-following not-muting"
										data-screen-name="jerryxenos" data-user-id="22369934">
										<button type="button"
											class="small-follow-btn follow-btn btn small follow-button js-recommended-item">
											<div class="js-action-follow follow-text action-text">
												<span class="Icon Icon--follow"></span>关注
											</div>
										</button>
									</div>

								</div>
							</div>


							<div
								class="js-account-summary account-summary js-actionable-user "
								data-user-id="22369934" data-feedback-token="500"
								data-impression-id="">
								<div class="dismiss js-action-dismiss">
									<span class="Icon Icon--close"></span>
								</div>
								<div class="content">
									<a
										class="account-group js-recommend-link js-user-profile-link user-thumb"
										href="/jerryxenos" data-user-id="22369934"> <img
										class="avatar js-action-profile-avatar "
										src="https://pbs.twimg.com/profile_images/1408884061/twit_normal.jpg"
										alt=""> <span
										class="account-group-inner js-action-profile-name"
										data-user-id="22369934"> <b class="fullname">Jerry
												Xenos</b> <span class="username"><s>@</s><span
												class="js-username">jerryxenos</span></span>
									</span>
									</a>
									<div class="user-actions not-following not-muting"
										data-screen-name="jerryxenos" data-user-id="22369934">
										<button type="button"
											class="small-follow-btn follow-btn btn small follow-button js-recommended-item">
											<div class="js-action-follow follow-text action-text">
												<span class="Icon Icon--follow"></span>关注
											</div>
										</button>
									</div>

								</div>
							</div>



						</div>


					</div>

				</div>

				<div class="Footer module roaming-module">
					<div class="flex-module">
						<div class="flex-module-inner js-items-container">
							<ul class="u-cf">
								<li class="Footer-item Footer-copyright copyright">© 2016
									Twitter</li>
								<li class="Footer-item"><a class="Footer-link"
									href="/about">关于</a></li>
								<li class="Footer-item"><a class="Footer-link"
									href="//support.twitter.com">帮助</a></li>

							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>

</html>