////////////////////////////////////////
// 우편번호 찾기 JS

//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function sample4_execDaumPostcode() {
  new daum.Postcode({
    oncomplete: function (data) {
      // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

      // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
      // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
      var roadAddr = data.roadAddress; // 도로명 주소 변수
      var extraRoadAddr = ''; // 참고 항목 변수

      // 법정동명이 있을 경우 추가한다. (법정리는 제외)
      // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
      if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
        extraRoadAddr += data.bname;
      }
      // 건물명이 있고, 공동주택일 경우 추가한다.
      if (data.buildingName !== '' && data.apartment === 'Y') {
        extraRoadAddr +=
          extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName;
      }
      // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
      if (extraRoadAddr !== '') {
        extraRoadAddr = ' (' + extraRoadAddr + ')';
      }

      // 우편번호와 주소 정보를 해당 필드에 넣는다.
      document.getElementById('sample4_postcode').value = data.zonecode;
      document.getElementById('sample4_roadAddress').value = roadAddr;
      document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

      document.getElementById('sample4_engAddress').value = data.addressEnglish;

      // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
      if (roadAddr !== '') {
        document.getElementById('sample4_extraAddress').value = extraRoadAddr;
      } else {
        document.getElementById('sample4_extraAddress').value = '';
      }

      var guideTextBox = document.getElementById('guide');
      // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
      if (data.autoRoadAddress) {
        var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
        guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
        guideTextBox.style.display = 'block';
      } else if (data.autoJibunAddress) {
        var expJibunAddr = data.autoJibunAddress;
        guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
        guideTextBox.style.display = 'block';
      } else {
        guideTextBox.innerHTML = '';
        guideTextBox.style.display = 'none';
      }
    },
  }).open();
}

////////////////////////////////////////
// 인풋 영역 text event #1.

///// variables
const text = document.querySelectorAll('.input_value');

///// functions
text.forEach(el => {
  // el.previousElementSibling : 가려져 있던 태그
  // el.previousElementSibling.previousElementSibling : 보였던 태그
  const prevSpan = el.previousElementSibling;
  // const hiddenSpan = el.previousElementSibling;
  // let initSpan = '';

  el.addEventListener('focus', () => {
    // initSpan = prevSpan.innerText;
    // prevSpan.innerText = hiddenSpan.innerText;

    prevSpan.classList.replace('inner_warning', 'inner_hidden_warning');
  });

  el.addEventListener('blur', () => {
    if (el.value.length === 0) {
      prevSpan.classList.replace('inner_hidden_warning', 'inner_warning');
      // prevSpan.innerText = initSpan;
    }
  });
});

///////////////////////////////////////////////////////////////////////////////
// 인풋 영역 text event #2.

// variables
const oldIdInput = '학번';
const oldPwdInput = '비밀번호';
const oldPwdChkInput = '비밀번호 확인';
const oldNameInput = '이름';
const oldPostalInput = '상세주소';
const oldEmailInput = '이메일';

const newIdInput = '부여받은 학번 8자리 입력';
const newPwdInput = '8~16자리 영문,숫자 조합';
const newPwdChkInput = '비밀번호 재입력';
const newNameInput = '이름 입력';
const newPostalInput = '상세주소 입력';
const newEmailInput = '이메일 입력';

const id_change = document.querySelector('.id_change');
const pwd_change = document.querySelector('.pwd_change');
const pwd_check_change = document.querySelector('.pwd_check_change');
const name_change = document.querySelector('.name_change');
const postal_change = document.querySelector('.postal_change');
const email_change = document.querySelector('.email_change');

// functions
const changeText = function (input, oldTxt, newTxt) {
  const targetText = input.previousElementSibling;
  input.addEventListener('focus', () => {
    targetText.innerText = newTxt;
  });

  input.addEventListener('blur', () => {
    if (input.value.length === 0) {
      targetText.innerText = oldTxt;
      // console.log(oldTxt);
    }
  });
};

