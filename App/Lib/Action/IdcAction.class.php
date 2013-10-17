<?php

/**

 * 

 * 新闻

 *

 * @package      	YIGECMS_CORP

 *

 * @license         http://www.YIGECMS.cn/license.txt

 * @version        	$Id: ArticleAction.class.php v1.0 2012-01-01 06:59:03 

 */



class IdcAction extends GlobalAction

{

    public $dao;

    function _initialize()

    {

        parent::_initialize();

        $this->dao = M('Idc');

        $this->assign('moduleTitle', '企业文化');

        $data['IdcCategory'] = getCategory($this->globalCategory, 72,0);

        $this->assign($data);

		$p_cate      = $data['IdcCategory'];

        $this->assign('pp_c',$p_cate);

		 $data['IdcCategory'] = getCategory1($this->globalCategory,72,0);

          $p_cate      = $data['IdcCategory'];

		  

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

		

		//$idc_list = M('Idc')->select();

		//print_r($idc_list);

		//print_r($pname);

		$this->assign('catid', $catid);

        $this->assign('catename', $catename);

		$this->assign('pname',$pname);

        $this->assign('category', $category);

		

    }

    

    /**

     * 列表

     *

     */

    public function index()

    {    

	    $pages = 15;

        $category = intval($_GET['category']);

        $category && $condition['category_id'] = array('eq', $category);

        $condition['a.status'] = array('eq', 0);

        $this->assign('category',$category);

        parent::getJoinList($condition, 'a.id DESC', $pages, C('DB_PREFIX').'idc a', C('DB_PREFIX').'category b on a.category_id=b.id','a.*, b.title as categoryName');

    }

		

  

    

    /**

     * 内容

     *

     */

    public function detail(){

        $titleId = intval($_GET['item']);

        $commentCount = M('Comment')->where("title_id={$titleId} and module='Article'")->count();

        $this->assign('commentCount', $commentCount);

        parent::getJoinDetail(array("a.id={$titleId}", "id={$titleId}"), 'view_count', C('DB_PREFIX').'idc a', C('DB_PREFIX').'category b on a.category_id=b.id','a.*, b.title as categoryName');

    }

}