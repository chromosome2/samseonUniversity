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

////////////////////////////////////////////////////////////////////////////////
// 인풋 영역 text event #2.

// variables
const oldIdInput = '학번';
const newIdInput = '부여받은 학번 8자리 입력';
const oldPwdInput = '비밀번호';
const newPwdInput = '8자 이상, 영문/숫자/특수문자 중 2가지 이상 입력';
const oldPwdChkInput = '비밀번호 확인';
const newPwdChkInput = '비밀번호 재입력';
const oldNameInput = '이름';
const newNameInput = '이름 입력';
const oldAddrInput = '상세주소';
const newAddrInput = '상세주소 입력';
const oldEmailInput = '이메일';
const newEmailInput = '이메일 입력';

const id_change = document.querySelector('.id_change');

console.log(id_change.previousElementSibling);
console.log(id_change.value.length);
// functions
const changeText = function (input, oldTxt, newTxt) {
  const targetText = input.previousElementSibling;
  input.addEventListener('focus', () => {
    targetText.innerText = newTxt;
  });

  input.addEventListener('blur', () => {
    if (input.value.length === 0) {
      targetText.innerText = oldTxt;
      console.log(oldTxt);
    }
  });
};

// execute
changeText(id_change, oldIdInput, newIdInput);

// 예외 1. 우편번호, 도로명 주소

////////////////////////////////////////////////////////////////////////////////
// 이메일 정규식

///// variables
const email = document.getElementById('email');

///// functions
const mailCheck = function (email) {
  const emailRegExp = new RegExp(
    "([!#-'*+/-9=?A-Z^-~-]+(.[!#-'*+/-9=?A-Z^-~-]+)*|\"([]!#-[^-~ \t]|(\\[\t -~]))+\")@([!#-'*+/-9=?A-Z^-~-]+(.[!#-'*+/-9=?A-Z^-~-]+)*|[[\t -Z^-~]*])",
  );
  return emailRegExp.test(email);
};

const mailAlert = function () {
  if (email.value.trim() !== '' && !mailCheck(email.value)) {
    alert('이메일 형식에 맞게 입력해주세요');
    email.value = '';
  }
};

///// execute
email.addEventListener('blur', mailAlert);

////////////////////////////////////////////////////////////////////////////////
// 아이디 정규식
