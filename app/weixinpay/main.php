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

include(ROOT_PATH.'app'.DIRECTORY_SEPARATOR.'weixinpay'.DIRECTORY_SEPARATOR.'classes'.DIRECTORY_SEPARATOR."WxPayApi.class.php");
include(ROOT_PATH.'app'.DIRECTORY_SEPARATOR.'weixinpay'.DIRECTORY_SEPARATOR.'classes'.DIRECTORY_SEPARATOR."NativePay.class.php");
include(ROOT_PATH.'app'.DIRECTORY_SEPARATOR.'weixinpay'.DIRECTORY_SEPARATOR.'classes'.DIRECTORY_SEPARATOR."log.php");

class main extends AWS_CONTROLLER
{
    public function get_access_rule()
    {
        $rule_action['rule_type'] = 'black';
        $rule_action['actions'] = array();

        return $rule_action;
    }

    public function index_action()
    {
		$uid=$this->user_id?$this->user_id:0;
		$marr=getcache('money');
		$zfid=1;  //intval($_GET['zfid']);
		$money=HTTP::get_cookie('test')?0.01:$marr[$zfid]['money'];
		$orderinfo=array(
			'userid'=>$uid,
			'money'=>$money,
			'contactname'=>$marr[$zfid]['title'].'咨询服务',
			'zxid'=>intval($_GET['zxid'])
		);
    	$out_trade_no =$this->model('pay')->order($orderinfo);
	
		$notify = new NativePay();
		$input = new WxPayUnifiedOrder();
        
		$orderid=$out_trade_no;
		$orderinfo['contactname']=$marr[$zfid]['title'].'咨询服务';
		$input->SetBody($orderinfo['contactname']);
		$input->SetAttach($orderinfo['contactname']);
		$input->SetGoods_tag($orderinfo['contactname']);
		
		$time=time();
		$ip=ip();
		$input->SetOut_trade_no($orderid);
		$input->SetTotal_fee($money*100);
		$input->SetTime_start(date("YmdHis"));
		$input->SetTime_expire(date("YmdHis", time() + 600));
		$input->SetNotify_url("http://www.lvwen360.com/app/weixinpay/notify.php");
		if(isset($_GET['from']) && $_GET['from']==1){
			$input->SetTrade_type("MWEB");
		}else{
		$input->SetTrade_type("NATIVE");
		}
		//$input->SetTrade_type("MWEB");
		
		$input->SetProduct_id("123456789");
        $input->SetSpbill_create_ip($ip);
        //echo $input->GetSpbill_create_ip();
        //echo '<br/>';
		
		try
 		{
			$result = $notify->GetPayUrl($input);
			//exit(var_dump($result));
			if(isset($_GET['from']) && $_GET['from']==1){
				$redirect='https://www.lvwen360.com/?/m/succeed/';
				$result['mweb_url'].='&redirect_url='.urlencode($redirect);
				//echo $result['mweb_url'].'<br/>';
				$tmpInfo = array(
            		"mweb_url"=>$result['mweb_url'],
            		"orderid"=>$out_trade_no,
				);
			}else{
				$tmpInfo = array(
            		"url"=>$result["code_url"],
            		"orderid"=>$out_trade_no,
				);
			}
 		}
		catch(Exception $e)
 		{
 			echo 'Message: ' .$e->getMessage();
			$tmpInfo = array(
            "url"=>'Message: ' .$e->getMessage(),
            "orderid"=>$out_trade_no,
        );
 		}
		
		
        $tmpInfo = json_encode($tmpInfo);
        echo $tmpInfo;
		exit;
		/*
        $key=md5('XXXXXpay'.date("md"));

        $redirect='http://www.lvwen360.com/?/weixinpay/succ/';
        $result['mweb_url'].='&redirect_url='.urlencode($redirect);

        $tmpInfo = json_encode($result);
		*/
        //echo $input->GetSpbill_create_ip();
        //echo '<br/>';
        //echo $tmpInfo;
		 /*
		$url2 = $result["code_url"];

		$key=md5('XXXXXpay'.date("md"));
		include template('pay','weixinpay');
        */
        //include template('weixinpay','weixinpay');
    }
	public function getstatus_action()
    {
		exit(var_dump(8989));
	}
}
