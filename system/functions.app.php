<?php
/**
 * WeCenter Framework
 *
 * An open source application development framework for PHP 5.2.2 or newer
 *
 * @package		WeCenter Framework
 * @author		WeCenter Dev Team
 * @copyright	Copyright (c) 2011 - 2014, WeCenter, Inc.
 * @license		http://www.wecenter.com/license/
 * @link		http://www.wecenter.com/
 * @since		Version 1.0
 * @filesource
 */

/**
 * WeCenter APP 函数类
 *
 * @package		WeCenter
 * @subpackage	App
 * @category	Libraries
 * @author		WeCenter Dev Team
 */


/**
 * 获取头像地址
 *
 * 举个例子：$uid=12345，那么头像路径很可能(根据您部署的上传文件夹而定)会被存储为/uploads/000/01/23/45_avatar_min.jpg
 *
 * @param  int
 * @param  string
 * @return string
 */
function get_avatar_url($uid, $size = 'min')
{
	$uid = intval($uid);

	if (!$uid)
	{
		return G_STATIC_URL . '/common/avatar-' . $size . '-img.png';
	}

	foreach (AWS_APP::config()->get('image')->avatar_thumbnail as $key => $val)
	{
		$all_size[] = $key;
	}

	$size = in_array($size, $all_size) ? $size : $all_size[0];

	$uid = sprintf("%09d", $uid);
	$dir1 = substr($uid, 0, 3);
	$dir2 = substr($uid, 3, 2);
	$dir3 = substr($uid, 5, 2);

	if (file_exists(get_setting('upload_dir') . '/avatar/' . $dir1 . '/' . $dir2 . '/' . $dir3 . '/' . substr($uid, - 2) . '_avatar_' . $size . '.jpg'))
	{
		return get_setting('upload_url') . '/avatar/' . $dir1 . '/' . $dir2 . '/' . $dir3 . '/' . substr($uid, - 2) . '_avatar_' . $size . '.jpg';
	}
	else
	{
		return G_STATIC_URL . '/common/avatar-' . $size . '-img.png';
	}
}

/**
 * 附件url地址，实际上是通过一定格式编码指配到/app/file/main.php中，让download控制器处理并发送下载请求
 * @param  string $file_name 附件的真实文件名，即上传之前的文件名称，包含后缀
 * @param  string $url 附件完整的真实url地址
 * @return string 附件下载的完整url地址
 */
function download_url($file_name, $url)
{
	return get_js_url('/file/download/file_name-' . base64_encode($file_name) . '__url-' . base64_encode($url));
}

// 检测当前操作是否需要验证码
function human_valid($permission_tag)
{
	if (! is_array(AWS_APP::session()->human_valid))
	{
		return FALSE;
	}

	if (! AWS_APP::session()->human_valid[$permission_tag] or ! AWS_APP::session()->permission[$permission_tag])
	{
		return FALSE;
	}

	foreach (AWS_APP::session()->human_valid[$permission_tag] as $time => $val)
	{
		if (date('H', $time) != date('H', time()))
		{
			unset(AWS_APP::session()->human_valid[$permission_tag][$time]);
		}
	}

	if (sizeof(AWS_APP::session()->human_valid[$permission_tag]) >= AWS_APP::session()->permission[$permission_tag])
	{
		return TRUE;
	}

	return FALSE;
}

function set_human_valid($permission_tag)
{
	if (! is_array(AWS_APP::session()->human_valid))
	{
		return FALSE;
	}

	AWS_APP::session()->human_valid[$permission_tag][time()] = TRUE;

	return count(AWS_APP::session()->human_valid[$permission_tag]);
}

/**
 * 仅附件处理中的preg_replace_callback()的每次搜索时的回调
 * @param  array $matches preg_replace_callback()搜索时返回给第二参数的结果
 * @return string  取出附件的加载模板字符串
 */
function parse_attachs_callback($matches)
{
	if ($attach = AWS_APP::model('publish')->get_attach_by_id($matches[1]))
	{
		TPL::assign('attach', $attach);

		return TPL::output('question/ajax/load_attach', false);
	}
}

/**
 * 获取主题图片指定尺寸的完整url地址
 * @param  string $size
 * @param  string $pic_file 某一尺寸的图片文件名
 * @return string           取出主题图片或主题默认图片的完整url地址
 */
function get_topic_pic_url($size = null, $pic_file = null)
{
	if ($sized_file = AWS_APP::model('topic')->get_sized_file($size, $pic_file))
	{
		return get_setting('upload_url') . '/topic/' . $sized_file;
	}

	if (! $size)
	{
		return G_STATIC_URL . '/common/topic-max-img.png';
	}

	return G_STATIC_URL . '/common/topic-' . $size . '-img.png';
}

