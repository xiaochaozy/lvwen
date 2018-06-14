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

class main extends AWS_CONTROLLER
{
	public function get_access_rule()
	{
		$rule_action['rule_type'] = 'white'; //黑名单,黑名单中的检查  'white'白名单,白名单以外的检查
		$rule_action['actions'] = array('index','pay','zhifu');
		return $rule_action;
	}

	public function setup()
	{
		
		$this->crumb(AWS_APP::lang()->_t('支付'), '/pay/');
	}

	public function index_action()
	{		
			$uid=$this->user_id?$this->user_id:0;
			if(isset($_GET['topay'])){
			require_once 'config.php';
			
//exit(var_dump(dirname(__FILE__)));
require_once dirname(__FILE__).'/pagepay/service/AlipayTradeService.php';
if(isset($_GET['from']) && $_GET['from']==1){
	require_once dirname(__FILE__).'/pagepay/buildermodel/AlipayTradeWapPayContentBuilder.php';
}else{
	require_once dirname(__FILE__).'/pagepay/buildermodel/AlipayTradePagePayContentBuilder.php';
}

    //商户订单号，商户网站订单系统中唯一订单号，必填
	$marr=getcache('money');
	$zfid=intval($_GET['zfid']);
	$money=HTTP::get_cookie('test')?0.01:$marr[$zfid]['money'];
	$orderinfo=array(
		'userid'=>$uid,
		'money'=>$money,
		'contactname'=>$marr[$zfid]['title'].'咨询服务',
		'zxid'=>HTTP::get_cookie('askid'),
	);
    $out_trade_no =$this->model('pay')->order($orderinfo);
    //订单名称，必填
    $subject = $orderinfo['contactname'];
    //付款金额，必填
    $total_amount = $money;
    //商品描述，可空
    $body = $orderinfo['contactname'];
	//构造参数
	if(isset($_GET['from']) && $_GET['from']==1){//手机支付
		$payRequestBuilder = new AlipayTradeWapPayContentBuilder();
		$timeout_express="1m";
		$payRequestBuilder->setTimeExpress($timeout_express);
		
	}else{
		$payRequestBuilder = new AlipayTradePagePayContentBuilder();
	}
	$payRequestBuilder->setBody($body);
	$payRequestBuilder->setSubject($subject);
	$payRequestBuilder->setTotalAmount($total_amount);
	$payRequestBuilder->setOutTradeNo($out_trade_no);

	$aop = new AlipayTradeService($config);

	/**
	 * pagePay 电脑网站支付请求
	 * @param $builder 业务参数，使用buildmodel中的对象生成。
	 * @param $return_url 同步跳转地址，公网可以访问
	 * @param $notify_url 异步通知地址，公网可以访问
	 * @return $response 支付宝返回的信息
 	*/
	if(isset($_GET['from']) && $_GET['from']==1){//手机支付
		$response = $aop->wapPay($payRequestBuilder,$config['return_url'],$config['notify_url']);
		
	}else{
		$response = $aop->pagePay($payRequestBuilder,$config['return_url'],$config['notify_url']);
	}
	 

	//输出表单
	var_dump($response);
	}else{
			TPL::assign('trade_sn', $trade_sn);
			TPL::output('pay/pagepay');
	}
			
	}
	
	//同步通知
	public function success_action(){
		require_once("config.php");
		require_once 'pagepay/service/AlipayTradeService.php';

$arr=$_GET;
foreach($arr as $k=>$r){
 if(in_array($k,array('c','act','app'))){
    unset($arr[$k]);
  }
}
//exit(var_dump($arr));
$alipaySevice = new AlipayTradeService($config); 
$result = $alipaySevice->check($arr);

if($result) {//验证成功
	$out_trade_no = htmlspecialchars($_GET['out_trade_no']);

	//支付宝交易号
	$trade_no = htmlspecialchars($_GET['trade_no']);
	//$res=$this->model('pay')->success($out_trade_no);	
	//echo "验证成功<br />支付宝交易号：".$trade_no;
	TPL::output('pay/succ');
}
else {
    //验证失败
    echo "验证失败";
}
		
	}
	
 //异步通知
  public function zfbnotify_action(){
  	require_once 'config.php';
	require_once 'pagepay/service/AlipayTradeService.php';
	$arr=$_POST;
	$alipaySevice = new AlipayTradeService($config); 
	$alipaySevice->writeLog(var_export($_POST,true));
	$result = $alipaySevice->check($arr);
	if($result) {
		$out_trade_no = $_POST['out_trade_no'];
	//支付宝交易号
	$trade_no = $_POST['trade_no'];
	//交易状态
	$trade_status = $_POST['trade_status'];
    if($_POST['trade_status'] == 'TRADE_FINISHED') {

    }
    else if ($_POST['trade_status'] == 'TRADE_SUCCESS') {	
		//注意：
		//付款完成后，支付宝系统发送该交易状态通知
    }
	$res=$this->model('pay')->success($out_trade_no);
	sendmsglog(json_encode($_POST),'zfbpay');
		echo "支付成功！";	
	}else{
		 echo "fail";
	}
  }

	
}
