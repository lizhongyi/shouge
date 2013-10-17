<?php

/**

 * 

 * 产品

 *

 * @package      	YIGECMS_CORP

 *

 * @license         http://www.YIGECMS.cn/license.txt

 * @version        	$Id: ProductAction.class.php v1.0 2012-01-01 06:59:03 

 */



class ProductAction extends GlobalAction

{

    public $dao, $orderDao;

    function _initialize()

    {

        parent::_initialize();

        $this->dao = M('Product');

        $this->orderDao = D('Order', 'Admin');

        $data['productCategory'] = getCategory($this->globalCategory, 103,0);

        $this->assign('moduleTitle', '产品中心');

		$catelist = $data['productCategory'];



		

        foreach($catelist as $key=>$v)

		

		    { 

			if($catelist[$key]['html_url'] != '' && $this->sysConfig['jingtai'] == 1){

			$catelist[$key]['url'] = "/".$catelist[$key]['html_url'];

			}

			else

			{

			$catelist[$key]['url']=U(MODULE_NAME."/nlist/",array('category'=>$catelist[$key]['id'])); 	

			}

			 }

	

	

	    //当前位置

		   $murl="";

		

	    	if(file_exists("html/".MODULE_NAME."/index.html") && $this->sysConfig['jingtai']==1){

		       $murl="/html/".MODULE_NAME."/index.html";	

			}else{

			 $murl=	U(MODULE_NAME."/index");

		     }

		  

         

           $category = intval($_GET['category']);

		

	

		

		 $data['productCategory'] = getCategory($this->globalCategory, 103,0);

      

		  

		  foreach($catelist as $k=>$v)

		  

		   {

			  if($v['id'] ==  $category)

			  {

				$catename = $v['title']; 

				$pid  = $v['parent_id'];

				$catid =$v['id'];

 			  }

				

			

				

			if($v['id'] == $category || $v['parent_id'] == $category)

			

			   {

				$cate .=$v['id'].",";   

			   }

		   }

		  

		$cate = substr($cate,0,-1);

		$condition['category_id'] = array('in',$cate);

        $condition['a.status'] = array('eq', 0);

		$this->assign("catelist",$catelist);

		$this->assign("cat_id",$category);

		$this->assign('murl',$murl);

        $this->assign('category',$category);

    }

    

    /**

     * 新闻列表

     *

     */

    public function index()

    {

        $category = intval($_GET['category']);

		if($category)

		{

        $category || $condition['category_id'] = array('eq', $category);

		}

		

        $condition['a.status'] = array('eq', 0);

        $this->assign('category', $category);

        parent::getJoinList($condition, 'a.id DESC', 12, C('DB_PREFIX').'product a', C('DB_PREFIX').'category b on a.category_id=b.id','a.*, b.title as categoryName');

    }

	

	

	

	 public function plist()

    {

		global $p_cate;

        $category = intval($_GET['category']);

		

	

		

		 $data['productCategory'] = getCategory1($this->globalCategory, 6,0);

          $p_cate      = $data['productCategory'];

		  

		  foreach( $p_cate as $k=>$v)

		  

		   {

			  if($v['id'] ==  $category)

			  {

				$catename = $v['title']; 

				$pid  = $v['parent_id'];

				$catid =$v['id'];

 			  }

				

			

				

			if($v['id'] == $category || $v['parent_id'] == $category)

			

			   {

				$cate .=$v['id'].",";   

			   }

		   }

		  

		$cate = substr($cate,0,-1);

		$condition['category_id'] = array('in',$cate);

        $condition['a.status'] = array('eq', 0);

		$pname = get_parent_cat($p_cate,$pid);

		$this->assign('catid', $catid);

        $this->assign('catename', $catename);

		$this->assign('pname',$pname);

        $this->assign('category',$category);

        parent::getJoinList($condition, 'a.id DESC', 5, C('DB_PREFIX').'product a', C('DB_PREFIX').'category b on a.category_id=b.id','a.*, b.title as categoryName');

    }

	

	

	

	

    

    /**

     * 浏览内容页

     *

     */

    public function detail(){

        $titleId = intval($_GET['item']);

        $commentCount = M('Comment')->where("title_id={$titleId} and module='Product'")->count();

        $this->assign('commentCount', $commentCount);

        parent::getJoinDetail(array("a.id={$titleId}", "id={$titleId}"), 'view_count', C('DB_PREFIX').'product a', C('DB_PREFIX').'category b on a.category_id=b.id','a.*, b.title as categoryName');

    }//静态浏览内容页面

	public function hdetail(){

        $titleId = intval($_GET['item']);

        $commentCount = M('Comment')->where("title_id={$titleId} and module='Product'")->count();

        $this->assign('commentCount', $commentCount);

        parent::getJoinDetail(array("a.id={$titleId}", "id={$titleId}"), 'view_count', C('DB_PREFIX').'product a', C('DB_PREFIX').'category b on a.category_id=b.id','a.*, b.title as categoryName');

    }



    /**

     * 提交订单

     *

     */

    public function doOrder()

    {

        $verifyCode = intval(trim($_POST['verifyCode']));

        empty($verifyCode) && parent::_message('error', '验证码必须填写');

        if(md5($verifyCode) != Session::get('verify'))

        {

            parent::_message('error', '验证码错误');

        }

        if($daoCreate = $this->orderDao->create())

        {

            $daoAdd = $this->orderDao->add();

            if(false !== $daoAdd)

            {

                parent::_message('success', '订单提交成功，等待管理员处理');

            }else

            {

                parent::_message('error', '订单提交失败，请检查必填项');

            }

        }else

        {

            parent::_message('error', $this->orderDao->getError());

        }

    }

}