/**
 * 获取专题图片指定尺寸的完整url地址
 * @param  string $size     三种图片尺寸 max(100px)|mid(50px)|min(32px)
 * @param  string $pic_file 某一尺寸的图片文件名
 * @return string           取出专题图片的完整url地址
 */
function get_feature_pic_url($size = null, $pic_file = null)
{
	if (! $pic_file)
	{
		return false;
	}
	else
	{
		if ($size)
		{
			$pic_file = str_replace(AWS_APP::config()->get('image')->feature_thumbnail['min']['w'] . '_' . AWS_APP::config()->get('image')->feature_thumbnail['min']['h'], AWS_APP::config()->get('image')->feature_thumbnail[$size]['w'] . '_' . AWS_APP::config()->get('image')->feature_thumbnail[$size]['h'], $pic_file);
		}
	}

	return get_setting('upload_url') . '/feature/' . $pic_file;
}

function get_host_top_domain()
{
	$host = strtolower($_SERVER['HTTP_HOST']);

	if (strpos($host, '/') !== false)
	{
		$parse = @parse_url($host);
		$host = $parse['host'];
	}

	$top_level_domain_db = array('com', 'edu', 'gov', 'int', 'mil', 'net', 'org', 'biz', 'info', 'pro', 'name', 'coop', 'aero', 'xxx', 'idv', 'mobi', 'cc', 'me', 'jp', 'uk', 'ws', 'eu', 'pw', 'kr', 'io', 'us', 'cn');

	foreach ($top_level_domain_db as $v)
	{
		$str .= ($str ? '|' : '') . $v;
	}

	$matchstr = "[^\.]+\.(?:(" . $str . ")|\w{2}|((" . $str . ")\.\w{2}))$";

	if (preg_match('/' . $matchstr . '/ies', $host, $matchs))
	{
		$domain = $matchs['0'];
	}
	else
	{
		$domain = $host;
	}

	return $domain;
}

function parse_link_callback($matches)
{
	if (preg_match('/^(?!http).*/i', $matches[1]))
	{
		$url = 'http://' . $matches[1];
	}
	else
	{
		$url = $matches[1];
	}

	if (stristr($url, 'http://%'))
	{
		return false;
	}

	if (stristr($url, 'http://&'))
	{
		return false;
	}

	if (!preg_match('#^(http|https)://(?:[^<>\"]+|[a-z0-9/\._\- !&\#;,%\+\?:=]+)$#iU', $url))
	{
		return false;
	}

	if (is_inside_url($url))
	{
		return '<a href="' . $url . '">' . FORMAT::sub_url($matches[1], 50) . '</a>';
	}
	else
	{
		return '<a href="' . $url . '" rel="nofollow" target="_blank">' . FORMAT::sub_url($matches[1], 50) . '</a>';
	}
}

function parse_link_callback_bbcode($matches)
{
	if (preg_match('/^(?!http).*/i', $matches[1]))
	{
		$url = 'http://' . $matches[1];
	}
	else
	{
		$url = $matches[1];
	}

	if (stristr($url, 'http://%'))
	{
		return false;
	}

	if (stristr($url, 'http://&'))
	{
		return false;
	}

	if (!preg_match('#^(http|https)://(?:[^<>\"]+|[a-z0-9/\._\- !&\#;,%\+\?:=]+)$#iU', $url))
	{
		return false;
	}

	return '[url=' . $url . ']' . FORMAT::sub_url($matches[1], 50) . '[/url]';
}

function is_inside_url($url)
{
	if (!$url)
	{
		return false;
	}

	if (preg_match('/^(?!http).*/i', $url))
	{
		$url = 'http://' . $url;
	}

	$domain = get_host_top_domain();

	if (preg_match('/^http[s]?:\/\/([-_a-zA-Z0-9]+[\.])*?' . $domain . '(?!\.)[-a-zA-Z0-9@:;%_\+.~#?&\/\/=]*$/i', $url))
	{
		return true;
	}

	return false;
}

function get_weixin_rule_image($image_file, $size = '')
{
	return AWS_APP::model('weixin')->get_weixin_rule_image($image_file, $size);
}

function import_editor_static_files()
{
	TPL::import_js('js/editor/ckeditor/ckeditor.js');
	TPL::import_js('js/editor/ckeditor/adapters/jquery.js');
}

function get_chapter_icon_url($id, $size = 'max', $default = true)
{
	if (file_exists(get_setting('upload_dir') . '/chapter/' . $id . '-' . $size . '.jpg'))
	{
		return get_setting('upload_url') . '/chapter/' . $id . '-' . $size . '.jpg';
	}
	else if ($default)
	{
		return G_STATIC_URL . '/common/help-chapter-' . $size . '-img.png';
	}

	return false;
}

