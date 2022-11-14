///////////////////////////////////////////////////////////////////////////////
// 정규식

const isPassword = function (asValue) {
  const regExp = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,16}$/;

  return regExp.test(asValue);
};

const isPhoneNumber = function (asValue) {
  const regExp = /^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$/;
  // /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/g; (숫자인지만 확인)
  // /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/; (하이픈 포함)

  return regExp.test(asValue);
};

const isEmail = function (asValue) {
  const regExp =
    /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

  return regExp.test(asValue);
};

///// variables

const pwd = document.getElementById('pwd');
const email = document.getElementById('email');
const phone = document.getElementById('phone');

$('.btn_submit').on('click', function (e) {
  if (pwd.value.trim() !== '') {
    if (pwd.value.length < 8 || pwd.value.length > 16) {
      e.preventDefault();
      //prettier-ignore
      alert(
        '영문,숫자를 최소 한 가지씩 조합하여 8~16자리 비밀번호를 입력하세요.'
      );
    } else if (!isPassword(pwd.value)) {
      e.preventDefault();
      //prettier-ignore
      alert(
        '영문,숫자를 최소 한 가지씩 조합하여 8~16자리 비밀번호를 입력하세요.'
      );
    }
  }

  if (email.value.length !== 0 && !isEmail(email.value)) {
    e.preventDefault();
    alert('올바르지 않은 이메일 형식입니다.');
  }

  if (
    !isPhoneNumber(phone.value) ||
    phone.value.length < 10 ||
    phone.value.length > 11
  ) {
    e.preventDefault();
    alert('하이픈(-)을 제외한 휴대폰번호 10~11자리를 입력해주세요.');
  }
});
