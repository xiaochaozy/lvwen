<?php
/*
+--------------------------------------------------------------------------
|   WeCenter [#RELEASE_VERSION#]
|   ========================================
|   by WeCenter Software
|   © 2011 - 2014 WeCenter. All Rights Reserved
|   http://www.wecenter.com
|   ========================================
|   Support: WeCenter@qq.com
|
+---------------------------------------------------------------------------
*/

if (!defined('IN_ANWSION'))
{
	die;
}

class other_class extends AWS_MODEL
{
	public function updatename($uid,$nickname){
		$update_data=array(
		  'nickname'=>$nickname,
		  'nicknametime'=>time(),
		);
		return $this->update('users', $update_data, 'uid = ' . intval($uid));
	}
	public function updatemobile($uid,$mobile){
		$update_data=array(
		  'mobile'=>$mobile,
		);
		return $this->update('users', $update_data, 'uid = ' . intval($uid));
	}
}