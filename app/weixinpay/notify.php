<?php
ini_set('date.timezone','Asia/Shanghai');
error_reporting(E_ERROR);
require_once "classes/WxPayApi.class.php";
require_once 'classes/WxPay.Notify.php';
require_once 'classes/log.php';
require_once '../../system/system.php';


//初始化日志
$logHandler= new CLogFileHandler("logs/".date('Y-m-d').'.log');
$log = Log::Init($logHandler, 15);


class PayNotifyCallBack extends WxPayNotify
{
	//查询订单
	public function Queryorder($transaction_id)
	{
		$input = new WxPayOrderQuery();
		$input->SetTransaction_id($transaction_id);
		$result = WxPayApi::orderQuery($input);

		Log::DEBUG("query:". json_encode($result));
		if(array_key_exists("return_code", $result)
			&& array_key_exists("result_code", $result)
			&& $result["return_code"] == "SUCCESS"
			&& $result["result_code"] == "SUCCESS")
		{
			$mysql=new AWS_MODEL();
			$orderinfo=$mysql->fetch_row('pay_account','trade_sn ="'.$result['out_trade_no'].'"');
			$sql1="update ask_pay_account set `status`='succ' where trade_sn='".$result['out_trade_no']."'";
			$mysql->query($sql1);
			return true;
		}
		return false;
	}
	
	//重写回调处理函数
	public function NotifyProcess($data, &$msg)
	{
		Log::DEBUG("call back:" . json_encode($data));
		$notfiyOutput = array();
		
		if(!array_key_exists("transaction_id", $data)){
			$msg = "输入参数不正确";
			return false;
		}
		//查询订单，判断订单真实性
		if(!$this->Queryorder($data["transaction_id"])){
			$msg = "订单查询失败";
			return false;
		}
		return true;
	}

	function curl_function($url, $data=array(),$type="POST",$time=10){
		if(trim($url) == ''){ return "";}
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_CUSTOMREQUEST, $type);
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
		curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
		curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (compatible; MSIE 5.01; Windows NT 5.0)');
		curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
		curl_setopt($ch, CURLOPT_AUTOREFERER, 1);
		curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($ch, CURLOPT_TIMEOUT,$time);

		$tmpInfo = curl_exec($ch);

		###$fp = fopen("ran.log", "a+");
		###fwrite($fp, $tmpInfo."\n");
		###fclose($fp);

		if (curl_errno($ch)) {
			//echo curl_errno($ch);
			$tmpInfo = array(
				"errcode"=>"999",
				"errmsg"=>"not ok",
				"msgid"=>"0",
			);
			$tmpInfo = json_encode($tmpInfo);
		}
		curl_close($ch);

		return $tmpInfo;
	}
}

Log::DEBUG("begin notify");
$notify = new PayNotifyCallBack();
$notify->Handle(false);