function base64_url_encode($parm)
{
	if (!is_array($parm))
	{
		return false;
	}

	return strtr(base64_encode(json_encode($parm)), '+/=', '-_,');
}

function base64_url_decode($parm)
{
	return json_decode(base64_decode(strtr($parm, '-_,', '+/=')), true);
}

function remove_assoc($from, $type, $id)
{
	if (!$from OR !$type OR !is_digits($id))
	{
		return false;
	}

	return $this->query('UPDATE ' . $this->get_table($from) . ' SET `' . $type . '_id` = NULL WHERE `' . $type . '_id` = ' . $id);
}
//新增function
function create_sn(){
	mt_srand((double )microtime() * 1000000 );
	return date("YmdHis" ).str_pad( mt_rand( 1, 99999 ), 5, "0", STR_PAD_LEFT );
}
/**
 * 返回响应地址
 */
function return_url($code, $is_api = 0){
	if($is_api){
		return APP_PATH.'index.php?m=pay&c=respond&a=respond_post&code='.$code;
	}
	else {
		return APP_PATH.'index.php?m=pay&c=respond&a=respond_get&code='.$code;
	}
}
	
function unserialize_config($cfg){
        if (is_string($cfg) ) {
            $arr = string2array($cfg);
		$config = array();
		foreach ($arr AS $key => $val) {
			$config[$key] = $val['value'];
		}
		return $config;
	} else {
		return false;
	}
}

/**
 * 字符截取 支持UTF8/GBK
 * @param $string
 * @param $length
 * @param $dot
 */
function str_cut($string, $length, $dot = '...') {
	$strlen = strlen($string);
	if($strlen <= $length) return $string;
	$string = str_replace(array(' ','&nbsp;', '&amp;', '&quot;', '&#039;', '&ldquo;', '&rdquo;', '&mdash;', '&lt;', '&gt;', '&middot;', '&hellip;'), array('∵',' ', '&', '"', "'", '“', '”', '—', '<', '>', '·', '…'), $string);
	$strcut = '';
	if(strtolower(CHARSET) == 'utf-8') {
		$length = intval($length-strlen($dot)-$length/3);
		$n = $tn = $noc = 0;
		while($n < strlen($string)) {
			$t = ord($string[$n]);
			if($t == 9 || $t == 10 || (32 <= $t && $t <= 126)) {
				$tn = 1; $n++; $noc++;
			} elseif(194 <= $t && $t <= 223) {
				$tn = 2; $n += 2; $noc += 2;
			} elseif(224 <= $t && $t <= 239) {
				$tn = 3; $n += 3; $noc += 2;
			} elseif(240 <= $t && $t <= 247) {
				$tn = 4; $n += 4; $noc += 2;
			} elseif(248 <= $t && $t <= 251) {
				$tn = 5; $n += 5; $noc += 2;
			} elseif($t == 252 || $t == 253) {
				$tn = 6; $n += 6; $noc += 2;
			} else {
				$n++;
			}
			if($noc >= $length) {
				break;
			}
		}
		if($noc > $length) {
			$n -= $tn;
		}
		$strcut = substr($string, 0, $n);
		$strcut = str_replace(array('∵', '&', '"', "'", '“', '”', '—', '<', '>', '·', '…'), array(' ', '&amp;', '&quot;', '&#039;', '&ldquo;', '&rdquo;', '&mdash;', '&lt;', '&gt;', '&middot;', '&hellip;'), $strcut);
	} else {
		$dotlen = strlen($dot);
		$maxi = $length - $dotlen - 1;
		$current_str = '';
		$search_arr = array('&',' ', '"', "'", '“', '”', '—', '<', '>', '·', '…','∵');
		$replace_arr = array('&amp;','&nbsp;', '&quot;', '&#039;', '&ldquo;', '&rdquo;', '&mdash;', '&lt;', '&gt;', '&middot;', '&hellip;',' ');
		$search_flip = array_flip($search_arr);
		for ($i = 0; $i < $maxi; $i++) {
			$current_str = ord($string[$i]) > 127 ? $string[$i].$string[++$i] : $string[$i];
			if (in_array($current_str, $search_arr)) {
				$key = $search_flip[$current_str];
				$current_str = str_replace($search_arr[$key], $replace_arr[$key], $current_str);
			}
			$strcut .= $current_str;
		}
	}
	return $strcut.$dot;
}
function ip() {
    $src_ip = $_SERVER['HTTP_Cdn-Src-Ip'];
    if($src_ip=='')
    {
        if($_SERVER["HTTP_CDN_SRC_IP"] && strcasecmp($_SERVER["HTTP_CDN_SRC_IP"], 'unknown')) {
            $ip = $_SERVER["HTTP_CDN_SRC_IP"];
        }else if($_SERVER['HTTP_CLIENT_IP'] && strcasecmp($_SERVER['HTTP_CLIENT_IP'], 'unknown')) {
            $ip = $_SERVER['HTTP_CLIENT_IP'];
        } elseif($_SERVER['HTTP_X_FORWARDED_FOR'] && strcasecmp($_SERVER['HTTP_X_FORWARDED_FOR'], 'unknown')) {
            $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
        } elseif(getenv('REMOTE_ADDR') && strcasecmp(getenv('REMOTE_ADDR'), 'unknown')) {
            $ip = getenv('REMOTE_ADDR');
        } elseif(isset($_SERVER['REMOTE_ADDR']) && $_SERVER['REMOTE_ADDR'] && strcasecmp($_SERVER['REMOTE_ADDR'], 'unknown')) {
            $ip = $_SERVER['REMOTE_ADDR'];
        }
    }
    else
    {
        $ip =  $src_ip;
    }
	return preg_match ( '/[\d\.]{7,15}/', $ip, $matches ) ? $matches [0] : '';
}

