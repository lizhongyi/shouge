<?php
/**
 * 
 * Global(全局)
 *
 * @package      	YIGECMS
 *
 * @license         http://www.YIGECMS.cn/license.txt
 * @version        	$Id: GlobalAction.class.php v1.0 2012-01-01 06:59:03 

 */

class GlobalAction extends Action
{
    public $globalCategory, $globalMenu, $sysConfig;
    /**
     * 初始化
     *
     */
    function _initialize()
    {
        //取配置
        if(fileExit('./cms.config.php')){
            $this->sysConfig = require_once('./cms.config.php');
			//exit("到这一步了");
        }else{
            $this->sysConfig = M('Config')->where('id=1')->find(); 
			
        }
         //获取登陆session
	     

        
		 if(Cookie::get('userID') != ""){
		 $this->cuname          =Cookie::get('realname')==""?Cookie::get('username'):Cookie::get('realname'); 
		 $this->userID          = Cookie::get('userID'); 
		 $this->roleID         = intval(Cookie::get('roleID'));
		 }
		 else
		   
		 {  
		    $this->roleID         = intval(Session::get('roleID'));
		    $this->userID         = intval(Session::get('userID'));
			$this->cuname =        Session::get('realname')==""?Session::get('username'):Session::get('realname');
		  }
		 
		 $this->jingtai=$this->sysConfig['jingtai'];
         if($this->userID){
	     $this->assign('username', $this->cuname);
		 $this->assign('userid', $this->userID);
		 $this->assign('roleID',$this->roleID);
		  }
        //检测是否停止
		
		$this->login_url =U('User/login',array('jumpUri'=>safe_b64encode($_SERVER['REQUEST_URI'])));
		$this->assign('loginUrl',$this->login_url);
        $this->assign('sysConfig', $this->sysConfig);
		$this->assign('jingtai', $this->sysConfig['jingtai']);
		
	   // $this->assign('jingtai',$this->sysConfig['jingtai']);
		//exit(print_r($this->sysConfig));
		
        /*if($sysConfig['web_status'] == 1){
            $this->display('Public:stop');
            exit();
        }
		*/
        //取分类
        $this->globalCategory = getCache('Category');
		//echo "<pre>";
      // print_r($this->globalCategory);
        //取导航
        $this->globalMenu = getCache('Menu');
		
		 $this->assign('globalcat',getCategory($this->globalCategory,6,0));
		
        $this->assign('globalMenu', $this->globalMenu);
	


		
		

        //导入函数
        Load('extend');
        //导入分页类
        //import("ORG.Util.Page");
		 include_once('includes/Page.class.php');
        $this->assign('module', MODULE_NAME);
		
	  
		// 
		
		
	
    }

	
    /**
     * 数据列表
     *
     * @param $conditions 条件
     * @param $orders 排序
     * @param $listRows 每页显示数量
     * @param $joind 是否表关联
     * @param $table 关联表
     * @param $join 
     * @param $fields 取字段
     */
    public function getList($conditions = '', $orders = '' , $listRows = '')
    {
        $condition = !empty($conditions) ? $conditions : '' ;
        $pageCount = $this->dao->where($condition)->count();
        $listRows = empty($listRows) ? 15 : $listRows;
        $orderd = empty($orders) ? 'id DESC' : $orders;
        $paged = new page($pageCount, $listRows);
        $dataContentList = $this->dao->Where($condition)->Order($orderd)->Limit($paged->firstRow.','.$paged->listRows)->select();
		
		if($_GET['html']==1 && $this->sysConfig['jingtai']==1){
        $pageContentBar = $paged->show_html();
		}
		else
		{
			$pageContentBar = $paged->show();
		}
      
		//打印列表
		//echo "<pre>";
		//print_r($dataContentList);
		if($pageCount < 1){
			$xinxi="暂时没有数据";
			}
			else
			{
			$xinxi="";	
		    }
			
			
		foreach($dataContentList as $k=>$v)
		{ 
		  if($dataContentList[$k]['html_url'] != "" && $this->sysConfig['jingtai']==1  && file_exists($dataContentList[$k]['html_url'])){
		   $dataContentList[$k]['url']="/".$dataContentList[$k]['html_url'];
		   }
           else
		   {
			  $dataContentList[$k]['url']=U(MODULE_NAME."/detail/",array('item'=>$dataContentList[$k]['id'])); 
		   }
		}	
		//print_r($dataContentList);
		$this->assign('xinxi',$xinxi); 
		
		
        $pageContentBar = $paged->show();
        $this->assign('dataContentList', $dataContentList);
        $this->assign('pageContentBar', $pageContentBar);
        $this->display();
    }

