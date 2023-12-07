/**
 * 회원 가입 모델 생성자
 * @namespace GLOBAL
 * @constructor UserSignIn
 * @class
 * @author 
 */
var UserSignIn = function() {
	/**
	 * DOM ID 객체
	 * @private
	 * @field
	 * @type {Object}
	 */

		//TODO 추후의 ID값 새로 정의해야함
	var id = {
			saveEmail : 'user-signIn-saveEmail',
			autoSignIn : 'user-signIn-autoSignIn',
			signInForm : 'user-signIn-signInForm',
			signInButton : 'user-signIn-signInButton',
			signInEmailInputArea : "user-signIn-signInEmailInputArea",
			signInPwdInputArea : "user-signIn-signInPwdInputArea",
			signInSocialArea: "user-signIn-signInSocialArea",
			redirectUrl : "user-signIn-redirectUrl",
			signInType : {
				general : "user-signIn-signInType-general",
				manager : "user-signIn-signInType-manager",
				generalCheck : "user-signIn-signInType-general-check",
				managerCheck : "user-signIn-signInType-manager-check"
			},
			input: {
				id:'user-signIn-input-email',
				pwd:'user-signIn-input-pwd',
				emailDel:'user-signIn-input-email-del',
				pwdDel:'user-signIn-input-pwd-del',
				saveEmail : 'user-signIn-input-saveEmail'
			},
			helpMenu: {
				searchEmail : 'user-signIn-helpMenu-searchEmail',
				searchPwd: 'user-signIn-helpMenu-searchPwd',
				signUp : 'user-signIn-helpMenu-signUp'
			},
			socialButton : {
				naver: 'user-signIn-socialButton-naver',
				facebook: 'user-signIn-socialButton-facebook',
				kakao: 'user-signIn-socialButton-kakao',
				daum: 'user-signIn-socialButton-daum',
				enuri: 'user-signIn-socialButton-enuri',
				signUp: 'user-signUp-socialButton',
				signUpForm: 'user-social-signUpForm',
				select: 'user-social-signUp-select',
				box: 'user-social-signUp-box',
				text: 'user-social-signUp-text',
				email: 'user-social-signUp-email',
				emailBack: 'user-social-signUp-emailBack',
				emailFront: 'user-social-signUp-emailFront',
				emailBackText: 'user-social-signUp-back-text',
				emailFrontText: 'user-social-signUp-front-text',
				layer: 'user-social-signUp-layer',
				layerClose: 'user-social-signUp-layer-close',
				autoSignIn: 'user-social-signUp-autoSignIn',
				errorText: 'user-social-signUp-error-text',
				errorBox: 'user-social-signUp-error-box'
			},
			error : {
				area : 'user-signIn-error-area',
				message : 'user-signIn-error-message'
			}
		};

	/**
	 * DOM<br />
	 * - jQuery 객체<br />
	 * - 수정하지 않는것을 권장
	 * @private
	 * @field
	 * @type {Object}
	 */
	var target = {};

	/**
	 * 상태 정보
	 * @private
	 * @field
	 * @type {Object}
	 */
	var status = {};

	var redirectUrl;

	/**
	 * 로그인 클릭 이벤트 핸들로
	 * @private
	 * @function
	 * @param {Object} event 이벤트 객체
	 */
	var buttonSignInClickHandler = function(event) {
		if(_.isEmpty($('#'+email.input.email).val()) === true) {
			$('#'+email.error.area).show();
			$('#'+email.signInEmailInputArea).addClass("error");
			$('#'+email.signInPwdInputArea).removeClass("error");
			$('#'+email.error.message).html("아이디를 입력해 주세요");
			$('#'+email.input.email).focus();
			return false;
		}

		if(_.isEmpty($('#'+email.input.pwd).val())) {
			$('#'+email.error.area).show();
			$('#'+email.signInPwdInputArea).addClass("error");
			$('#'+email.signInEmailInputArea).removeClass("error");
			$('#'+email.error.message).html("패스워드를 입력하세요");
			$('#'+email.input.pwd).focus();
			return false;
		}

		if(!_.isUndefined($("#g-recaptcha-response").val()) && _.isEmpty($("#g-recaptcha-response").val())) {
			$('#'+email.error.area).show();
			$('#'+email.signInEmailInputArea).addClass("error");
			$('#'+email.signInPwdInputArea).addClass("error");
			$('#'+email.error.message).html("'로봇이 아닙니다' 인증정보를 체크하세요.");
			return false;
		}

		if($('#'+email.saveEmail).hasClass("on") == true){
			$('#'+email.input.saveEmail).val(true);
		} else {
			$('#'+email.input.saveEmail).val(false);
		}

		let gtagKeyword = '로그인_자동로그인_';
		if ($('#' + email.autoSignIn).is(':checked') == true) {
			gtagKeyword += 'ON';
		} else {
			gtagKeyword += 'OFF';
		}
		setGtagEvent(gtagKeyword);
		setGtagEvent('로그인_로그인하기');

		$('#'+email.signInForm).submit();
	};

	/**
	 * input focus 이벤트 핸들러
	 * @private
	 * @function
	 * @param {Object} event 이벤트 객체
	 */
	var inputFocusHandler = function(event) {
		$(this).css("z-index", 10);
	};

	/**
	 * input blur 이벤트 핸들러
	 * @private
	 * @function
	 * @param {Object} event 이벤트 객체
	 */
	var inputBlurHandler = function(event) {
		if ($(this).val().length > 0) {
			$(this).css("z-index", 10);
		} else {
			$(this).css("z-index", 8);
		}
	};

	/**
	 * input 박스 focusin 핸들러
	 * @private
	 * @function
	 * @param {Object} event 이벤트 객체
	 */
	var inputFocusinHandler = function(event) {
		$(this).parent(".input_box").addClass("focus");
	};

	/**
	 * input 박스 focusout 핸들러
	 * @private
	 * @function
	 * @param {Object} event 이벤트 객체
	 */
	var inputFocusoutHandler = function(event) {
		$(this).parent(".input_box").removeClass("focus");
	};

	/**
	 * 로그인 타입 체인지 핸들러
	 * @private
	 * @function
	 * @param {Object} event 이벤트 객체
	 */
	var signInTypeChangeHandler = function(event) {
		if($('#'+email.signInType.manager).is(':checked') === true) {
			$('#'+email.signInSocialArea).hide();
			$('#'+email.signInType.generalCheck).removeClass("check");
			$('#'+email.signInType.managerCheck).addClass("check");
			$('#'+email.signInType.general).attr('checked', false);
			$('#'+email.signInType.manager).attr('checked', true);
		} else {
			$('#'+email.signInSocialArea).show();
			$('#'+email.signInType.generalCheck).addClass("check");
			$('#'+email.signInType.managerCheck).removeClass("check");
			$('#'+email.signInType.general).attr('checked', true);
			$('#'+email.signInType.manager).attr('checked', false);
		}
	};

	/**
	 * 아이디 저장한 경우
	 */
	if($('#'+email.input.saveEmail).val() == "true"){
		$('#'+email.saveEmail).addClass("on");
	}

	/**
	 * 아이디 입력 감지
	 */
	$('#'+email.input.email).on('keyup', function() {
		var temp = $('#'+email.input.email).val();

		// 삭제 버튼 클릭 이벤트
		$('#'+email.input.emailDel).click(function() {
			$('#'+email.input.email).val("");
			$('#'+email.input.emailDel).removeClass('on');
		});

		if (temp.length > 0) {
			$('#'+email.input.emailDel).addClass('on');
		} else {
			$('#'+email.input.emailDel).removeClass('on');
		}
	});

	/**
	 * 아이디 포커스 감지
	 */
	$('#'+email.input.email).on('focus', function() {
		if ($('#'+email.signInEmailInputArea).hasClass("error")) {
			$('#'+email.signInEmailInputArea).removeClass("focus");
		} else {
			$('#'+email.signInEmailInputArea).addClass("focus");
		}
		$('#'+email.signInPwdInputArea).removeClass("focus");
	});

	/**
	 * 아이디 포커스아웃 감지
	 */
	$('#'+email.input.email).on('focusout', function() {
		$('#'+email.signInEmailInputArea).removeClass("focus");

		/**
		 * 아이디 삭제 포커스
		 */
		$('#'+email.input.emailDel).on('focus', function() {
			$('#'+email.signInPwdInputArea).addClass("focus");
			$('#'+email.input.pwd).focus();
			$('#'+email.input.emailDel).off('focus');
		});
	});

	/**
	 * 패스워드 입력 감지
	 */
	$('#'+email.input.pwd).on('keyup', function() {
		var temp = $('#'+email.input.pwd).val();

		// 삭제 버튼 클릭 이벤트
		$('#'+email.input.pwdDel).click(function() {
			$('#'+email.input.pwd).val("");
			$('#'+email.input.pwdDel).removeClass('on');
		});

		if (temp.length > 0) {
			$('#'+email.input.pwdDel).addClass('on');
		} else {
			$('#'+email.input.pwdDel).removeClass('on');
		}
	});

	/**
	 * 패스워드 포커스 감지
	 */
	$('#'+email.input.pwd).on('focus', function() {
		if ($('#'+email.signInPwdInputArea).hasClass("error")) {
			$('#'+email.signInPwdInputArea).removeClass("focus");
		} else {
			$('#'+email.signInPwdInputArea).addClass("focus");
		}
		$('#'+email.signInEmailInputArea).removeClass("focus");
	});

	/**
	 * 패스워드 포커스아웃 감지
	 */
	$('#'+email.input.pwd).on('focusout', function() {
		$('#'+email.signInPwdInputArea).removeClass("focus");

		/**
		 * 아이디 삭제 포커스 (포커스 역행 처리)
		 */
		$('#'+email.input.emailDel).on('focus', function() {
			$('#'+email.signInEmailInputArea).addClass("focus");
			$('#'+email.input.email).focus();
			$('#'+email.input.emailDel).off('focus');
		});

		$('#'+email.input.pwdDel).on('focus', function() {
			$('#'+email.input.pwdDel).off('focus');
		});
	});

	/**
	 * 체크박스에 대한 핸들러
	 */
	var checkSettingHandler = function() {
		if ($(this).parent().hasClass('on') == true) {
			$(this).parent().removeClass("on");
			$(this).attr('checked', false);
		} else {
			$(this).parent().addClass("on");
			$(this).attr('checked', true);
		}
	};

	/**
	 * 버튼에 대한 핸들러
	 */
	var buttonSettingHandler = function() {
		if ($(this).hasClass('on') == true) {
			$(this).removeClass("on");
			$('#'+email.input.saveEmail).val(false);
		} else {
			$(this).addClass("on");
			$('#'+email.input.saveEmail).val(true);
		}
	};

	/**
	 * 쇼셜 로그인 처리
	 * @param type
	 * @param redirectUrl
	 */
	var socialSignInHref = function() {
		var autoSignIn = false;
		var type = '';

		if(!_.isUndefined($("#g-recaptcha-response").val()) && _.isEmpty($("#g-recaptcha-response").val())) {
			$('#'+email.error.area).show();
			$('#'+email.signInEmailInputArea).addClass("error");
			$('#'+email.signInPwdInputArea).addClass("error");
			$('#'+email.error.message).html("'로봇이 아닙니다' 인증정보를 체크하세요.");
			return false;
		}

		if($('#' + email.autoSignIn).is(':checked') == true){
			autoSignIn = true;
		}

		if ($(this).attr('id') == email.socialButton.naver) {
			type = 'NAVER';
		} else if ($(this).attr('id') == email.socialButton.kakao) {
			type = 'KAKAO';
		} else if ($(this).attr('id') == email.socialButton.facebook) {
			type = 'FACEBOOK';
		} else if ($(this).attr('id') == email.socialButton.enuri) {
			type = 'ENURI';
		}

		window.open("/social/signIn?type=" + type + "&redirectUrl=" + encodeURIComponent(status.redirectUrl) + "&autoSignIn=" + autoSignIn);
	};

	/**
	 * 소셜 회원가입 버튼 클릭 헨들러
	 */
	var socialSignUpButton = function () {
		let formEmail = document.signUpSocial;
		formEmail.method = "post";
		formEmail.email.value = $('#' + email.socialButton.email).val();
		formEmail.submit();
	};

	/**
	 * 이메일 select 박스 클릭 헨들러
	 */
	var selectMail = function () {
		if($('#'+email.socialButton.box).hasClass('on') === true) {
			$('#'+email.socialButton.box).removeClass('on');
		} else {
			$('#'+email.socialButton.box).addClass('on');
		}
	};
	/**
	 * 이메일 select 요소 클릭 핸들러
	 * @param event
	 * @returns {null}
	 */
	var clickEmail = function (event) {
		$('#'+email.socialButton.box).removeClass('on');
		$('#'+email.socialButton.select).addClass('done');
		if ($('#' + email.socialButton.box).hasClass('box__select--error')) {
			$('#' + email.socialButton.box).removeClass('box__select--error');
		}
		if (event.currentTarget.innerText === '직접입력') {
			$('#' + email.socialButton.select).val("");
			$('#'+email.socialButton.box).css('display', 'none');
			$('#'+email.socialButton.text).css('display', 'block');
		} else {
			$('#'+email.socialButton.select).text(event.currentTarget.innerText);
			$('#'+email.socialButton.select).val(event.currentTarget.innerText);
			if ($('#' + email.socialButton.emailFrontText).val() === '') {
				return null;
			} else {
				let result = isEmailValid($('#' + email.socialButton.emailFrontText).val() + '@' + $('#' + email.socialButton.select).val());
				if (result) {
					// 회원가입 버튼 활성화
					// 오류 메시지 on 클래스가 있다면 끄기
					$('#' + email.socialButton.signUp).removeAttr("disabled");
				} else {
					// 오류 메시지 on 클래서 활성화
					$('#' + email.socialButton.signUp).attr("disabled","disabled");
				}
			}
		}
	};
	/**
	 * 이메일 앞단 키 입력 반응
	 */
	var emailFrontKeyup = function () {
		if ($('#' + email.socialButton.errorBox).hasClass('box__input--error')) {
			$('#' + email.socialButton.errorBox).removeClass('box__input--error');
		}
		let temp = $('#' + email.socialButton.emailFrontText).val();
		$('#' + email.socialButton.emailFront).addClass('on');

		// 삭제 버튼 클릭 이벤트
		$('#'+email.socialButton.emailFront).click(function() {
			$('#' + email.socialButton.emailFrontText).val("");
			$('#'+ email.socialButton.emailFront).removeClass('on');
		});

		if (temp.length > 0) {
			$('#'+email.socialButton.emailFront).addClass('on');
		} else {
			$('#'+email.socialButton.emailFront).removeClass('on');
		}
	};
	/**
	 * 이메일 뒷단 키 입력 반응
	 */
	var emailBackKeyup = function () {
		if ($('#' + email.socialButton.text).hasClass('box__input--error')) {
			$('#' + email.socialButton.text).removeClass('box__input--error');
		}
		let temp = $('#' + email.socialButton.emailBackText).val();
		$('#' + email.socialButton.emailBack).addClass('on');

		// 삭제 버튼 클릭 이벤트
		$('#'+email.socialButton.emailBack).click(function() {
			$('#' + email.socialButton.emailBackText).val("");
			$('#'+ email.socialButton.emailBack).removeClass('on');
		});

		if (temp.length > 0) {
			$('#'+email.socialButton.emailBack).addClass('on');
		} else {
			$('#'+email.socialButton.emailBack).removeClass('on');
		}
	};
	/**
	 * 이메일 앞단 포커스 아웃 감지
	 */
	$('#'+email.socialButton.emailFrontText).on('focusout', function() {
		if ($('#' + email.socialButton.select).val() === '' && $('#' + email.socialButton.emailBackText).val() === '') {
			return null;
		} else {
			let backEmail = '';
			if ($('#' + email.socialButton.emailBackText).val() != '') {
				backEmail = $('#' + email.socialButton.emailBackText).val();
			} else {
				backEmail = $('#' + email.socialButton.select).val();
			}
			let result = isEmailValid($('#' + email.socialButton.emailFrontText).val() + '@' + backEmail);
			if (result) {
				// 회원가입 버튼 활성화
				// 오류 메시지 on 클래스가 있다면 끄기
				$('#' + email.socialButton.signUp).removeAttr("disabled");
			} else {
				// 오류 메시지 on 클래서 활성화
				$('#' + email.socialButton.signUp).attr("disabled","disabled");
			}
		}
	});
	/**
	 * 이메일 뒷단 포커스 아웃 감지
	 */
	$('#'+email.socialButton.emailBackText).on('focusout', function() {
		if ($('#' + email.socialButton.emailFrontText).val() === '') {
			return null;
		} else {
			let result = isEmailValid($('#' + email.socialButton.emailFrontText).val() + '@' + $('#' + email.socialButton.emailBackText).val());
			if (result) {
				// 회원가입 버튼 활성화
				// 오류 메시지 on 클래스가 있다면 끄기
				$('#' + email.socialButton.signUp).removeAttr("disabled");
			} else {
				// 오류 메시지 on 클래서 활성화
				$('#' + email.socialButton.signUp).attr("disabled","disabled");
			}
		}
	});

	/**
	 * 이메일 유효성 검사
	 */
	var isEmailValid = function(value) {
		let flag = false;
		const method = 'POST';
		const action = '/checkedEmail';
		let data = {};

		data = {
			userEmail: value
		}

		/**
		 * MEMBER-1684 드림위즈 이메일 이용자 이메일 변경 안내의 건
		 * 드림위즈 전환건 마무리 될 경우 삭제 예정.
		 * else 내용을 제외하고 if문 제거
		 */
		if (value.indexOf('dreamwiz.com') >= 0) {
			flag = false;
		} else {
			$.ajax({
				type: method,
				url: action,
				data: data,
				async: false,
				success: function (data) {

					if (data.result.code === '200') {
						if (data.result.status === '0') {
							flag = true;
							$('#' + email.socialButton.errorText).css('display','none');
							$('#' + email.socialButton.email).val(value);

							if ($('#' + email.socialButton.errorBox).hasClass('box__input--error')) {
								$('#' + email.socialButton.errorBox).removeClass('box__input--error')
							}
							if ($('#' + email.socialButton.text).hasClass('box__input--error')) {
								$('#' + email.socialButton.text).removeClass('box__input--error');
							}
							if ($('#' + email.socialButton.box).hasClass('box__select--error')) {
								$('#' + email.socialButton.box).removeClass('box__select--error');
							}
						} else {
							flag = false;
							$('#' + email.socialButton.errorBox).addClass('box__input--error');
							$('#' + email.socialButton.text).addClass('box__input--error');
							$('#' + email.socialButton.box).addClass('box__select--error');
							$('#' + email.socialButton.errorText).css('display','block');
						}
					}
				}
			});
		}
		return flag;
	}
	/**
	 * 로그인 알림 레이어(페이스북, 애플 회원가입 시 노출되는 레이어) 창 종료
	 */
	var layerClose = function () {
		$('#' + email.socialButton.layer).css("display","none");
	};

	/**
	 * 로그인 알림 레이어(페이스북, 애플 회원가입 시 노출되는 레이어)에서 네이버, 카카오 로그인 클릭 헨들러
	 * @returns {boolean}
	 * @constructor
	 */
	var socialSignIn = function (){
		var autoSignIn = false;
		var type = '';

		autoSignIn = $('#' + email.socialButton.autoSignIn).val()

		if ($(this).attr('id') == email.socialButton.naver) {
			type = 'NAVER';
		} else if ($(this).attr('id') == email.socialButton.kakao) {
			type = 'KAKAO';
		}

		window.open("/social/signIn?type=" + type + "&redirectUrl=" + encodeURIComponent(status.redirectUrl) + "&autoSignIn=" + autoSignIn);
	}

	/**
	 * 모델을 초기화 한다.
	 * @public
	 * @function
	 * @throws
	 * @returns
	 */
	this.initialize = function() {
		target = $('body');
		target.off();

		$('#'+email.input.email).focus();

		// 에러 메세지 출력시 input창 에러 처리
		if(!_.isEmpty($('#'+email.error.message).html()) === true){
			$('#'+email.error.area).show();
			$('#'+email.signInEmailInputArea).addClass("error");
			$('#'+email.signInPwdInputArea).addClass("error");
			$('#'+email.signInEmailInputArea).removeClass("focus");
			$('#'+email.signInEmailInputArea).removeClass("focus");
		}

		$(window).bind("pageshow", function (event) {
			// 페이지 로딩시 자동 로그인 끄기
			$('#user-signIn-autoSignIn').prop('checked', false);
		});

		status.redirectUrl = target.find('#' + email.redirectUrl).val();
		target.on('click',  '#' + email.signInButton, buttonSignInClickHandler);
		target.on('click',  '.link_social_btn', socialSignInHref);
		target.on('focus',  '.input_box input', inputFocusHandler);
		target.on('blur',  '.input_box input', inputBlurHandler);
		target.on('focusin',  '.input_box input', inputFocusinHandler);
		target.on('focusout',  '.input_box input', inputFocusoutHandler);
		target.on('change',  'input[name=signInUserType]', signInTypeChangeHandler);
		target.on('click',  '#' + email.saveEmail, buttonSettingHandler);
		target.on('change',  '#' + email.autoSignIn, checkSettingHandler);
		target.on('click', '#' + email.socialButton.signUp, socialSignUpButton);
		target.on('click','#' + email.socialButton.select, selectMail);
		target.on('click', '.button__mail', clickEmail);
		target.on('keyup', '#' + email.socialButton.emailFrontText, emailFrontKeyup);
		target.on('keyup', '#' + email.socialButton.emailBackText, emailBackKeyup);
		target.on('click', '#' + email.socialButton.layerClose, layerClose);
		target.on('click',  '.link__signIn', socialSignIn);
	};
}