// execute
changeText(id_change, oldIdInput, newIdInput);
changeText(pwd_change, oldPwdInput, newPwdInput);
changeText(pwd_check_change, oldPwdChkInput, newPwdChkInput);
changeText(name_change, oldNameInput, newNameInput);
changeText(postal_change, oldPostalInput, newPostalInput);
changeText(email_change, oldEmailInput, newEmailInput);
// 예외 1. 우편번호, 도로명 주소

///////////////////////////////////////////////////////////////////////////////
// 정규식

// regExp
const isEmail = function (asValue) {
  const regExp =
    /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

  return regExp.test(asValue);
};

const isPassword = function (asValue) {
  const regExp = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,16}$/;

  return regExp.test(asValue);
};

const isName = function (asValue) {
  const regExp = /^[가-힣]{2,4}$/;
  return regExp.test(asValue);
};

const isPhoneNumber = function (asValue) {
  const regExp = /^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$/;
  // /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/g; (숫자인지만 확인)
  // /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/; (하이픈 포함)

  return regExp.test(asValue);
};

///// variables
const id = document.getElementById('id');
const pwd = document.getElementById('pwd');
const username = document.getElementById('username');
const pwdCheck = document.querySelector('.pwd_check_change');
const email = document.getElementById('email');
const phone = document.getElementById('phone');

const idWarning = $('.idWarning');
const pwdWarning = $('.pwdWarning');
const nameWarning = $('.nameWarning');
const emailWarning = $('.emailWarning');
const phoneWarning = $('.phoneWarning');

const idQuery = document.querySelector('.idWarning');
const pwdQuery = document.querySelector('.pwdWarning');
const nameQuery = document.querySelector('.nameWarning');
const phoneQuery = document.querySelector('.phoneWarning');
const emailQuery = document.querySelector('.emailWarning');

// ///// functions

// 학번이 미리 주어지는 경우, 어떤 형식으로 이루어지는 지 정해야 정규식을 작성 가능
// 현재는
$('#submit').on('click', function (e) {
  if (id.value.trim() === '') {
    e.preventDefault();
    alert('학번을 입력하세요.');
  } else if (typeof +id.value !== 'number' || isNaN(id.value)) {
    e.preventDefault();
    alert('올바른 학번 형식이 아닙니다.');
  } else if (id.value.trim().length !== 8) {
    e.preventDefault();
    alert('학번은 8자리 숫자입니다.');
  } else if (pwd.value.trim() === '') {
    e.preventDefault();
    alert('비밀번호를 입력하세요.');
  } else if (pwd.value.length < 8 || pwd.value.length > 16) {
    e.preventDefault();
    alert('비밀번호는 8~16자리여야 합니다.');
  } else if (!(pwd.value === pwdCheck.value)) {
    e.preventDefault();
    alert('비밀번호를 다시 확인해주세요.');
  } else if (!isPassword(pwd.value)) {
    e.preventDefault();
    alert(
      '영문,숫자를 최소 한 가지씩 조합하여 8~16자리 비밀번호를 입력하세요.',
    );
  } else if (username.value.trim() === '') {
    e.preventDefault();
    alert('이름을 입력하세요.');
  } else if (email.value.length !== 0 && !isEmail(email.value)) {
    e.preventDefault();
    alert('올바르지 않은 이메일 형식입니다.');
  }
});

const idWarningHandler = function (input, warning, query) {
  input.addEventListener('focus', () => {
    if (query.firstElementChild.style.display !== 'none') {
      warning.show(250);
    }
  });

  input.addEventListener('blur', () => {
    if (input.value.trim() === '') {
      query.firstElementChild.style.display = '';
      warning.show(250);
      query.lastElementChild.innerHTML = '학번을 입력해주세요.';
    } else if (typeof +input.value !== 'number' || isNaN(input.value)) {
      query.firstElementChild.style.display = '';
      warning.show(250);
      query.lastElementChild.innerHTML = '올바른 학번 형식이 아닙니다.';
    } else if (input.value.trim().length !== 8) {
      query.firstElementChild.style.display = '';
      warning.show(250);
      query.lastElementChild.innerHTML = '학번은 8자리 숫자입니다.';
    } else {
      query.lastElementChild.innerHTML = '';
      warning.hide(250);
      query.firstElementChild.style.display = 'none';
    }
  });
};