    /**
     * 数据列表,表关联
     *
     * @param $conditions 条件
     * @param $orders 排序
     * @param $listRows 每页显示数量
     * @param $joind 是否表关联
     * @param $table 关联表
     * @param $join 
     * @param $fields 取字段
     */
    public function getJoinList($conditions = '', $orders = '' , $listRows = '', $table = '', $join = '', $fields = '')
    {   
        $condition = !empty($conditions) ? $conditions : '' ;
        $pageCount = $this->dao->Where($condition)->Table($table)->Join($join)->Field($fields)->count();
        $listRows = empty($listRows) ? 10 : $listRows;
        $orderd = empty($orders) ? 'id DESC' : $orders;
        $paged = new page($pageCount, $listRows);
        $dataContentList = $this->dao->Table($table)->join($join)->field($fields)->Where($condition)->Order($orderd)->Limit($paged->firstRow.','.$paged->listRows)->select();
		if($_GET['html']==1 && $this->sysConfig['jingtai']){
        $pageContentBar = $paged->show_html();
		}
		else
		{
			$pageContentBar = $paged->show();
		}
      
		//打印列表
		//echo "<pre>";
		//print_r($dataContentList);
		if($pageCount < 1){
			$xinxi="暂时没有数据";
			}
			else
			{
			$xinxi="";	
		    }
			
			
		foreach($dataContentList as $k=>$v)
		{ 
		  if($dataContentList[$k]['html_url'] != "" && $this->sysConfig['jingtai']==1 && file_exists($dataContentList[$k]['html_url'])){
		   $dataContentList[$k]['url']="/".$dataContentList[$k]['html_url'];
		   }
           else
		   {
			  $dataContentList[$k]['url']=U(MODULE_NAME."/detail/",array('item'=>$dataContentList[$k]['id'])); 
		   }
		}	
	    
		$this->assign('xinxi',$xinxi); 
		$this->assign('dataContentList', $dataContentList);
        $this->assign('pageContentBar', $pageContentBar);
        $this->display();
    }

    /**
     * 数据集
     *
     * @param $conditions 条件
	 *
     */
    public function getDetail($conditions = '', $viewCount = false)
    {
        empty($conditions) && self::_message('errorUri', '查询条件丢失', U('Index/index'));
        $contentDetail = $this->dao->Where($conditions)->find();
        empty($contentDetail) && self::_message('errorUri', '记录不存在', U('Index/index'));
		//更新查看次数
		$viewCount && $this->dao->Where($condition2)->setInc($viewCount,1);
        $this->assign('contentDetail', $contentDetail);
        $this->display($contentDetail['template']);
    }

    /**
     * 数据集,表关联
     * 此处查询条件可能为数组
     * @param $conditions 条件
     * @param $joind 是否表关联
     * @param $table 关联表
     * @param $join 
     * @param $fields 取字段
     */
    public function getJoinDetail($conditions = '', $viewCount = false, $table = '', $join = '', $fields = '')
    {
        empty($conditions) && self::_message('errorUri', '查询条件丢失', U('Index/index'));
		
		$condition1 = is_array($conditions) ? $conditions[0] : $conditions;
		$condition2 = is_array($conditions) ? $conditions[1] : $conditions;

        //print_r($condition1);
        $contentDetail = $this->dao->Table($table)->Join($join)->Field($fields)->Where($condition1)->find();
		$shangyipian  = $this->dao->Table($table)->Join($join)->Field($fields)->Where('a.id > '. $contentDetail['id'].' and a.category_id='.$contentDetail['category_id'])->limit('1')->order('a.id asc')->find();
		
		$xiayipian  = $this->dao->Table($table)->Join($join)->Field($fields)->Where('a.id < '. $contentDetail['id'].' and a.category_id='.$contentDetail['category_id'])->limit('1')->order('a.id desc')->find();
		
		
		
		if($shangyipian['html_url'] != "" && $this->sysConfig['jingtai']==1 && file_exists($dataContentList[$k]['html_url'])){
			if($shangyipian['title'] != ""){
			$shang_link="<a href='/".$shangyipian['html_url']."'>".$shangyipian['title']."</a>";
			}else{
				$shang_link="没有了";
				}
			}
			else
			{
				
			if($shangyipian['title'] != ""){	
			$shang_link="<a href=".U(MODULE_NAME."/detail/",array('item'=>$shangyipian['id'])).">".$shangyipian['title']."</a>";	}
			else{
				$shang_link="没有了";
				}
			}
			
			
		if($xiayipian['html_url'] != "" && $this->sysConfig['jingtai']==1 && file_exists($dataContentList[$k]['html_url'])){
			
			$xia_link="<a href='/".$xiayipian['html_url']."'>".$xiayipian['title']."</a>";
		
			}
			else
			{
			$xia_link="<a href=".U(MODULE_NAME."/detail/",array('item'=>$xiayipian['id'])).">".$xiayipian['title']."</a>";	
			}	
		
		
        empty($contentDetail) && self::_message('errorUri', '记录不存在', U('Index/index'));
		//更新查看次数
		$viewCount && $this->dao->Where($condition2)->setInc($viewCount,1);
		
		$this->assign('shang_link', $shang_link);//上一篇
		$this->assign('xia_link', $xia_link);//上一篇
        $this->assign('contentDetail', $contentDetail);
        $this->display($contentDetail['template']);
    }
	
    /**
     * 验证码
     *
     */
    function verify()
    {
        import('ORG.Util.Image');
        Image::buildImageVerify();
    }

    /**
     * 输出信息
     *
     * @param $type
     * @param $content
     * @param $jumpUrl
     * @param $time
     * @param $ajax
     */
    protected function _message($type = 'success', $content = '更新成功', $jumpUrl = __URL__, $time = 3, $ajax = false)
    {
        $jumpUrl = empty($jumpUrl) ? __URL__ : $jumpUrl ;
        switch ($type){
            case 'success':
                $this->assign('jumpUrl', $jumpUrl);
                $this->assign('waitSecond', $time);
                $this->success($content, $ajax);
                break;
            case 'error':
                $this->assign('jumpUrl', 'javascript:history.back(-1);');
                $this->assign('waitSecond', $time);
                $this->assign('error', $content);
                $this->error($content, $ajax);
                break;
            case 'errorUri':
                $this->assign('jumpUrl', $jumpUrl);
                $this->assign('waitSecond', $time);
                $this->assign('error', $content);
                $this->error($content, $ajax);
                break;
            default:
                die('error type');
                break;
        }
    }
}

