/**
 * 회원 가입 모델 생성자
 * @namespace GLOBAL
 * @constructor UserSignUpStep
 * @class
 * @author
 */
var UserSignUpStep = function () {

    /**
     * DOM ID 객체
     * @private
     * @field
     * @type {Object}
     */

    var id = {
        danawaLogo: 'user-signUpStep-danawaLogo',
        userType: 'user-signUpStep-userType',
        userSignUp: 'user-signUpStep-userSignUp',
        socialSignIn: {
            self: 'user-signUpStep-socialSignIn',
            daum: 'user-signUpStep-socialSignIn-daum'
        },
        form: {
            id: 'user-signUpStep-form-id',
            div: 'user-signUpStep-container'
        },
        user: {
            id: 'user-signUpStep-user-id',
            password: 'user-signUpStep-user-password',
            passwordConfirm: 'user-signUpStep-user-passwordConfim',
            name: 'user-signUpStep-user-name',
            nickname: 'user-signUpStep-user-nickname',
            email: 'user-signUpStep-user-email',
            agreement: 'user-signUpStep-user-agreement',
            lifeUser: 'user-lifeUser',
            redirect: 'user-signUpStep-encodedRedirectUrl',
            selectMailBox: "user-signUpStep-selectBox-mail",
            emailFrontText: "user-signUpStep-user-emailFront",
            emailBackText: "user-signUpStep-user-emailBack"
        },
        company: {
            self: 'user-signUpStep-company-self',
            name: 'user-signUpStep-company-name',
            boss: 'user-signUpStep-company-boss',
            typeCode: 'user-signUpStep-company-typeCode',
            number: 'user-signUpStep-company-number',
            numberHidden: 'user-signUpStep-company-number-hidden',
            license: 'user-signUpStep-company-license',
            agreement: 'user-signUpStep-company-agreement'
        },
        tap: {
            user: 'user-signUpStep-tap-user',
            company: 'user-signUpStep-tap-company',
            userOn: 'user-signUpStep-tap-user-on',
            companyOn: 'user-signUpStep-tap-company-on'
        },
        guide: {
            button: {
                common: 'user-signUpStep-guide-button-',
                service: 'user-signUpStep-guide-button-service',
                privacy: 'user-signUpStep-guide-button-privacy',
                mailing: 'user-signUpStep-guide-button-mailing',
            },
            textDesc: {
                common: 'user-signUpStep-guide-textDesc-',
                service: 'user-signUpStep-guide-textDesc-service',
                privacy: 'user-signUpStep-guide-textDesc-privacy',
                mailing: 'user-signUpStep-guide-textDesc-mailing',
            }
        },
        checkBox: {
            common: 'user-signUpStep-checkBox-agree-',
            all: 'user-signUpStep-checkBox-agree-all',
            service: 'user-signUpStep-checkBox-agree-service',
            privacy: 'user-signUpStep-checkBox-agree-privacy',
            age: 'user-signUpStep-checkBox-agree-age',
            marketing: {
                allAgree: 'user-signUpStep-marketing-checkBox-all-agree',
                agree: 'user-signUpStep-marketing-checkBox-agree-',
                email: 'user-signUpStep-marketing-checkBox-agree-mailing',
                sms: 'user-signUpStep-marketing-checkBox-agree-sms',
            }
        },
        selectBox: {
            email: "user-signUpStep-selectBox-email"
        },
        message: {
            id: 'user-signUpStep-message-id',
            password: 'user-signUpStep-message-password',
            passwordConfirm: 'user-signUpStep-message-passwordConfirm',
            name: 'user-signUpStep-message-name',
            nickname: 'user-signUpStep-message-nickname',
            email: 'user-signUpStep-message-email',
            privateInfo: 'user-private-data-info',
            purpose: 'user-private-data-purpose',
            secondPrivateInfo: 'user-private-second-data-info',
            secondPurpose: 'user-private-second-data-purpose',
            secondHoldingPeriod: 'user-private-second-holding-period'
        },
        hidden: {
            email: 'user-signUpStep-hidden-email'
        },
        social: {
            naver: 'user-signUpStep-social-naver',
            kakao: 'user-signUpStep-social-kakao'
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
     * 뷰 정보
     * @private
     * @field
     * @type {Object}
     */
    var view = {
        agreement: {
            user: '',
            company: ''
        }
    };

    /**
     * 상태 정보
     * @private
     * @field
     * @type {Object}
     */
    var status = {
        isSubmitRock: false,
        isCompanySignedUp: false
    };

    /**
     * 하위 뷰 모델 정보
     * @private
     * @field
     * @type {Object}
     */
    var model = {
        validation: {}
    }

    /**
     * 개인회원 탭 클릭 이벤트 핸들로
     * @private
     * @function
     * @param {Object} event 이벤트 객체
     */
    var tapUserClickHandler = function () {
        target.find('#' + email.user.agreement).show();
        target.find('#' + email.company.agreement).hide();
        target.find('#' + email.message.privateInfo).html("ID, 비밀번호, 이메일주소, 이름, 닉네임, 휴대폰번호, 만 14세 이상 여부");
        target.find('#' + email.message.purpose).html("개인 식별, 고지사항 전달, 서비스 관련 상담, 맞춤형 서비스 제공, 민원사항 처리 등");
        target.find('#' + email.message.secondPrivateInfo).show();
        target.find('#' + email.message.secondPurpose).show();
        target.find('#' + email.message.secondHoldingPeriod).show();
        target.find('#' + email.form.div).removeClass('content__login--business');
        //사업자 회원 정보 입력 UI가 true인경우 hide처리
        target.find('#' + email.company.self).hide();
        status.isCompanySignedUp = false;

        return false;
    };

    /**
     * 사업자 회원 탭 클릭 이벤트 핸들로
     * @private
     * @function
     * @param {Object} event 이벤트 객체
     */
    var tapCompanyClickHandler = function () {
        target.find('#' + email.user.agreement).hide();
        target.find('#' + email.company.agreement).show();
        target.find('#' + email.userType).val('D');
        target.find('#' + email.message.privateInfo).html("ID, 비밀번호, 이메일주소, 이름, 닉네임, 만 14세 이상 여부,휴대폰번호(선택)");
        target.find('#' + email.message.purpose).html("사업자 식별, 고지사항 전달, 서비스 관련 상담, 민원사항 처리, 부가가치세법에 따른 세금계산서 발행");
        target.find('#' + email.message.secondPrivateInfo).hide();
        target.find('#' + email.message.secondPurpose).hide();
        target.find('#' + email.message.secondHoldingPeriod).hide();
        target.find('#' + email.form.div).addClass('content__login--business');

        status.isCompanySignedUp = true;
        target.find('#' + email.company.self).show();

        return false;
    };

    /**
     * 약관/이용 동의하기 체크박스 클릭 이벤트 핸들로
     * @private
     * @function
     * @param {Object} event 이벤트 객체
     */
    var checkBoxAgreeClickHandler = function (event) {
        var current = event.currentTarget.email.split('-')[5];

        /**
         * 약관의 모두 동의한 경우 약관 모두 Y
         */
        if (current === 'all') {
            if (target.find('#' + email.checkBox.common + current).is(':checked') === true) {
                target.find("input[id^='" + email.checkBox.common + "']").prop('checked', true);
                target.find("label[for^='" + email.checkBox.common + "']").addClass("on");

                //마케팅 활용 및 광고성 정보 수신 동의 추가
                $('#' + email.checkBox.marketing.allAgree).prop('checked', true);
                $("input[id^='" + email.checkBox.marketing.agree + "']").prop('checked', true);
            } else {
                target.find("input[id^='" + email.checkBox.common + "']").prop('checked', false);
                target.find("label[for^='" + email.checkBox.common + "']").removeClass("on");

                $('#' + email.checkBox.marketing.allAgree).prop('checked', false);
                $("input[id^='" + email.checkBox.marketing.agree + "']").prop('checked', false);
            }
        }
        /**
         * 각 약관에 동의한 경우 해당 약관 Y
         */
        else {
            if (target.find('#' + event.currentTarget.email).is(':checked') === true) {
                target.find('#' + event.currentTarget.email).val('Y');
                target.find("label[for='" + event.currentTarget.email + "']").addClass("on");
            } else {
                target.find('#' + event.currentTarget.email).val('N');
                target.find("label[for='" + event.currentTarget.email + "']").removeClass("on");
            }
        }

    };

    /**
     * 마케팅 활용 및 광고성 정보 수신 전체 동의 이벤트
     * @param event
     */
    let checkBoxMarketingAgreeAllClickHandler = function (event) {
        if ($('#' + email.checkBox.marketing.allAgree).is(':checked') === true) {
            $("input[id^='" + email.checkBox.marketing.agree + "']").prop('checked', true);
        } else {
            $("input[id^='" + email.checkBox.marketing.agree + "']").prop('checked', false);
        }
    };

    /**
     * 마케팅 활용 및 광고성 정보 수신 동의 이벤트
     * @param event
     */
    let checkBoxMarketingAgreeClickHandler = function (event) {
        if ($('#' + email.checkBox.marketing.email).is(':checked') === true
            || $('#' + email.checkBox.marketing.sms).is(':checked') === true) {
            $('#' + email.checkBox.marketing.allAgree).prop('checked', true);
        } else {
            $('#' + email.checkBox.marketing.allAgree).prop('checked', false);
        }
    }

    /**
     * 입력 항목 동적 확인
     * @returns {boolean}
     */
    var userSignUpBtnHandler = function () {
        /**
         * 약관/개인정보 수집 동의 체크
         */
        if (!target.find('#' + email.checkBox.common + 'service').is(':checked')) {
            $('#' + email.userSignUp).attr("disabled", "disabled");
            return false;
        }
        if (!target.find('#' + email.checkBox.common + 'privacy').is(':checked')) {
            $('#' + email.userSignUp).attr("disabled", "disabled");
            return false;
        }
        if (!target.find('#' + email.checkBox.age).is(':checked')) {
            $('#' + email.userSignUp).attr("disabled", "disabled");
            return false;
        }

        if ($('#' + email.userType).val() === 'T') {
            if (MEMBER_DATA_UTILS.isNullOrEmptyOrUndefined(target.find('#' + email.user.name).val()) === true) {
                if (MEMBER_DATA_UTILS.isNullOrEmptyOrUndefined(target.find('#user-signUpStep-form-id input[name=enc_data]').val()) === true) {
                    $('#' + email.userSignUp).attr("disabled", "disabled");
                    return false;
                }
            }
            if (_.isEmpty($('#' + email.user.email).val())
                || _.isEmpty($('#' + email.user.password).val())
                || _.isEmpty($('#' + email.user.passwordConfirm).val())
                || _.isEmpty($('#' + email.user.nickname).val())
                || _.isEmpty($('#' + email.user.email).val())) {
                $('#' + email.userSignUp).attr("disabled", "disabled");
                return false;
            }
        } else {
            if (_.isEmpty($('#' + email.user.email).val())
                || _.isEmpty($('#' + email.user.password).val())
                || _.isEmpty($('#' + email.user.passwordConfirm).val())
                || _.isEmpty($('#' + email.user.emailFrontText).val())
                || (_.isEmpty($('#' + email.user.emailBackText)) && _.isEmpty($('#' + email.user.selectMailBox)))) {
                $('#' + email.userSignUp).attr("disabled", "disabled");
                return false;
            }
        }
        /**
         * 사업자 회원 가입하는 경우 사업자 검증
         */
        if (status.isCompanySignedUp === true) {
            /**
             * 사업자 회사 번호 변수 선언
             */
            var companyNumber = target.find('#' + email.company.number).val();

            /**
             * 회사 사업자 번호 변수 선언
             */
            var companyLicense = target.find('#' + email.company.license).val();

            if (MEMBER_DATA_UTILS.isNullOrEmptyOrUndefined(target.find('#' + email.company.name).val()) === true) {
                $('#' + email.userSignUp).attr("disabled", "disabled");
                return false;
            }

            if (MEMBER_DATA_UTILS.isNullOrEmptyOrUndefined(target.find('#' + email.company.boss).val()) === true) {
                $('#' + email.userSignUp).attr("disabled", "disabled");
                return false;
            }

            if (MEMBER_DATA_UTILS.isNullOrEmptyOrUndefined(companyLicense) === true) {
                $('#' + email.userSignUp).attr("disabled", "disabled");
                return false;
            }
        }
        // 지연 확인
        setTimeout(function () {
            if (!_.isEmpty($('#' + email.message.email).html())
                || !_.isEmpty($('#' + email.message.password).html())
                || !_.isEmpty($('#' + email.message.passwordConfirm).html())
                || !_.isEmpty($('#' + email.message.email).html())) {
                $('#' + email.userSignUp).attr("disabled", "disabled");
                return false;
            }

            $('#' + email.userSignUp).removeAttr("disabled");
            return true;
        }, 100);
    };

    /**
     * 회원가입 클릭 이벤트 핸들로
     * @private
     * @function
     * @param {Object} event 이벤트 객체
     */
    var userSignUpClickHandler = function (event) {
        /**
         * 약관/개인정보 수집 동의 체크
         */
        if (!target.find('#' + email.checkBox.common + 'service').is(':checked')) {
            alert("서비스 이용 약관에 동의하여 주세요.");
            $('#' + email.checkBox.common + 'service').focus();
            return false;
        }
        if (!target.find('#' + email.checkBox.common + 'privacy').is(':checked')) {
            alert("개인정보 수집 및 이용에 동의하여 주세요.");
            $('#' + email.checkBox.common + 'privacy').focus();
            return false;
        }

        if (!target.find('#' + email.checkBox.age).is(':checked')) {
            alert("다나와는 만 14세 이상부터 회원가입이 가능합니다.");
            $('#' + email.checkBox.age).focus();
            return false;
        }

        $('#' + email.user.email).trigger('blur');
        $('#' + email.user.password).trigger('blur');
        $('#' + email.user.passwordConfirm).trigger('blur');
        $('#' + email.user.name).trigger('blur');
        $('#' + email.user.nickname).trigger('blur');

        // 이메일 값 설정
        target.find('#' + email.hidden.email).val($('#' + email.user.email).val());

        if (!_.isEmpty($('#' + email.message.email).html())
            || !_.isEmpty($('#' + email.message.password).html())
            || !_.isEmpty($('#' + email.message.passwordConfirm).html())
            || !_.isEmpty($('#' + email.message.email).html())) {
            return false;
        }

        /**
         * 사업자 회원 가입하는 경우 사업자 검증
         */
        if (status.isCompanySignedUp === true) {
            /**
             * 사업자 회사 번호 변수 선언
             */
            var companyNumber = target.find('#' + email.company.number).val();

            /**
             * 회사 사업자 번호 변수 선언
             */
            var companyLicense = target.find('#' + email.company.license).val();

            if (MEMBER_DATA_UTILS.isNullOrEmptyOrUndefined(target.find('#' + email.company.name).val()) === true) {
                alert('회사명을 입력해 주세요.');
                target.find('#' + email.company.name).focus();
                return false;
            }

            if (MEMBER_DATA_UTILS.isNullOrEmptyOrUndefined(target.find('#' + email.company.boss).val()) === true) {
                alert('대표자명을 입력해 주세요.');
                target.find('#' + email.company.boss).focus();
                return false;
            }

            if (MEMBER_DATA_UTILS.isNullOrEmptyOrUndefined(companyLicense) === true) {
                alert('사업자 번호를 입력해주세요.');
                target.find('#' + email.company.license + '1').focus();
                return false;
            }

            if (companyLicense.length < 10) {
                alert('입력하신 사업자등록번호 자릿수가 맞지 않습니다.');
                target.find('#' + email.company.license + '1').focus();
                return false;
            }

            if (MEMBER_DATA_UTILS.isCheckSaeopjaNo(companyLicense, null, null) === false) {
                alert('입력하신 사업자등록번호는 생성규칙에 어긋납니다.');
                return false;
            }
        }
        signUpUser(event);
    };

    /**
     * email selectBox change 이벤트
     * @private
     * @function
     * @param {Object} event 이벤트 객체
     */
    var selectBoxEmailChangeHandler = function (event) {
        $('#' + email.user.email.emailFirst).val($(this).val());
        $('#' + email.user.email.emailFirst).focus();
    };

    /**
     * 가이드 안내문구 활성/비활성 처리
     */
    var guideTextDescToggle = function (event) {
        var current = event.currentTarget.email.split('-')[5];

        if ($("#" + email.guide.textDesc.common + current).css("display") == "none") {
            $("#" + email.guide.textDesc.common + current).css("display", "block");
            $('#' + email.guide.button.common + current).text("내용닫기 ▲");
            $('#' + email.guide.button.common + current).attr("title", "약관닫기 버튼 누르면 상세 내용이 닫힙니다");
        } else {
            $("#" + email.guide.textDesc.common + current).css("display", "none");
            $('#' + email.guide.button.common + current).text("약관보기 ▼");
            $('#' + email.guide.button.common + current).attr("title", "약관보기 버튼 누르면 상세 내용이 열립니다");
        }
    };

    /**
     * 회원 가입 정보를 전송한다.
     * @private
     * @function
     * @param {Object} data 전송 데이터
     */
    var signUpUser = function (event) {
        var url = '/signUpStep2User';

        if (target.find('#' + email.userType).val() === 'D') {
            url = '/signUpStep2Company';
        } else if (target.find('#' + email.userType).val() === 'T') {
            url = '/social/transferSignUp';
        }

        target.find('#' + email.form.email).attr('action', url);
        target.find('#' + email.form.email).submit();
        return false;
    };

    this.getId = function () {
        return id;
    };

    //탭키로 포커스 이동시 focus 클래스 추가 처리(웹접근성)
    function addTabFocusEvent() {

        $("input[id^='" + email.checkBox.common + "']").blur(function () {
            $("label[for^='" + email.checkBox.common + "']").removeClass("focus");
        });


        $("input[id^='" + email.checkBox.common + "']," + "button[id^='" + email.guide.button.common + "']," + "#" + email.socialSignIn.daum + ", #" + email.tap.companyOn).on("keydown", function (event) {
            if (event.shiftKey && event.which == 9) {
                $("#" + email.danawaLogo + " a").focus();
                return false;
            }
            //역순 탭인덱스 처리
            if (event.which == 9) {
                var targetEmail = $(this).attr("id");
                if ($("#" + email.userType).val() == 'G') {//개인회원
                    if (targetEmail == email.socialSignIn.daum) {
                        $("#" + email.checkBox.all).focus();
                        targetEmail = email.checkBox.all;
                    } else if (targetEmail == email.guide.button.service) {
                        $("#" + email.checkBox.service).focus();
                        targetEmail = email.checkBox.service;
                    } else if (targetEmail == email.guide.button.privacy) {
                        $("#" + email.checkBox.privacy).focus();
                        targetEmail = email.checkBox.privacy;
                    } else if (targetEmail == email.guide.button.mailing) {
                        $("#" + email.checkBox.mailing).focus();
                        targetEmail = email.checkBox.mailing;
                    } else if (targetEmail == email.checkBox.age) {
                        if ($("label[for='" + email.checkBox.age + "']").hasClass('focus') == true) {
                            $("label[for^='" + email.checkBox.common + "']").removeClass("focus");
                            return true;
                        }
                    } else if (targetEmail == email.guide.button.mailing) {
                        $("#" + email.checkBox.mailing).focus();
                        targetEmail = email.checkBox.mailing;
                    } else {
                        $("label[for^='" + email.checkBox.common + "']").removeClass("focus");
                        return true;
                    }
                } else {//사업자
                    if (targetEmail == email.tap.companyOn) {
                        $("#" + email.checkBox.all).focus();
                        targetEmail = email.checkBox.all;
                    } else if (targetEmail == email.guide.button.service) {
                        $("#" + email.checkBox.service).focus();
                        targetEmail = email.checkBox.service;
                    } else if (targetEmail == email.guide.button.privacy) {
                        $("#" + email.checkBox.privacy).focus();
                        targetEmail = email.checkBox.privacy;
                    } else if (targetEmail == email.guide.button.mailing) {
                        $("#" + email.checkBox.mailing).focus();
                        targetEmail = email.checkBox.mailing;
                    } else if (targetEmail == email.checkBox.age) {
                        if ($("label[for='" + email.checkBox.age + "']").hasClass('focus') == true) {
                            $("label[for^='" + email.checkBox.common + "']").removeClass("focus");
                            return true;
                        }
                    } else if (targetEmail == email.guide.button.mailing) {
                        $("#" + email.checkBox.mailing).focus();
                        targetEmail = email.checkBox.mailing;
                    } else {
                        return true;
                    }
                }

                $("label[for^='" + email.checkBox.common + "']").removeClass("focus");
                $("label[for='" + targetEmail + "']").addClass("focus");

                return false;
            }

            return true;
        });
    }

    this.daumLogout = function () {
        $.ajax({
            type: "GET",
            url: "/logout",
            async: false,
            success: function (e) {
            }
        });
    };

    var toggleTrigger = function () {
        if ($(this).hasClass("terms__toggle--hide") === true) {
            $(this).removeClass("terms__toggle--hide");
        } else {
            $(this).addClass("terms__toggle--hide");
        }

        return false;
    };

    /**
     * 삭제 버튼 노출
     */
    var toggleDelBtn = function () {
        if ($(this).val().length > 0) {
            $(this).next().addClass("on");
        } else {
            $(this).next().removeClass("on");
        }
    };

    /**
     * 삭제 버튼 실행 이벤트
     */
    var toggleDelBtnEvent = function () {
        // 내용 초기화
        $(this).prev().val("");
        // 경고 박스 제가
        $(this).prev().parents(".signUp").removeClass("signUp--error");
        // 경고 문구 삭제
        $(this).prev().parents(".signUp").next().children(".err_txt").html("");
        // 삭제 버튼 숨김
        $(this).removeClass("on");
        // 완료 버튼 비활성화
        $('#' + email.userSignUp).attr("disabled", "disabled");
        return false;
    };

    /**
     * 셀렉트 박스 이벤트
     */
    var phoneTypeClickEvent = function () {
        if ($('.selectbox__layer').css('display') != 'none') {
            var content = $(this).html();

            if (content.length < 4) {
                $('#' + email.company.typeCode).html(content);
                $('#' + email.company.numberHidden).val(content);
            }
            $('.selectbox__layer').css('display', 'none');
        } else {
            $('.selectbox__layer').css('display', 'block');
        }

        return false;
    };

    /**
     * 회원가입 페이지 - 소셜 로그인 처리
     */
    var socialSignInHref = function () {
        let type = '';
        const autoSignIn = false;
        const redirectUrl = $('#' + email.user.redirect).val();

        if ($(this).attr('id') == email.social.naver) {
            type = 'NAVER';
        } else if ($(this).attr('id') == email.social.kakao) {
            type = 'KAKAO';
        }

        window.open("/social/login?type=" + type + "&redirectUrl=" + redirectUrl + "&autoSignIn=" + autoSignIn);
    };

    /**
     * 이메일 select 박스 클릭 헨들러
     * @returns {boolean}
     */
    var selectMailSelectBox = function () {
        if ($('#' + email.user.selectMailBox).parents('.box__select').hasClass('on') === true) {
            $('#' + email.user.selectMailBox).parents('.box__select').removeClass('on');
        } else {
            $('#' + email.user.selectMailBox).parents('.box__select').addClass('on');
        }
    };

    /**
     * 이메일 select 요소 클릭 헨들러
     * @returns {boolean}
     */
    var clickSelectEmailList = function (event) {
        $('#' + email.user.selectMailBox).parents('.box__select').removeClass('on');
        // error 클래스가 있다면 새로 선택 시에는 error 클래스 제거
        if ($('#' + email.user.selectMailBox).parents('.box__select').hasClass('signUp--error')) {
            $('#' + email.user.selectMailBox).parents('.box__select').removeClass('signUp--error');
        }

        if (event.currentTarget.innerText === '직접입력') {
            $('#' + email.user.selectMailBox).val("");
            $('#' + email.user.selectMailBox).parents('.box__select').css('display', 'none');
            $('.emailBack').css('display', 'block');
        } else {
            $('#' + email.user.selectMailBox).val(event.currentTarget.innerText);
            $('#' + email.user.selectMailBox).text(event.currentTarget.innerText);

            if ($('#' + email.user.emailFrontText).val() === '') {
                return null;
            } else {
                $('#' + email.user.email).val($('#' + email.user.emailFrontText).val() + '@' + $('#' + email.user.selectMailBox).val());
                $('#' + email.user.email).blur();
                userSignUpBtnHandler();
            }
        }
    }

    /**
     * 이메일 앞단 키 입력 반응
     * @returns {boolean}
     */
    var emailFrontKeyup = function () {
        if ($('#' + email.user.emailFrontText).parents('.box__input').hasClass('signUp--error')) {
            $('#' + email.user.emailFrontText).parents('.box__input').removeClass('signUp--error');
        }
    }
    /**
     * 이메일 앞단 포커스 아웃 감지
     */
    $('#' + email.user.emailFrontText).on('focusout', function () {
        if ($('#' + email.user.emailFrontText).val() === '') {
            return null;
        }
        if ($('#' + email.user.selectMailBox).val() === '' && $('#' + email.user.emailBackText).val() === '') {
            return null;
        } else {
            if ($('#' + email.user.selectMailBox).val() !== '') {
                $('#' + email.user.email).val($('#' + email.user.emailFrontText).val() + '@' + $('#' + email.user.selectMailBox).val());
                $('#' + email.user.email).blur();
                userSignUpBtnHandler();
            } else {
                $('#' + email.user.email).val($('#' + email.user.emailFrontText).val() + '@' + $('#' + email.user.emailBackText).val());
                $('#' + email.user.email).blur();
                userSignUpBtnHandler();
            }
        }
    });

    /**
     * 이메일 뒷단 입력 반응
     */
    var emailBackKeyup = function () {
        if ($('#' + email.user.emailBackText).parents('.box__input').hasClass('box__input--error')) {
            $('#' + email.user.emailBackText).parents('.box__input').removeClass('box__input--error');
        }
    };
    /**
     * 이메일 뒷단 포커스 아웃 감지
     */
    $('#' + email.user.emailBackText).on('focusout', function () {
        if ($('#' + email.user.emailBackText).val() === '') {
            return null;
        }
        if ($('#' + email.user.emailFrontText).val() !== '') {
            $('#' + email.user.email).val($('#' + email.user.emailFrontText).val() + '@' + $('#' + email.user.emailBackText).val());
            $('#' + email.user.email).blur();
            userSignUpBtnHandler();
        }
    });

    /**
     * 모델을 초기화 한다.
     * @public
     * @function
     * @throws
     * @returns
     */
    this.initialize = function (defpage) {
        target = $('body');
        target.off();

        target.on('click', "input[id^='" + email.checkBox.common + "']", checkBoxAgreeClickHandler);
        target.on('click', "input[id^='" + email.checkBox.marketing.allAgree + "']", checkBoxMarketingAgreeAllClickHandler);
        target.on('click', "input[id^='" + email.checkBox.marketing.agree + "']", checkBoxMarketingAgreeClickHandler);
        target.on('click', '#' + email.userSignUp, userSignUpClickHandler);
        target.on('change', '#' + email.selectBox.email, selectBoxEmailChangeHandler);
        target.on('click', "button[id^='" + email.guide.button.common + "']", guideTextDescToggle);
        target.on('click', '.terms__toggle', toggleTrigger);
        target.on('keyup', '.input-info', toggleDelBtn);
        target.on('keyup', '.input-info', userSignUpBtnHandler);
        target.on('change', '.input-check', userSignUpBtnHandler);
        target.on('click', '.btn_del', toggleDelBtnEvent);
        target.on('click', '.search__tab-button', userSignUpBtnHandler);
        target.on('click', '.selectbox-content', phoneTypeClickEvent);
        target.on('click', '.social_btn', socialSignInHref);

        // 이메일 select 박스 클릭 헨들러
        target.on('click', '#' + email.user.selectMailBox, selectMailSelectBox);
        // 이메일 select value 클릭 헨들러
        target.on('click', '.button__mail', clickSelectEmailList);
        // 이메일 front 입력 반응 헨들러
        target.on('keyup', '#' + email.user.emailFrontText, emailFrontKeyup);
        target.on('keyup', '#' + email.user.emailBackText, emailBackKeyup);


        if (defpage != null && defpage == 2) {
            tapCompanyClickHandler();
        } else {
            tapUserClickHandler();
        }
    };
}
