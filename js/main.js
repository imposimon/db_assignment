$(document).ready(initPage);

function initPage() {
	refreshTab();
	
	$('.btn').bind('click', btnListener);	
}

function refreshTab() {
	var tabName = location.href.split('#')[1];
	if(tabName) {
		$('#myTab a[href="#'+tabName+'"]').tab('show');
	}
}

function btnListener() {
	var id = this.id;
	switch (id) {
		case 'modPwdBtn':
			$('#modPwdForm').show('slow');
		break;		
		case 'modMailBtn':
			$('#modMailForm').show('slow');
		break;
		case 'cancelModPwd':
			$('#modPwdForm').hide('slow');
		break;
		case 'cancelModMail':
			$('#modMailForm').hide('slow');
		break;
		default:
		break;
	}
}

