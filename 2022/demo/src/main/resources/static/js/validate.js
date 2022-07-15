/**
 * 빈 값 확인
 * @returns 빈 값이면 true, 아니면 false
 */
function isEmpty(value) {
	if(value === '') {
		return ture;
	} else {
		return false;
	}
}

/**
 * 아이디 검사
 * 영문 대소문자, 숫자, 특수문자 '_' 허용, 4~12자리
 * @returns 조건을 충족하면 true, 아니면 false
 */
function validateId(value) {
	const regex = /^[a-zA-Z0-9_]{4,12}$/g;
	return regex.test(value);
}

/**
 * 비밀번호 검사
 * 영문 대소문자, 숫자, 특수문자 조합 8~20자리
 * @returns 조건을 충족하면 true, 아니면 false
 */
function validatePassword(value) {
	if(/\s/g.test(value)) {
		return false;
	}
	
	const regex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[~`!@#$%^&*()_+=[\]\\{}|;':",.\/<>?-]).{8,20}$/;
	return regex.test(value);
}

/**
 * 이름 검사
 * 한글 또는 영문 대소문자 2~20자리
 * @returns 조건을 충족하면 true, 아니면 false
 */
function validateName(value) {
	const regex_ko = /^[가-힣]{2,20}$/;
	const regex_en = /^[a-zA-Z]{2,20}$/;
	
	if(regex_ko.test(value)) {
		return true;
	} else if(regex_en.test(value)) {
		return true;
	} else {
		return false;
	}
}

/**
 * 이메일 검사
 * @returns 조건을 충족하면 true, 아니면 false
 */
function validateEmail(value) {
	const regex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	return regex.test(value);
}

/**
 * 전화번호 검사
 * ex) 010-1234-5678
 * @returns 조건을 충족하면 true, 아니면 false
 */
function validateMobile(value) {
	const regex = /^01([0|1|6|7|8|9]?)-(\d{3,4})-(\d{4})$/;
	return regex.test(value);
}