function getcache($filename){
	define("BASE_PATH",str_ireplace(str_replace("/","\\",$_SERVER['PHP_SELF']),'',__FILE__)."\\");
    return include(BASE_PATH.'system'.DIRECTORY_SEPARATOR.'file'.DIRECTORY_SEPARATOR.$filename.'.cache.php');
}

function get_real_city($ip='') {
    if(!$ip){
        $ip=ip();
    }
    if(strpos($ip, '127') === 0 || strpos($ip, '192') === 0)
    {
        $ip='222.173.27.115';
    }
    //新版ip库 下载地址http://www.ipip.net/download.html 更新版本日期20170704  updatebychao
        $ipcity = pc_base::load_sys_class('IP');
        $res=$ipcity->find($ip);
        $province=$res[1];
        $city=$res[2];
        $wcity = getcache('newipcity');
        foreach($wcity as $k1=>$r1){
            if($r1[0]==$city){
                $city=$r1[1];
                break;
            }
        }
	//匹配改地区对应的linkageid
	$city_cache = getcache('1');
	$city_cache = $city_cache['data'];
	
	$province_id = $city_id = 0;
	
	if ($province != '未知' && !empty($province)){
		//匹配省	
		foreach ($city_cache as $v){
			if (empty($v['parentid'])){
				if (strpos($v['name'], $province) !== false){
					$province_id = $v['linkageid'];
					$province_py = $v['spell'];
					$province_name = $v['name'];
					$prov_classify=$v['classify'];
					break;
				}
			}
		}
		/**
		 * 主要解决的是直辖市问题
		 * ip地址到北京市。（找了上面的省，再找下面的市时$city_id为0）
		 */
		if(!in_array($province,array('北京','上海','重庆','天津','香港','澳门')) && !empty($city)){
			//匹配市
			foreach ($city_cache as $v){
				if ($v['parentid'] == $province_id){
					if (strpos($v['name'], $city) !== false){
						$city_id = $v['linkageid'];
						$city_py = $v['spell'];
						$city_name = $v['name'];
						$city_classify=$v['classify'];
						break;
					}
				}
			}
		}else{
			$city_id = $province_id;
			$city_py = $province_py;
			$city_classify = $prov_classify;
		}
	}
	unset($city_cache);
	//构造返回数组
	if ($city_id==0) $city_id = $province_id;
	if ($city_id==0) $city_id = 261;
	
	$subsite_list = getcache('substation_1');
		foreach ($subsite_list as $v){    //匹配省份URL
			if (empty($v['parentid'])){
				if ($v['linkageid'] == $province_id){
					$province_url = $v['url'];
					break;
				}
			}
		}
		foreach ($subsite_list as $v){    //匹配城市URL
			if ($v['parentid'] == $province_id){
				if ($v['linkageid'] == $city_id){
					$city_url = $v['url'];
					break;
				}
			}
		}
	unset($subsite_list);
	if($province_id<6)
		$city_url =  $province_url ;
	
	$real_city = array(
		'ip' => $ip,
		's' => $province,
		'c' => $city,
		's_areaid' => $province_id,
		'areaid' => $city_id,		
        'c_areaid' => $city_id,		
		's_areapy' => $province_py,
		'c_areapy' => $city_py,		
		's_arean' => $province_name,
		'c_arean' => $city_name,
		's_url' => $province_url,
		'c_url' => $city_url,
		's_level'=>$prov_classify,
		'c_level'=>$city_classify

	);
	
	return $real_city;
}
