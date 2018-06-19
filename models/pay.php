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

class pay_class extends AWS_MODEL
{
	public function order($data)
	{
		$trade_sn=create_sn();
		$this->insert('pay_account', array(
			'trade_sn' =>$trade_sn,
			'userid' =>$data['userid'],
			'contactname'=>$data['contactname'],
			'money'=>$data['money'],
			'zxid'=>$data['zxid'],
			'ip'=>ip(),
			'addtime' => time()
		));
		
		return $trade_sn;

	}
	public function success($trade_sn){
		return $this->update('pay_account', array(
				'status' =>'succ'
			), 'trade_sn = "'.$trade_sn.'"');
	}
	
	public function getorder($id){
		$data=$this->fetch_row('pay_account','id =' .$id);
		return $data;	
	}
	public function orderinfo($trade_sn){
		return $this->fetch_row('pay_account','trade_sn = "'.$trade_sn.'"');
	}

	
}