const pwdWarningHandler = function (input, warning, query) {
  input.addEventListener('focus', () => {
    if (query.firstElementChild.style.display !== 'none') {
      warning.show(250);
    }
  });

  input.addEventListener('blur', () => {
    if (input.value.trim() === '') {
      query.firstElementChild.style.display = '';
      warning.show(250);
      query.lastElementChild.innerHTML = '비밀번호를 입력하세요.';
    } else if (!isPassword(input.value)) {
      query.firstElementChild.style.display = '';
      warning.show(250);
      query.lastElementChild.innerHTML =
        '영문,숫자를 최소 한 가지씩 조합하여 8~16자리 비밀번호를 입력하세요.';
    } else if (
      input.value.trim().length < 8 ||
      input.value.trim().length > 16
    ) {
      query.lastElementChild.innerHTML = '비밀번호는 8~16자리여야 합니다.';
      query.firstElementChild.style.display = '';
      warning.show(250);
    } else {
      query.lastElementChild.innerHTML = '';
      warning.hide(250);
      query.firstElementhild.style.display = 'none';
    }
  });

  pwdCheck.addEventListener('blur', () => {
    if (!(input.value === pwdCheck.value)) {
      query.firstElementChild.style.display = '';
      warning.show(250);
      query.lastElementChild.innerHTML = '비밀번호를 다시 확인해주세요.';
    }
  });
};

const nameWarningHandler = function (input, warning, query) {
  input.addEventListener('focus', () => {
    if (query.firstElementChild.style.display !== 'none') {
      warning.show(250);
    }
  });

  input.addEventListener('blur', () => {
    if (input.value.trim() === '') {
      query.firstElementChild.style.display = '';
      warning.show(250);
      query.lastElementChild.innerHTML = '이름을 입력하세요.';
    } else if (!isName(input.value)) {
      query.firstElementChild.style.display = '';
      warning.show(250);
      query.lastElementChild.innerHTML = '한글 이름을 입력하세요(2~4자).';
    } else {
      query.lastElementChild.innerHTML = '';
      warning.hide(250);
      query.firstElementChild.style.display = 'none';
    }
  });
};

const emailWarningHandler = function (input, warning, query) {
  warning.hide();

  input.addEventListener('blur', () => {
    if (!isEmail(input.value)) {
      query.firstElementChild.style.display = '';
      warning.show(250);
      query.lastElementChild.innerHTML = '올바르지 않은 이메일 형식입니다.';
    } else {
      query.lastElementChild.innerHTML = '';
      warning.hide(250);
      query.firstElementChild.style.display = 'none';
    }
  });
};

const phoneWarningHandler = function (input, warning, query) {
  input.addEventListener('focus', () => {
    if (query.firstElementChild.style.display !== 'none') {
      warning.show(250);
    }
  });

  input.addEventListener('blur', () => {
    if (input.value.trim() === '') {
      query.firstElementChild.style.display = '';
      warning.show(250);
      query.lastElementChild.innerHTML = '휴대폰번호를 입력하세요.';
    } else if (
      // 숫자만 입력받도록
      !isPhoneNumber(input.value) ||
      input.value.length < 10 ||
      input.value.length > 11
    ) {
      query.firstElementChild.style.display = '';
      warning.show(250);
      query.lastElementChild.innerHTML = '올바르지 않은 형식입니다.';
    } else {
      query.lastElementChild.innerHTML = '';
      warning.hide(250);
      query.firstElementChild.style.display = 'none';
    }
  });
};

idWarningHandler(id, idWarning, idQuery);
pwdWarningHandler(pwd, pwdWarning, pwdQuery);
nameWarningHandler(username, nameWarning, nameQuery);
emailWarningHandler(email, emailWarning, emailQuery);
phoneWarningHandler(phone, phoneWarning, phoneQuery);

/*
비밀번호 정규식: 경우의 수
1) 아무 것도 입력하지 않았을 때
=> 비밀번호를 입력해주세요.
2) 올바르지 않은 형식일 때
=> '영문,숫자를 최소 한 가지씩 조합하여 8~16자리 비밀번호를 입력하세요.',
3) 비밀번호 확인과 값이 일치하지 않을 때

*/
